use std::cell::RefCell;
use std::rc::Rc;

use adw::prelude::*;

use std::cmp::Ordering;

use super::models::{FileRow, RuleRow};
use super::state_ui::{SelectMode, SharedEditorState, SharedGuiState};
use super::translations_ui::Translations;
use crate::files::ItemStruct;
use crate::rule::rules::{rule_place_to_string, rule_type_to_string, SingleRule};
use crate::state::SharedState;

fn icon_button(label: &str, icon: &str) -> gtk::Button {
    let btn = gtk::Button::new();
    btn.set_hexpand(true);
    let content = gtk::Box::new(gtk::Orientation::Horizontal, 8);
    content.set_halign(gtk::Align::Center);
    let img = gtk::Image::from_icon_name(icon);
    img.set_pixel_size(16);
    content.append(&img);
    let label_widget = gtk::Label::new(Some(label));
    label_widget.set_xalign(0.5);
    content.append(&label_widget);
    btn.set_child(Some(&content));
    btn
}

/// Compact icon-only button for card headers (native toolbar style).
fn header_button(icon: &str, tooltip: &str) -> gtk::Button {
    let btn = gtk::Button::from_icon_name(icon);
    btn.set_tooltip_text(Some(tooltip));
    btn.set_hexpand(false);
    btn
}

/// Comparison for the file list, by sort criterion id (operates on the
/// underlying data so sorting is a one-shot rearrangement that coexists with
/// manual "move up/down" reordering).
fn file_item_ordering(id: u32, a: &ItemStruct, b: &ItemStruct) -> Ordering {
    match id {
        1 => natord::compare(&a.future_name, &b.future_name),
        2 => natord::compare(&a.path, &b.path),
        3 => b.is_dir.cmp(&a.is_dir).then_with(|| natord::compare(&a.name, &b.name)),
        _ => natord::compare(&a.name, &b.name),
    }
}

/// Comparison for the rule list, by sort criterion id.
fn rule_item_ordering(id: u32, a: &SingleRule, b: &SingleRule) -> Ordering {
    match id {
        1 => natord::compare(&rule_place_to_string(a.rule_place), &rule_place_to_string(b.rule_place)),
        _ => natord::compare(&rule_type_to_string(a.rule_type), &rule_type_to_string(b.rule_type)),
    }
}

/// Build a native "Sort by" control: a `GtkMenuButton` opening a popover with
/// checkmarked sort criteria and an ascending/descending toggle (Nautilus style).
/// `apply_sort` receives the criterion id and whether it is ascending, and is
/// expected to reorder the underlying data once and re-sync the list.
fn build_sort_menu(labels: &[&str], apply_sort: &Rc<dyn Fn(u32, bool)>) -> gtk::MenuButton {
    let state = Rc::new(std::cell::RefCell::new((0u32, true))); // (criterion id, ascending)

    let mb = gtk::MenuButton::new();
    mb.set_icon_name("view-sort-ascending-symbolic");
    mb.set_tooltip_text(Some(&crate::fls!("sort_by")));
    mb.set_hexpand(false);
    mb.set_has_frame(true);

    let pop = gtk::Popover::new();
    pop.set_margin_top(4);
    pop.set_margin_bottom(4);
    let vbox = gtk::Box::new(gtk::Orientation::Vertical, 2);
    vbox.set_margin_top(6);
    vbox.set_margin_bottom(6);
    vbox.set_margin_start(6);
    vbox.set_margin_end(6);

    // Sort criteria (radio checkmarks)
    let mut group_leader: Option<gtk::CheckButton> = None;
    for (i, &label) in labels.iter().enumerate() {
        let cb = gtk::CheckButton::with_label(label);
        cb.set_hexpand(true);
        if let Some(leader) = &group_leader {
            cb.set_group(Some(leader));
        } else {
            group_leader = Some(cb.clone());
        }
        if i == 0 {
            cb.set_active(true);
        }
        let st = state.clone();
        let mb_icon = mb.clone();
        let ap = apply_sort.clone();
        cb.connect_toggled(move |cb| {
            if cb.is_active() {
                st.borrow_mut().0 = i as u32;
                let asc = st.borrow().1;
                ap(i as u32, asc);
                mb_icon.set_icon_name(if asc { "view-sort-ascending-symbolic" } else { "view-sort-descending-symbolic" });
            }
        });
        vbox.append(&cb);
    }

    let sep = gtk::Separator::new(gtk::Orientation::Horizontal);
    sep.set_margin_top(4);
    sep.set_margin_bottom(4);
    vbox.append(&sep);

    // Ascending / descending toggle
    let desc_cb = gtk::CheckButton::with_label(&crate::fls!("sort_descending"));
    desc_cb.set_hexpand(true);
    {
        let st = state;
        let mb_icon = mb.clone();
        let ap = apply_sort.clone();
        desc_cb.connect_toggled(move |cb| {
            let asc = !cb.is_active();
            st.borrow_mut().1 = asc;
            let id = st.borrow().0;
            ap(id, asc);
            mb_icon.set_icon_name(if asc { "view-sort-ascending-symbolic" } else { "view-sort-descending-symbolic" });
        });
    }
    vbox.append(&desc_cb);

    pop.set_child(Some(&vbox));
    mb.set_popover(Some(&pop));

    mb
}

#[expect(dead_code)]
pub struct GtkApp {
    pub window: adw::ApplicationWindow,
    pub file_store: gio::ListStore,
    pub rule_store: gio::ListStore,
    pub file_status_label: gtk::Label,
    pub rule_status_label: gtk::Label,
    pub start_button: gtk::Button,
    pub update_button: gtk::Button,
    pub progress_banner: adw::Banner,
    pub translations: Rc<RefCell<Translations>>,
    pub editor_state: SharedEditorState,
    pub gui_state: SharedGuiState,
}

