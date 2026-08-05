use std::path::{Path, PathBuf};
use std::sync::atomic::Ordering as AtomicOrdering;
use std::sync::{mpsc, Arc};

use crate::config::{load_last_directory, save_last_directory};
use crate::connect::progress::{hide_overlay, show_overlay};
use crate::connect::rules_ops::refresh_outdated_or_recompute;
use crate::connect::sync::sync_files;
use crate::files::{collect_files_async, enumerate_folder_contents, sort_files, ItemStruct, ScanProgress};
use crate::state::SharedState;
use crate::ui::state_ui::SharedGuiState;

/// Pick a sensible starting directory for a file chooser.
///
/// Falls back through: remembered directory (persisted across sessions) ->
/// directory of the most recently added file -> none (chooser default).
fn initial_dialog_directory(state: &SharedState) -> Option<PathBuf> {
    if let Some(dir) = load_last_directory() {
        return Some(dir);
    }

    let last_added = state.borrow().files.last().map(|item| PathBuf::from(&item.path));
    last_added.filter(|p| p.is_dir())
}

fn apply_initial_directory(dialog: rfd::AsyncFileDialog, state: &SharedState) -> rfd::AsyncFileDialog {
    match initial_dialog_directory(state) {
        Some(dir) => dialog.set_directory(dir),
        None => dialog,
    }
}

/// Remember where the user last browsed, so the next chooser opens there.
fn remember_directory(picked: &[PathBuf], is_folder_pick: bool) {
    let Some(last) = picked.last() else { return };
    // Folder picks land *in* the chosen directory; file picks land in its parent.
    let dir: Option<&Path> = if is_folder_pick { Some(last.as_path()) } else { last.parent() };
    if let Some(dir) = dir {
        save_last_directory(dir);
    }
}

pub fn pick_files_and_add(state: &SharedState, store: &gio::ListStore, gui_state: &SharedGuiState) {
    let state = state.clone();
    let store = store.clone();
    let gui_state = gui_state.clone();
    glib::spawn_future_local(async move {
        let dialog = apply_initial_directory(rfd::AsyncFileDialog::new(), &state).set_title("Add files");
        let files = dialog.pick_files().await;
        let Some(files) = files else { return };
        let paths: Vec<PathBuf> = files.into_iter().map(|f| f.path().into()).collect();
        remember_directory(&paths, false);
        let sorted = sort_files(paths);
        start_async_scan(&sorted, &state, &store, &gui_state, "Adding files…");
    });
}

pub fn add_cli_paths(state: &SharedState, store: &gio::ListStore, gui_state: &SharedGuiState, paths: crate::cli_arguments::CliPaths) {
    if paths.is_empty() {
        return;
    }

    let mut items: Vec<PathBuf> = Vec::new();
    items.extend(sort_files(paths.files));
    if !paths.folders_normal.is_empty() {
        items.extend(enumerate_folder_contents(paths.folders_normal, false, false));
    }
    if !paths.folders_recursive.is_empty() {
        items.extend(enumerate_folder_contents(paths.folders_recursive, true, false));
    }
    if !paths.folders_recursive_skip.is_empty() {
        items.extend(enumerate_folder_contents(paths.folders_recursive_skip, true, true));
    }

    if !items.is_empty() {
        start_async_scan(&items, state, store, gui_state, "Reading file metadata…");
    }
}

pub fn pick_folders_into_state(state: &SharedState, store: &gio::ListStore, gui_state: &SharedGuiState, window: &adw::ApplicationWindow) {
    let state = state.clone();
    let store = store.clone();
    let gui_state = gui_state.clone();
    let window = window.clone();
    glib::spawn_future_local(async move {
        let dialog = apply_initial_directory(rfd::AsyncFileDialog::new(), &state).set_title("Add folders");
        let folders = dialog.pick_folders().await;
        let Some(folders) = folders else { return };
        if folders.is_empty() {
            return;
        }

        let paths: Vec<PathBuf> = folders.into_iter().map(|f| f.path().into()).collect();
        remember_directory(&paths, true);
        let display: Vec<String> = paths.iter().map(|p| p.display().to_string()).collect();
        gui_state.borrow_mut().add_folder_picked_paths = display;
        state.borrow_mut().pending_folders = paths;

        crate::ui::main_window::show_add_folders_dialog(&window, &state, &store, &gui_state);
    });
}

pub fn confirm_add_folders(state: &SharedState, store: &gio::ListStore, gui_state: &SharedGuiState, scan_inside: bool, ignore_folders: bool) {
    let folders = std::mem::take(&mut state.borrow_mut().pending_folders);
    if folders.is_empty() {
        return;
    }

    show_overlay(gui_state, "Scanning folders…", "Enumerating contents", true);

    let (tx, rx) = mpsc::channel::<Vec<PathBuf>>();
    std::thread::spawn(move || {
        let items = enumerate_folder_contents(folders, scan_inside, ignore_folders);
        let _ = tx.send(items);
    });

    let state_clone = state.clone();
    let store_clone = store.clone();
    let gui_state_clone = gui_state.clone();

    glib::timeout_add_local(std::time::Duration::from_millis(80), move || match rx.try_recv() {
        Ok(items) => {
            start_async_scan(&items, &state_clone, &store_clone, &gui_state_clone, "Reading file metadata…");
            glib::ControlFlow::Break
        }
        Err(mpsc::TryRecvError::Empty) => glib::ControlFlow::Continue,
        Err(mpsc::TryRecvError::Disconnected) => {
            hide_overlay(&gui_state_clone);
            state_clone.borrow_mut().async_active = false;
            glib::ControlFlow::Break
        }
    });
    state.borrow_mut().async_active = true;
}