pub fn build_gtk_app(app: &adw::Application, state: SharedState, editor_state: SharedEditorState, gui_state: SharedGuiState, translations: Rc<RefCell<Translations>>) -> GtkApp {
    let window = adw::ApplicationWindow::builder()
        .application(app)
        .title("NeoSzyszka")
        .default_width(1100)
        .default_height(720)
        .width_request(800)
        .height_request(600)
        .build();

    // Custom CSS for the list cards and future-name highlighting
    let css_provider = gtk::CssProvider::new();
    css_provider.load_from_string(
        ".future-name-changed { color: @success_color; }
         .list-card-header {
             padding: 9px;
         }
         .list-card-header > * { margin: 0; }
         .main-list-view row { padding: 0; }
         .main-list-view row:hover { background: transparent; }
         .main-list-view row:active { background: transparent; }
         .list-row {
             background: transparent;
             border-radius: 8px;
             padding: 9px 10px;
         }
         .main-list-view row:hover .list-row {
             background: alpha(@window_fg_color, 0.06);
         }
         .main-list-view row:selected {
             background: transparent;
             color: @window_fg_color;
         }
         .main-list-view row:selected .list-row {
             background: alpha(@window_fg_color, 0.22);
         }
         .drop-area {
             border: 2px solid transparent;
             border-radius: 8px;
             margin-bottom: 3px;
         }
         .drop-area:drop(active) {
             border-color: @accent_bg_color;
         }
         .main-list-view, scrolledwindow, scrolledwindow > viewport {
             background: transparent;
         }",
    );
    // Will be added to display after window is realized

    let toolbar_view = adw::ToolbarView::new();
    let header = adw::HeaderBar::new();

    // HeaderBar: Start Renaming (left), Add Files, Add Folders (right), Menu (end)
    let start_btn = icon_button(&crate::fls!("upper_start_renaming_button"), "media-playback-start-symbolic");
    start_btn.add_css_class("suggested-action");
    start_btn.set_sensitive(false);
    header.pack_start(&start_btn);

    let add_files_btn = header_button("text-x-generic-symbolic", &crate::fls!("upper_add_files_button"));
    let add_folders_btn = header_button("folder-symbolic", &crate::fls!("upper_add_folders_button"));

    // Hamburger menu
    let menu_model = gio::Menu::new();
    let prefs_section = gio::Menu::new();
    prefs_section.append(Some(&crate::fls!("menu_preferences")), Some("app.open-preferences"));
    menu_model.append_section(None, &prefs_section);
    let open_section = gio::Menu::new();
    open_section.append(Some(&crate::fls!("menu_open_rules_file")), Some("app.open-rules-file"));
    open_section.append(Some(&crate::fls!("menu_open_custom_texts_file")), Some("app.open-custom-texts-file"));
    open_section.append(Some(&crate::fls!("menu_open_config_dir")), Some("app.open-config-dir"));
    open_section.append(Some(&crate::fls!("menu_open_log_folder")), Some("app.open-log-folder"));
    menu_model.append_section(None, &open_section);

    // About
    let about_section = gio::Menu::new();
    about_section.append(Some(&crate::fls!("menu_about")), Some("app.about"));
    menu_model.append_section(None, &about_section);

    let menu_popover = gtk::PopoverMenu::from_model(Some(&menu_model));
    let menu_btn = gtk::MenuButton::new();
    menu_btn.set_icon_name("open-menu-symbolic");
    menu_btn.set_tooltip_text(Some("Menu"));
    menu_btn.set_popover(Some(&menu_popover));
    header.pack_end(&menu_btn);

    // Register app actions
    {
        let w = window.clone();
        let sm = app.style_manager();
        let action = gio::ActionEntry::builder("open-preferences")
            .activate(move |_, _, _| show_preferences_dialog(&w, &sm))
            .build();
        app.add_action_entries([action]);
    }
    {
        let action = gio::ActionEntry::builder("open-rules-file")
            .activate(move |_, _, _| {
                if let Some(p) = crate::config::get_rules_config_file() {
                    crate::config::create_rules_file_if_needed();
                    let _ = open::that(p);
                }
            })
            .build();
        app.add_action_entries([action]);
    }
    {
        let action = gio::ActionEntry::builder("open-custom-texts-file")
            .activate(move |_, _, _| {
                if let Some(p) = crate::config::get_custom_text_config_file() {
                    crate::config::create_custom_text_file_if_needed();
                    let _ = open::that(p);
                }
            })
            .build();
        app.add_action_entries([action]);
    }
    {
        let action = gio::ActionEntry::builder("open-config-dir")
            .activate(move |_, _, _| {
                if let Some(p) = crate::config::get_config_path() {
                    let _ = std::fs::create_dir_all(&p);
                    let _ = open::that(p);
                }
            })
            .build();
        app.add_action_entries([action]);
    }
    {
        let action = gio::ActionEntry::builder("open-log-folder")
            .activate(move |_, _, _| {
                if let Some(p) = crate::logger::get_cache_path() {
                    let _ = std::fs::create_dir_all(&p);
                    let _ = open::that(p);
                }
            })
            .build();
        app.add_action_entries([action]);
    }

    // About dialog
    {
        let action = gio::ActionEntry::builder("about")
            .activate(move |_, _, _| {
                let about = adw::AboutWindow::builder()
                    .application_name("NeoSzyszka")
                    .application_icon("com.github.samfic.szyszka")
                    .version(env!("CARGO_PKG_VERSION"))
                    .copyright("Copyright © 2021 Rafał Mikrut\nCopyright © 2026 Sam-Fic")
                    .comments("Fork of Szyszka by Rafał Mikrut (https://github.com/qarmin/szyszka). Rewritten with GTK 4 and libadwaita (GNOME HIG) and maintained as NeoSzyszka by Sam-Fic.")
                    .website("https://github.com/Sam-Fic/NeoSzyszka")
                    .issue_url("https://github.com/Sam-Fic/NeoSzyszka/issues")
                    .license_type(gtk::License::MitX11)
                    .build();
                about.set_developers(&["Rafał Mikrut", "Sam-Fic"]);
                about.present();
            })
            .build();
        app.add_action_entries([action]);
    }

    toolbar_view.add_top_bar(&header);

    // Main content
    let main_box = gtk::Box::new(gtk::Orientation::Vertical, 12);
    main_box.set_margin_start(12);
    main_box.set_margin_end(12);
    main_box.set_margin_top(0);
    main_box.set_margin_bottom(12);

    // Progress banner
    let progress_banner = adw::Banner::new(&crate::fls!("dialog_loading"));
    progress_banner.set_revealed(false);
    progress_banner.set_visible(false);
    main_box.append(&progress_banner);

    // ===== Files card =====
    let (file_list_view, file_store, _file_selection, _file_sort_model) = build_file_list_view(&state, &window);

    let file_scroll = gtk::ScrolledWindow::builder().child(&file_list_view).vexpand(true).build();

    let file_empty_page = adw::StatusPage::builder()
        .icon_name("folder-documents-symbolic")
        .title(&crate::fls!("empty_state_files_title"))
        .valign(gtk::Align::Center)
        .hexpand(true)
        .vexpand(true)
        .build();

    let file_stack = gtk::Stack::new();
    file_stack.set_vexpand(true);
    file_stack.set_overflow(gtk::Overflow::Hidden);
    file_stack.add_css_class("drop-area");
    file_stack.add_named(&file_scroll, Some("list"));
    file_stack.add_named(&file_empty_page, Some("empty"));
    file_stack.set_visible_child_name("empty");

    // === Drag and drop to add files/folders ===
    {
        use std::path::PathBuf;
        let state = state.clone();
        let file_store = file_store.clone();
        let gs = gui_state.clone();
        // Accept GdkFileList (the format GNOME/Nautilus and other GTK file
        // managers provide when dragging files) plus a single GFile.
        let drop_target = gtk::DropTarget::new(gtk::gdk::FileList::static_type(), gtk::gdk::DragAction::COPY);
        drop_target.set_types(&[gtk::gdk::FileList::static_type(), gio::File::static_type()]);

        let drop_window = window.clone();
        drop_target.connect_drop(move |_, value, _, _| {
            let mut files: Vec<PathBuf> = Vec::new();
            let mut folders: Vec<PathBuf> = Vec::new();

            // GdkFileList: preferred format from GTK/Nautilus file managers
            if let Ok(list) = value.get::<gtk::gdk::FileList>() {
                for f in list.files() {
                    if let Some(p) = f.path() {
                        if p.is_dir() {
                            folders.push(p);
                        } else {
                            files.push(p);
                        }
                    }
                }
            }
            // Single GFile
            else if let Ok(file) = value.get::<gio::File>() {
                if let Some(p) = file.path() {
                    if p.is_dir() {
                        folders.push(p);
                    } else {
                        files.push(p);
                    }
                }
            }
            // text/uri-list: fallback used by some (non-GTK) drag sources
            else if let Ok(uris) = value.get::<String>() {
                for uri in uris.split(['\r', '\n']).filter(|s| !s.is_empty()) {
                    let file = gio::File::for_uri(uri);
                    if let Some(p) = file.path() {
                        if p.is_dir() {
                            folders.push(p);
                        } else {
                            files.push(p);
                        }
                    }
                }
            }

            if files.is_empty() && folders.is_empty() {
                return false;
            }

            // Files are added immediately, just like the "Add files" button.
            if !files.is_empty() {
                let items = crate::files::sort_files(files);
                crate::connect::files::start_async_scan(&items, &state, &file_store, &gs, "Adding files…");
            }

            // Folders prompt the same "configure scan options" dialog as the
            // "Add folders" button, instead of being scanned automatically.
            if !folders.is_empty() {
                let display: Vec<String> = folders.iter().map(|p| p.display().to_string()).collect();
                gs.borrow_mut().add_folder_picked_paths = display;
                state.borrow_mut().pending_folders = folders;
                show_add_folders_dialog(&drop_window, &state, &file_store, &gs);
            }

            true
        });
        // Attach to the file list stack so GTK applies the native
        // :drop(active) state automatically during drag-hover.
        file_stack.add_controller(drop_target);
    }

    // Files card header buttons
    let remove_btn = header_button("edit-delete-symbolic", &crate::fls!("upper_remove_selection_button"));
    let select_btn = header_button("edit-select-all-symbolic", &crate::fls!("upper_select_popup_button"));
    let update_btn = header_button("view-refresh-symbolic", &crate::fls!("upper_update_names_button"));
    update_btn.set_sensitive(false);
    let move_up_btn = header_button("go-up-symbolic", "Move Up");
    let move_down_btn = header_button("go-down-symbolic", "Move Down");

    // Files sort control (MenuButton + Popover). Sorting rearranges the
    // underlying data once, so it coexists with manual "move up/down".
    let apply_file_sort: Rc<dyn Fn(u32, bool)> = {
        let state = state.clone();
        let file_store = file_store.clone();
        Rc::new(move |id: u32, asc: bool| {
            let sel = state.borrow().file_selection.clone();
            if let Some(sel) = &sel {
                crate::connect::sync::sync_selection_from_gtk(sel, &state);
            }
            {
                let mut s = state.borrow_mut();
                let n = s.files.len();
                if n == 0 {
                    return;
                }
                s.file_selected.resize(n, false);
                let mut order: Vec<usize> = (0..n).collect();
                order.sort_by(|&x, &y| {
                    let ord = file_item_ordering(id, &s.files[x], &s.files[y]);
                    if asc {
                        ord
                    } else {
                        ord.reverse()
                    }
                });
                let files: Vec<_> = order.iter().map(|&i| s.files[i].clone()).collect();
                let selected: Vec<_> = order.iter().map(|&i| s.file_selected[i]).collect();
                s.files = files;
                s.file_selected = selected;
            }
            crate::connect::sync::sync_files(&file_store, &state);
            crate::connect::sync::restore_file_selection(&state);
        })
    };
    let file_sort_btn = build_sort_menu(
        &[
            &crate::fls!("sort_name"),
            &crate::fls!("sort_future_name"),
            &crate::fls!("sort_path"),
            &crate::fls!("sort_type"),
        ],
        &apply_file_sort,
    );

    // Files card header
    let file_status = gtk::Label::new(Some(&crate::fls!("upper_files_folders_label")));
    file_status.add_css_class("heading");
    file_status.set_xalign(0.0);
    file_status.set_valign(gtk::Align::Center);
    file_status.set_margin_start(8);
    file_status.set_hexpand(true);
    let file_header = gtk::Box::new(gtk::Orientation::Horizontal, 6);
    file_header.add_css_class("list-card-header");
    file_header.append(&file_status);
    file_header.append(&file_sort_btn);
    add_files_btn.set_hexpand(false);
    file_header.append(&add_files_btn);
    add_folders_btn.set_hexpand(false);
    file_header.append(&add_folders_btn);
    file_header.append(&remove_btn);
    file_header.append(&select_btn);
    file_header.append(&update_btn);
    file_header.append(&move_up_btn);
    file_header.append(&move_down_btn);

    let file_card = gtk::Box::new(gtk::Orientation::Vertical, 0);
    file_card.add_css_class("card");
    file_card.set_overflow(gtk::Overflow::Hidden);
    file_card.set_vexpand(true);
    file_card.append(&file_header);
    file_card.append(&file_stack);
    main_box.append(&file_card);

    // ===== Rules card =====
    let rule_store = gio::ListStore::new::<RuleRow>();
    let rule_selection = gtk::MultiSelection::new(Some(rule_store.clone()));
    state.borrow_mut().rule_selection = Some(rule_selection.clone());
    let (rule_list_view, _rule_sort_model) = build_rule_list_view(&rule_selection, &state, &editor_state, &rule_store, &file_store, &gui_state, &window);

    let rule_scroll = gtk::ScrolledWindow::builder().child(&rule_list_view).vexpand(true).build();

    let rule_empty_page = adw::StatusPage::builder()
        .icon_name("text-x-generic-symbolic")
        .title(&crate::fls!("empty_state_rules_title"))
        .valign(gtk::Align::Center)
        .hexpand(true)
        .vexpand(true)
        .build();

    let rule_stack = gtk::Stack::new();
    rule_stack.set_vexpand(true);
    rule_stack.set_overflow(gtk::Overflow::Hidden);
    rule_stack.add_named(&rule_scroll, Some("list"));
    rule_stack.add_named(&rule_empty_page, Some("empty"));
    rule_stack.set_visible_child_name("empty");

    // Rules card header buttons
    let add_rule_btn = header_button("list-add-symbolic", &crate::fls!("bottom_rule_add_button"));
    let edit_rule_btn = header_button("document-edit-symbolic", &crate::fls!("bottom_rule_edit_button"));
    let remove_rule_btn = header_button("list-remove-symbolic", &crate::fls!("bottom_rule_remove_button"));
    let load_rules_btn = header_button("document-open-symbolic", &crate::fls!("bottom_rule_load_rules_button"));
    let save_rules_btn = header_button("document-save-symbolic", &crate::fls!("bottom_rule_save_rules_button"));
    let rule_up_btn = header_button("go-up-symbolic", "Move Up");
    let rule_down_btn = header_button("go-down-symbolic", "Move Down");

    // Rules sort control (MenuButton + Popover). One-shot reordering of the
    // underlying rules so it coexists with manual "move up/down".
    let apply_rule_sort: Rc<dyn Fn(u32, bool)> = {
        let state = state.clone();
        let rule_store = rule_store.clone();
        let file_store = file_store.clone();
        let gs = gui_state.clone();
        Rc::new(move |id: u32, asc: bool| {
            let sel = state.borrow().rule_selection.clone();
            if let Some(sel) = &sel {
                crate::connect::sync::sync_rule_selection_from_gtk(sel, &state);
            }
            {
                let mut s = state.borrow_mut();
                let n = s.rules.rules.len();
                if n == 0 {
                    return;
                }
                s.rule_selected.resize(n, false);
                let mut order: Vec<usize> = (0..n).collect();
                order.sort_by(|&x, &y| {
                    let ord = rule_item_ordering(id, &s.rules.rules[x], &s.rules.rules[y]);
                    if asc {
                        ord
                    } else {
                        ord.reverse()
                    }
                });
                let rules: Vec<_> = order.iter().map(|&i| s.rules.rules[i].clone()).collect();
                let selected: Vec<_> = order.iter().map(|&i| s.rule_selected[i]).collect();
                s.rules.rules = rules;
                s.rule_selected = selected;
                s.rules.updated = false;
            }
            crate::connect::sync::sync_rules(&rule_store, &state);
            crate::connect::rules_ops::refresh_outdated_or_recompute(&file_store, &state, &gs);
            crate::connect::sync::restore_rule_selection(&state);
        })
    };
    let rule_sort_btn = build_sort_menu(&[&crate::fls!("sort_type"), &crate::fls!("sort_usage")], &apply_rule_sort);

    // Rules card header
    let rule_status = gtk::Label::new(Some(&crate::fls!("bottom_rule_label_rules")));
    rule_status.add_css_class("heading");
    rule_status.set_xalign(0.0);
    rule_status.set_valign(gtk::Align::Center);
    rule_status.set_margin_start(8);
    rule_status.set_hexpand(true);
    let rule_header = gtk::Box::new(gtk::Orientation::Horizontal, 6);
    rule_header.add_css_class("list-card-header");
    rule_header.append(&rule_status);
    rule_header.append(&rule_sort_btn);
    rule_header.append(&add_rule_btn);
    rule_header.append(&edit_rule_btn);
    rule_header.append(&remove_rule_btn);
    rule_header.append(&load_rules_btn);
    rule_header.append(&save_rules_btn);
    rule_header.append(&rule_up_btn);
    rule_header.append(&rule_down_btn);

    let rule_card = gtk::Box::new(gtk::Orientation::Vertical, 0);
    rule_card.add_css_class("card");
    rule_card.set_overflow(gtk::Overflow::Hidden);
    rule_card.set_vexpand(true);
    rule_card.append(&rule_header);
    rule_card.append(&rule_stack);
    main_box.append(&rule_card);

    toolbar_view.set_content(Some(&main_box));

    let toast_overlay = adw::ToastOverlay::new();
    toast_overlay.set_child(Some(&toolbar_view));
    window.set_content(Some(&toast_overlay));

    // Add CSS provider to display when realized
    {
        let cp = css_provider;
        window.connect_realize(move |w| {
            let display = gtk::prelude::WidgetExt::display(w);
            gtk::style_context_add_provider_for_display(&display, &cp, gtk::STYLE_PROVIDER_PRIORITY_APPLICATION);
        });
    }

    let gtk_app = GtkApp {
        window: window.clone(),
        file_store: file_store.clone(),
        rule_store: rule_store.clone(),
        file_status_label: file_status,
        rule_status_label: rule_status,
        start_button: start_btn.clone(),
        update_button: update_btn.clone(),
        progress_banner: progress_banner.clone(),
        translations: translations.clone(),
        editor_state: editor_state.clone(),
        gui_state: gui_state.clone(),
    };

    // === Dynamic status labels ===
    {
        let file_status_c = gtk_app.file_status_label.clone();
        let rule_status_c = gtk_app.rule_status_label.clone();
        let file_store_c = file_store.clone();
        let rule_store_c = rule_store.clone();
        let gs = gui_state.clone();
        let tr = translations;
        let start_btn_c = start_btn.clone();
        let update_btn_c = update_btn.clone();
        let pb = progress_banner;
        let file_stack_c = file_stack;
        let rule_stack_c = rule_stack;
        let state_loop = state.clone();
        glib::timeout_add_local(std::time::Duration::from_millis(200), move || {
            let file_count = file_store_c.n_items() as i32;
            let rule_count = rule_store_c.n_items() as i32;
            let outdated = gs.borrow().results_outdated;
            let busy = state_loop.borrow().async_active;
            let t = tr.borrow();
            if outdated && file_count > 0 {
                file_status_c.set_label(&format!("{} ({}) - {}", t.upper_files_folders_label, file_count, crate::fls!("status_update_required")));
            } else if file_count > 0 {
                file_status_c.set_label(&format!("{} ({}) - {}", t.upper_files_folders_label, file_count, crate::fls!("status_up_to_date")));
            } else {
                file_status_c.set_label(&t.upper_files_folders_label);
            }
            start_btn_c.set_sensitive(file_count > 0 && rule_count > 0 && !busy);
            update_btn_c.set_sensitive(file_count > 0 && !busy);
            file_stack_c.set_visible_child_name(if file_count > 0 { "list" } else { "empty" });
            if rule_count > 0 {
                rule_status_c.set_label(&format!("{} ({})", t.bottom_rule_label_rules, rule_count));
            } else {
                rule_status_c.set_label(&t.bottom_rule_label_rules);
            }
            rule_stack_c.set_visible_child_name(if rule_count > 0 { "list" } else { "empty" });

            // Banner (indeterminate text messages)
            let title = gs.borrow().message_dialog_title.clone();
            let active = !title.is_empty();
            pb.set_revealed(active);
            pb.set_visible(active);
            if active {
                pb.set_title(&title);
            }
            glib::ControlFlow::Continue
        });
    }

    // === Select button ===
    {
        let window = window.clone();
        let file_store = file_store.clone();
        let state = state.clone();
        let gs = gui_state.clone();
        select_btn.connect_clicked(move |_| {
            show_select_popup(&window, &file_store, &state, &gs);
        });
    }

    // === Start renaming ===
    {
        let window = window.clone();
        let state = state.clone();
        let gui_state_start = gui_state.clone();
        start_btn.connect_clicked(move |_| {
            crate::connect::renaming::start_renaming_request(&window, &state, gui_state_start.clone());
        });
    }

    // === Add files (already in header) ===
    {
        let state = state.clone();
        let file_store = file_store.clone();
        let gs = gui_state.clone();
        add_files_btn.connect_clicked(move |_| {
            crate::connect::files::pick_files_and_add(&state, &file_store, &gs);
        });
    }

    // === Add folders (already in header) ===
    {
        let state = state.clone();
        let file_store = file_store.clone();
        let gs = gui_state.clone();
        let window = window.clone();
        add_folders_btn.connect_clicked(move |_| {
            crate::connect::files::pick_folders_into_state(&state, &file_store, &gs, &window);
        });
    }

    // === Remove selected files ===
    {
        let state = state.clone();
        let file_store = file_store.clone();
        let gs = gui_state.clone();
        remove_btn.connect_clicked(move |_| {
            crate::connect::files::remove_selected(&state, &file_store, &gs);
        });
    }

    // === Update names ===
    {
        let state = state.clone();
        let file_store = file_store.clone();
        let gs = gui_state.clone();
        update_btn.connect_clicked(move |_| {
            crate::connect::rules_ops::refresh_future_names(&state);
            state.borrow_mut().rules.updated = true;
            crate::connect::sync::sync_files(&file_store, &state);
            crate::connect::sync::sync_outdated(&gs, &state);
        });
    }

    // === Move file up/down ===
    {
        let state = state.clone();
        let file_store = file_store.clone();
        move_up_btn.connect_clicked(move |_| {
            crate::connect::files::move_selected_up(&state, &file_store);
        });
    }
    {
        let state = state.clone();
        let file_store = file_store.clone();
        move_down_btn.connect_clicked(move |_| {
            crate::connect::files::move_selected_down(&state, &file_store);
        });
    }

    // === Rule operations ===
    {
        let window = window.clone();
        let es = editor_state.clone();
        let state = state.clone();
        let rule_store = rule_store.clone();
        let gs = gui_state.clone();
        let file_store_c = file_store.clone();
        add_rule_btn.connect_clicked(move |_| {
            super::rule_editor::show_rule_editor(&window, &es, &state, &rule_store, &file_store_c, &gs, None);
        });
    }
    {
        let window = window.clone();
        let es = editor_state;
        let state = state.clone();
        let rule_store = rule_store.clone();
        let gs = gui_state.clone();
        let file_store_c = file_store.clone();
        edit_rule_btn.connect_clicked(move |_| {
            let sel = state.borrow().rule_selection.clone();
            if let Some(sel) = &sel {
                crate::connect::sync::sync_rule_selection_from_gtk(sel, &state);
            }
            let (idx, any_selected) = {
                let s = state.borrow();
                let idx = s.rule_selected.iter().position(|x| *x).map_or(-1, |i| i as i32);
                let any_selected = s.rule_selected.iter().any(|x| *x);
                (idx, any_selected)
            };
            if !any_selected {
                let toast = adw::Toast::new(&crate::fls!("rule_no_selection"));
                toast_overlay.add_toast(toast);
                return;
            }
            super::rule_editor::show_rule_editor(&window, &es, &state, &rule_store, &file_store_c, &gs, Some(idx));
        });
    }
    {
        let rule_store = rule_store.clone();
        let state = state.clone();
        let gs = gui_state.clone();
        let file_store_c = file_store.clone();
        remove_rule_btn.connect_clicked(move |_| {
            crate::connect::rules_ops::remove_rule(&rule_store, &file_store_c, &state, &gs, -1);
        });
    }
    {
        let rule_store = rule_store.clone();
        let state = state.clone();
        let gs = gui_state.clone();
        let file_store_c = file_store.clone();
        rule_up_btn.connect_clicked(move |_| {
            crate::connect::rules_ops::move_rule_up(&rule_store, &file_store_c, &state, &gs);
        });
    }
    {
        let rule_store = rule_store.clone();
        let state = state.clone();
        let gs = gui_state.clone();
        let file_store_c = file_store.clone();
        rule_down_btn.connect_clicked(move |_| {
            crate::connect::rules_ops::move_rule_down(&rule_store, &file_store_c, &state, &gs);
        });
    }
    {
        let state = state.clone();
        let gs = gui_state.clone();
        let window = window.clone();
        save_rules_btn.connect_clicked(move |_| {
            let dialog = adw::AlertDialog::builder()
                .heading(&crate::fls!("dialog_save_rule_set_title"))
                .body(&crate::fls!("dialog_save_rule_set_body"))
                .build();
            dialog.add_response("cancel", &crate::fls!("dialog_button_cancel"));
            dialog.add_response("save", &crate::fls!("dialog_button_ok"));
            dialog.set_response_appearance("save", adw::ResponseAppearance::Suggested);
            let entry = gtk::Entry::builder().placeholder_text(&crate::fls!("dialog_save_rule_set_name")).build();
            dialog.set_extra_child(Some(&entry));
            let st = state.clone();
            let gs2 = gs.clone();
            dialog.connect_response(Some("save"), move |_, _| {
                let name = entry.text().to_string();
                crate::connect::rules_ops::save_rule_set(&st, &name);
                crate::connect::rules_ops::refresh_rule_sets(&gs2);
            });
            dialog.present(Some(&window));
        });
    }
    {
        let state = state;
        let rule_store = rule_store;
        let gs = gui_state;
        let window = window;
        let file_store_c = file_store;
        load_rules_btn.connect_clicked(move |_| {
            let all = crate::config::load_rules();
            if all.is_empty() {
                return;
            }
            let dialog = adw::Dialog::builder()
                .title(&crate::fls!("dialog_saved_rule_sets"))
                .content_width(400)
                .content_height(400)
                .build();
            let vbox = gtk::Box::new(gtk::Orientation::Vertical, 8);
            vbox.set_margin_top(12);
            vbox.set_margin_bottom(12);
            vbox.set_margin_start(12);
            vbox.set_margin_end(12);
            let list_box = gtk::ListBox::new();
            list_box.add_css_class("boxed-list");
            for (i, entry) in all.iter().enumerate() {
                let row = adw::ActionRow::builder().title(&entry.name).activatable(false).build();
                let load_btn = gtk::Button::with_label(&crate::fls!("rule_editor_load"));
                load_btn.add_css_class("flat");
                load_btn.add_css_class("suggested-action");
                let st = state.clone();
                let store2 = rule_store.clone();
                let fs = file_store_c.clone();
                let gs2 = gs.clone();
                let d = dialog.clone();
                let idx = i as i32;
                load_btn.connect_clicked(move |_| {
                    crate::connect::rules_ops::load_rule_set(&store2, &fs, &st, &gs2, idx);
                    d.close();
                });
                row.add_suffix(&load_btn);
                let del_btn = gtk::Button::from_icon_name("user-trash-symbolic");
                del_btn.add_css_class("flat");
                del_btn.add_css_class("destructive-action");
                let d2 = dialog.clone();
                let idx = i as i32;
                del_btn.connect_clicked(move |_| {
                    crate::connect::rules_ops::delete_rule_set(idx);
                    d2.close();
                });
                row.add_suffix(&del_btn);
                list_box.append(&row);
            }
            vbox.append(&list_box);
            let close_btn = gtk::Button::with_label(&crate::fls!("dialog_button_cancel"));
            close_btn.set_halign(gtk::Align::End);
            {
                let d = dialog.clone();
                close_btn.connect_clicked(move |_| {
                    d.close();
                });
            }
            vbox.append(&close_btn);
            dialog.set_child(Some(&vbox));
            dialog.present(Some(&window));
        });
    }

    gtk_app
}

fn show_preferences_dialog(window: &adw::ApplicationWindow, style_manager: &adw::StyleManager) {
    let dialog = adw::PreferencesDialog::new();

    let prefs_page = adw::PreferencesPage::new();
    prefs_page.set_icon_name(Some("preferences-desktop-symbolic"));
    prefs_page.set_title(&crate::fls!("menu_preferences"));
    let appearance_group = adw::PreferencesGroup::builder().title(&crate::fls!("menu_appearance")).build();
    let theme_row = adw::ComboRow::builder()
        .title(&crate::fls!("settings_theme"))
        .model(&gtk::StringList::new(&[
            &crate::fls!("settings_theme_system"),
            &crate::fls!("settings_theme_light"),
            &crate::fls!("settings_theme_dark"),
        ]))
        .selected(match style_manager.color_scheme() {
            libadwaita::ColorScheme::ForceDark => 2,
            libadwaita::ColorScheme::ForceLight => 1,
            _ => 0,
        })
        .build();
    {
        let sm = style_manager.clone();
        theme_row.connect_selected_notify(move |row| {
            let scheme = match row.selected() {
                2 => libadwaita::ColorScheme::ForceDark,
                1 => libadwaita::ColorScheme::ForceLight,
                _ => libadwaita::ColorScheme::Default,
            };
            sm.set_color_scheme(scheme);
            crate::config::save_dark_theme(scheme == libadwaita::ColorScheme::ForceDark);
        });
    }
    appearance_group.add(&theme_row);
    prefs_page.add(&appearance_group);

    let language_group = adw::PreferencesGroup::builder().title(&crate::fls!("settings_language_label")).build();
    let saved_lang = crate::config::load_saved_language();
    let lang_combo = adw::ComboRow::builder()
        .title(&crate::fls!("settings_language_label"))
        .model(&gtk::StringList::new(&crate::language::LANGUAGES_ALL.iter().map(|l| l.combo_box_text).collect::<Vec<_>>()))
        .selected(crate::language::LANGUAGES_ALL.iter().position(|l| l.combo_box_text == saved_lang).unwrap_or(0) as u32)
        .build();
    {
        let w = window.clone();
        lang_combo.connect_selected_notify(move |row| {
            let lang = &crate::language::LANGUAGES_ALL[row.selected() as usize];
            let current = crate::config::load_saved_language();
            if lang.combo_box_text != current {
                crate::config::save_language(lang.combo_box_text);
                crate::language::apply_language(lang.combo_box_text);
                let confirm = adw::AlertDialog::builder()
                    .heading(&crate::fls!("dialog_language_title"))
                    .body(&crate::fls!("dialog_language_restart_confirm"))
                    .build();
                confirm.add_response("cancel", &crate::fls!("dialog_button_cancel"));
                confirm.add_response("restart", &crate::fls!("dialog_language_restart"));
                confirm.set_response_appearance("restart", adw::ResponseAppearance::Suggested);
                let w2 = w.clone();
                confirm.connect_response(Some("restart"), move |_, _| {
                    w2.close();
                    w2.application().unwrap().activate();
                });
                confirm.present(Some(&w));
            }
        });
    }
    language_group.add(&lang_combo);
    prefs_page.add(&language_group);
    dialog.add(&prefs_page);
    dialog.present(Some(window));
}