pub fn start_async_scan(items: &[PathBuf], state: &SharedState, store: &gio::ListStore, gui_state: &SharedGuiState, message: &str) {
    if items.is_empty() {
        hide_overlay(gui_state);
        return;
    }

    show_overlay(gui_state, "Scanning…", message, false);

    let progress = Arc::new(ScanProgress::default());
    let dedup = state.borrow().result_entries.files.clone();
    let progress_w = progress.clone();
    let items_vec = items.to_vec();

    let (tx, rx) = mpsc::channel::<Vec<ItemStruct>>();
    std::thread::spawn(move || {
        let result = collect_files_async(items_vec, &dedup, &progress_w);
        let _ = tx.send(result);
    });

    let state_clone = state.clone();
    let store_clone = store.clone();
    let gui_state_clone = gui_state.clone();
    let total = items.len();

    glib::timeout_add_local(std::time::Duration::from_millis(70), move || {
        let current = progress.current.load(AtomicOrdering::Relaxed);
        log::debug!("Scanning: {current}/{total}");

        match rx.try_recv() {
            Ok(result) => {
                {
                    let mut s = state_clone.borrow_mut();
                    for item in &result {
                        s.result_entries.files.insert(item.full_name.clone());
                    }
                    s.files.extend(result);
                    let n = s.files.len();
                    s.file_selected.resize(n, false);
                    s.rules.updated = false;
                }
                sync_files(&store_clone, &state_clone);
                refresh_outdated_or_recompute(&store_clone, &state_clone, &gui_state_clone);
                hide_overlay(&gui_state_clone);
                state_clone.borrow_mut().async_active = false;
                glib::ControlFlow::Break
            }
            Err(mpsc::TryRecvError::Empty) => glib::ControlFlow::Continue,
            Err(mpsc::TryRecvError::Disconnected) => {
                hide_overlay(&gui_state_clone);
                state_clone.borrow_mut().async_active = false;
                glib::ControlFlow::Break
            }
        }
    });
    state.borrow_mut().async_active = true;
}

pub fn remove_selected(state: &SharedState, store: &gio::ListStore, gui_state: &SharedGuiState) {
    // Sync selection from GTK before operating
    let sel = state.borrow().file_selection.clone();
    if let Some(sel) = &sel {
        crate::connect::sync::sync_selection_from_gtk(sel, state);
    }
    {
        let mut state_mut = state.borrow_mut();
        let to_remove: Vec<usize> = state_mut
            .file_selected
            .iter()
            .enumerate()
            .filter_map(|(i, sel)| if *sel { Some(i) } else { None })
            .collect();
        for idx in to_remove.iter().rev() {
            if let Some(removed) = state_mut.files.get(*idx).cloned() {
                state_mut.result_entries.files.remove(&removed.full_name);
            }
            state_mut.files.remove(*idx);
            state_mut.file_selected.remove(*idx);
        }
        if !to_remove.is_empty() {
            state_mut.rules.updated = false;
        }
    }
    sync_files(store, state);
    refresh_outdated_or_recompute(store, state, gui_state);
}

pub fn move_selected_up(state: &SharedState, store: &gio::ListStore) {
    let sel = state.borrow().file_selection.clone();
    if let Some(sel) = &sel {
        crate::connect::sync::sync_selection_from_gtk(sel, state);
    }
    {
        let mut state_mut = state.borrow_mut();
        let len = state_mut.files.len();
        for i in 1..len {
            if state_mut.file_selected.get(i).copied().unwrap_or(false) && !state_mut.file_selected.get(i - 1).copied().unwrap_or(false) {
                state_mut.files.swap(i, i - 1);
                state_mut.file_selected.swap(i, i - 1);
            }
        }
    }
    sync_files(store, state);
    crate::connect::sync::restore_file_selection(state);
}

pub fn move_selected_down(state: &SharedState, store: &gio::ListStore) {
    let sel = state.borrow().file_selection.clone();
    if let Some(sel) = &sel {
        crate::connect::sync::sync_selection_from_gtk(sel, state);
    }
    {
        let mut state_mut = state.borrow_mut();
        let len = state_mut.files.len();
        if len == 0 {
            return;
        }
        for i in (0..len - 1).rev() {
            if state_mut.file_selected.get(i).copied().unwrap_or(false) && !state_mut.file_selected.get(i + 1).copied().unwrap_or(false) {
                state_mut.files.swap(i, i + 1);
                state_mut.file_selected.swap(i, i + 1);
            }
        }
    }
    sync_files(store, state);
    crate::connect::sync::restore_file_selection(state);
}