fn show_select_popup(window: &adw::ApplicationWindow, file_store: &gio::ListStore, state: &SharedState, gui_state: &SharedGuiState) {
    let dialog = adw::AlertDialog::builder()
        .heading(&crate::fls!("dialog_select"))
        .body(&crate::fls!("dialog_select_body"))
        .build();
    dialog.add_response("all", &crate::fls!("button_select_all"));
    dialog.add_response("none", &crate::fls!("button_unselect_all"));
    dialog.add_response("reverse", &crate::fls!("button_select_reverse"));
    dialog.add_response("custom", &crate::fls!("button_select_custom"));
    dialog.add_response("changed", &crate::fls!("button_select_changed"));
    dialog.add_response("unchanged", &crate::fls!("button_unselect_changed"));
    let store = file_store.clone();
    let st = state.clone();
    let w = window.clone();
    let gs = gui_state.clone();
    dialog.connect_response(None, move |_, response| match response {
        "all" => crate::connect::select::apply_select(&store, &st, SelectMode::SelectAll),
        "none" => crate::connect::select::apply_select(&store, &st, SelectMode::UnselectAll),
        "reverse" => crate::connect::select::apply_select(&store, &st, SelectMode::Reverse),
        "changed" => crate::connect::select::apply_select(&store, &st, SelectMode::SelectChanged),
        "unchanged" => crate::connect::select::apply_select(&store, &st, SelectMode::UnselectChanged),
        "custom" => {
            show_select_custom_dialog(&w, &store, &st, &gs);
        }
        _ => {}
    });
    dialog.present(Some(window));
}

pub fn show_select_custom_dialog(window: &adw::ApplicationWindow, file_store: &gio::ListStore, state: &SharedState, _gui_state: &SharedGuiState) {
    let dialog = adw::AlertDialog::builder()
        .heading(&crate::fls!("dialog_select_custom_title"))
        .body(&crate::fls!("dialog_select_custom_body"))
        .build();
    let content_box = gtk::Box::new(gtk::Orientation::Vertical, 8);
    content_box.set_margin_top(8);
    content_box.set_margin_bottom(8);
    content_box.set_margin_start(8);
    content_box.set_margin_end(8);
    let pattern_entry = gtk::Entry::builder().placeholder_text(&crate::fls!("dialog_select_custom_pattern")).hexpand(true).build();
    content_box.append(&pattern_entry);
    let include_dirs_check = gtk::CheckButton::with_label(&crate::fls!("dialog_select_custom_include_dirs"));
    include_dirs_check.set_active(true);
    content_box.append(&include_dirs_check);
    content_box.append(&gtk::Label::builder().label(&crate::fls!("ctrl_match_against")).xalign(0.0).build());
    let mode_combo = gtk::DropDown::from_strings(&[
        &crate::fls!("select_custom_path"),
        &crate::fls!("select_custom_current_path"),
        &crate::fls!("select_custom_future_path"),
        &crate::fls!("select_custom_path_current_name"),
        &crate::fls!("select_custom_path_future_name"),
        &crate::fls!("select_custom_directory_file"),
    ]);
    content_box.append(&mode_combo);
    let hint = gtk::Label::builder().label(&crate::fls!("select_custom_hint")).wrap(true).xalign(0.0).build();
    hint.add_css_class("dim-label");
    content_box.append(&hint);
    dialog.set_extra_child(Some(&content_box));
    dialog.add_response("cancel", &crate::fls!("dialog_button_cancel"));
    dialog.add_response("select", &crate::fls!("button_select_custom"));
    dialog.add_response("unselect", &crate::fls!("button_unselect_all"));
    dialog.set_response_appearance("select", adw::ResponseAppearance::Suggested);
    let store = file_store.clone();
    let st = state.clone();
    let pe = pattern_entry.clone();
    let idc = include_dirs_check.clone();
    let mc = mode_combo.clone();
    dialog.connect_response(Some("select"), move |_, _| {
        crate::connect::select::apply_select_custom(&store, &st, &pe.text(), idc.is_active(), mc.selected() as i32, true);
    });
    let store = file_store.clone();
    let st = state.clone();
    let pe = pattern_entry;
    let idc = include_dirs_check;
    let mc = mode_combo;
    dialog.connect_response(Some("unselect"), move |_, _| {
        crate::connect::select::apply_select_custom(&store, &st, &pe.text(), idc.is_active(), mc.selected() as i32, false);
    });
    dialog.present(Some(window));
}

pub fn show_add_folders_dialog(window: &adw::ApplicationWindow, state: &SharedState, file_store: &gio::ListStore, gui_state: &SharedGuiState) {
    let dialog = adw::AlertDialog::builder()
        .heading(&crate::fls!("dialog_add_folders_title"))
        .body(&crate::fls!("dialog_add_folders_body"))
        .build();
    let content_box = gtk::Box::new(gtk::Orientation::Vertical, 8);
    content_box.set_margin_top(8);
    content_box.set_margin_bottom(8);
    content_box.set_margin_start(8);
    content_box.set_margin_end(8);
    {
        let gs = gui_state.borrow();
        let paths = &gs.add_folder_picked_paths;
        let text = if paths.is_empty() { "No folders selected".to_string() } else { paths.join("\n") };
        content_box.append(&gtk::Label::builder().label(&text).xalign(0.0).wrap(true).build());
    }
    let scan_check = gtk::CheckButton::with_label(&crate::fls!("dialog_scan_inside"));
    let ignore_check = gtk::CheckButton::with_label(&crate::fls!("dialog_ignore_folders"));
    content_box.append(&scan_check);
    content_box.append(&ignore_check);
    dialog.set_extra_child(Some(&content_box));
    dialog.add_response("cancel", &crate::fls!("dialog_button_cancel"));
    dialog.add_response("ok", &crate::fls!("dialog_button_ok"));
    dialog.set_response_appearance("ok", adw::ResponseAppearance::Suggested);
    let st = state.clone();
    let store = file_store.clone();
    let gs = gui_state.clone();
    dialog.connect_response(Some("ok"), move |_, _| {
        crate::connect::files::confirm_add_folders(&st, &store, &gs, scan_check.is_active(), ignore_check.is_active());
    });
    dialog.present(Some(window));
}

fn build_file_list_view(state: &SharedState, _window: &adw::ApplicationWindow) -> (gtk::ListView, gio::ListStore, gtk::MultiSelection, gtk::SortListModel) {
    let file_store = gio::ListStore::new::<FileRow>();

    // Row: [icon] [name (title) / future name (subtitle)] [spacer] [path (dim)]
    let factory = gtk::SignalListItemFactory::new();
    factory.connect_setup(|_, list_item| {
        let li = list_item.downcast_ref::<gtk::ListItem>().unwrap();
        let row_box = gtk::Box::new(gtk::Orientation::Horizontal, 10);
        row_box.add_css_class("list-row");
        row_box.set_margin_top(2);
        row_box.set_margin_bottom(2);
        row_box.set_margin_start(9);
        row_box.set_margin_end(9);

        let icon = gtk::Image::from_icon_name("text-x-generic-symbolic");
        icon.set_pixel_size(22);
        icon.set_valign(gtk::Align::Center);
        row_box.append(&icon);

        let texts = gtk::Box::new(gtk::Orientation::Horizontal, 6);
        texts.set_hexpand(true);
        texts.set_valign(gtk::Align::Center);
        let name = gtk::Label::new(None);
        name.set_xalign(0.0);
        name.set_ellipsize(gtk::pango::EllipsizeMode::Middle);
        name.add_css_class("file-row-name");
        let arrow = gtk::Label::new(Some("→"));
        arrow.set_valign(gtk::Align::Center);
        arrow.add_css_class("dim-label");
        arrow.set_visible(false);
        let future = gtk::Label::new(None);
        future.set_xalign(0.0);
        future.set_ellipsize(gtk::pango::EllipsizeMode::Middle);
        future.add_css_class("dim-label");
        future.set_visible(false);
        texts.append(&name);
        texts.append(&arrow);
        texts.append(&future);
        row_box.append(&texts);

        let path = gtk::Label::new(None);
        path.set_xalign(1.0);
        path.set_ellipsize(gtk::pango::EllipsizeMode::Middle);
        path.add_css_class("dim-label");
        path.set_valign(gtk::Align::Center);
        path.set_width_chars(20);
        row_box.append(&path);

        li.set_child(Some(&row_box));
    });
    factory.connect_bind(|_, list_item| {
        let li = list_item.downcast_ref::<gtk::ListItem>().unwrap();
        let row = li.item().and_downcast::<FileRow>().unwrap();
        let row_box = li.child().and_downcast::<gtk::Box>().unwrap();
        // First row: remove top gap so the gray box touches the list area top.
        if li.position() == 0 {
            row_box.set_margin_top(0);
        } else {
            row_box.set_margin_top(2);
        }
        let icon = row_box.first_child().and_downcast::<gtk::Image>().unwrap();
        let texts = row_box.first_child().and_then(|w| w.next_sibling()).and_downcast::<gtk::Box>().unwrap();
        let name = texts.first_child().and_downcast::<gtk::Label>().unwrap();
        let arrow = name.next_sibling().and_downcast::<gtk::Label>().unwrap();
        let future = arrow.next_sibling().and_downcast::<gtk::Label>().unwrap();
        let path = texts.next_sibling().and_downcast::<gtk::Label>().unwrap();

        if let Some(gicon) = row.gicon() {
            icon.set_from_gicon(&gicon);
        }
        let current = row.current_name();
        let future_text = row.future_name();
        name.set_label(&current);
        future.set_label(&future_text);
        if future_text != current {
            arrow.set_visible(true);
            future.set_visible(true);
            future.remove_css_class("dim-label");
            future.add_css_class("future-name-changed");
        } else {
            arrow.set_visible(false);
            future.set_visible(false);
            future.add_css_class("dim-label");
            future.remove_css_class("future-name-changed");
        }
        path.set_label(&row.path());
    });

    let sort_model = gtk::SortListModel::new(Some(file_store.clone()), None::<gtk::Sorter>);
    let selection = gtk::MultiSelection::new(Some(sort_model.clone()));
    let list_view = gtk::ListView::new(Some(selection.clone()), Some(factory));
    list_view.add_css_class("main-list-view");
    list_view.set_show_separators(false);
    list_view.set_single_click_activate(false);
    state.borrow_mut().file_selection = Some(selection.clone());
    state.borrow_mut().file_sort_model = Some(sort_model.clone());
    // Double-click to open file
    {
        let st = state.clone();
        let gesture = gtk::GestureClick::new();
        gesture.set_button(1);
        gesture.connect_pressed(move |_, n_press, _, _| {
            if n_press == 2 {
                let s = st.borrow();
                if let Some(idx) = s.file_selected.iter().position(|x| *x) {
                    if let Some(item) = s.files.get(idx) {
                        let _ = open::that(&item.full_name);
                    }
                }
            }
        });
        list_view.add_controller(gesture);
    }
    // Right-click to open containing folder
    {
        let st = state.clone();
        let gesture = gtk::GestureClick::new();
        gesture.set_button(3);
        gesture.connect_released(move |_, _, _, _| {
            let s = st.borrow();
            if let Some(idx) = s.file_selected.iter().position(|x| *x) {
                if let Some(item) = s.files.get(idx) {
                    let _ = open::that(&item.path);
                }
            }
        });
        list_view.add_controller(gesture);
    }
    (list_view, file_store, selection, sort_model)
}

fn build_rule_list_view(
    selection: &gtk::MultiSelection,
    state: &SharedState,
    editor_state: &SharedEditorState,
    rule_store: &gio::ListStore,
    file_store: &gio::ListStore,
    gui_state: &SharedGuiState,
    window: &adw::ApplicationWindow,
) -> (gtk::ListView, gtk::SortListModel) {
    // Row: [icon] [type (title) / usage (subtitle)]
    let factory = gtk::SignalListItemFactory::new();
    factory.connect_setup(|_, list_item| {
        let li = list_item.downcast_ref::<gtk::ListItem>().unwrap();
        let row_box = gtk::Box::new(gtk::Orientation::Horizontal, 10);
        row_box.add_css_class("list-row");
        row_box.set_margin_top(2);
        row_box.set_margin_bottom(2);
        row_box.set_margin_start(9);
        row_box.set_margin_end(9);

        let icon = gtk::Image::from_icon_name("text-x-generic-symbolic");
        icon.set_pixel_size(22);
        icon.set_valign(gtk::Align::Center);
        row_box.append(&icon);

        let texts = gtk::Box::new(gtk::Orientation::Horizontal, 6);
        texts.set_hexpand(true);
        texts.set_valign(gtk::Align::Center);
        let rtype = gtk::Label::new(None);
        rtype.set_xalign(0.0);
        rtype.set_ellipsize(gtk::pango::EllipsizeMode::End);
        rtype.add_css_class("file-row-name");
        let usage = gtk::Label::new(None);
        usage.set_xalign(1.0);
        usage.set_hexpand(true);
        usage.set_ellipsize(gtk::pango::EllipsizeMode::Middle);
        usage.add_css_class("dim-label");
        texts.append(&rtype);
        texts.append(&usage);
        row_box.append(&texts);

        li.set_child(Some(&row_box));
    });
    factory.connect_bind(|_, list_item| {
        let li = list_item.downcast_ref::<gtk::ListItem>().unwrap();
        let row = li.item().and_downcast::<RuleRow>().unwrap();
        let row_box = li.child().and_downcast::<gtk::Box>().unwrap();
        // First row: remove top gap so the gray box touches the list area top.
        if li.position() == 0 {
            row_box.set_margin_top(0);
        } else {
            row_box.set_margin_top(2);
        }
        let icon = row_box.first_child().and_downcast::<gtk::Image>().unwrap();
        let texts = row_box.first_child().and_then(|w| w.next_sibling()).and_downcast::<gtk::Box>().unwrap();
        let rtype = texts.first_child().and_downcast::<gtk::Label>().unwrap();
        let usage = texts.first_child().and_then(|w| w.next_sibling()).and_downcast::<gtk::Label>().unwrap();

        if let Some(gicon) = row.gicon() {
            icon.set_from_gicon(&gicon);
        }
        rtype.set_label(&row.rule_type_text());
        let ut = row.usage_text();
        let desc = row.description();
        if ut == crate::fls!("rule_place_none") && !desc.is_empty() {
            // Custom rules: show the actual rule text instead of "不适用".
            usage.set_label(&desc);
            usage.set_visible(true);
        } else if !ut.is_empty() {
            usage.set_label(&ut);
            usage.set_visible(true);
        } else {
            usage.set_visible(false);
        }
    });

    let sort_model = gtk::SortListModel::new(Some(rule_store.clone()), None::<gtk::Sorter>);
    let list_view = gtk::ListView::new(Some(selection.clone()), Some(factory));
    list_view.add_css_class("main-list-view");
    list_view.set_show_separators(false);
    list_view.set_single_click_activate(false);
    // Double-click to edit rule
    {
        let st = state.clone();
        let es = editor_state.clone();
        let rs = rule_store.clone();
        let fs = file_store.clone();
        let gs = gui_state.clone();
        let w = window.clone();
        let gesture = gtk::GestureClick::new();
        gesture.set_button(1);
        gesture.connect_released(move |_, n_press, _, _| {
            if n_press >= 2 {
                let idx = st.borrow().rule_selected.iter().position(|x| *x).map_or(0, |i| i as i32);
                super::rule_editor::show_rule_editor(&w, &es, &st, &rs, &fs, &gs, Some(idx));
            }
        });
        list_view.add_controller(gesture);
    }
    (list_view, sort_model)
}
