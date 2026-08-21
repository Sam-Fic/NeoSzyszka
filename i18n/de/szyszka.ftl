# Upper buttons
upper_start_renaming_button = Umbenennen starten
upper_add_files_button = Dateien hinzufügen
upper_add_folders_button = Ordner hinzufügen
upper_remove_selection_button = Auswahl entfernen
upper_update_names_button = Namen aktualisieren
upper_results_one_up_button = Einmal oben
upper_results_one_down_button = Eine Tiefe
upper_select_popup_button = Auswählen
# Bottom Buttons
bottom_rule_add_button = Neue Regel
bottom_rule_edit_button = Regel bearbeiten
bottom_rule_remove_button = Regel entfernen
bottom_rule_one_up_button = Einmal oben
bottom_rule_one_down_button = Eine Tiefe
bottom_rule_save_rules_button = Regeln speichern
bottom_rule_load_rules_button = Lade Regeln
# Edit names
edit_names_used_in_rules = Namen, die in Regeln verwendet werden: { $rules }
edit_names_choose_name = Name der Regeln wählen (falls vorhanden, wird sie überschrieben)
# Tree View Rules
tree_view_upper_column_type = Typ
tree_view_upper_column_current_name = Aktueller Name
tree_view_upper_column_future_name = Zukünftige Name
tree_view_upper_column_path = Pfad
# Tree View Results
tree_view_bottom_tool_type = Werkzeugtyp
tree_view_bottom_usage_name = Nutzungsname
tree_view_bottom_description = Beschreibung
# Settings
settings_language_label = Sprache
settings_open_rules = Öffne Regel-Einstellungsdatei
settings_open_cache_custom_texts = Eigene Cache-Datei öffnen
settings_open_config_dir = Cache-Verzeichnis öffnen
check_button_dark_theme = Dunkle Symbole
# Other in main window
bottom_rule_label_rules = Regeln
upper_files_folders_label = Dateien/Ordner
upper_files_folders_label_update = Dateien/Ordner ({ $files_number }) – AKTUALISIERUNG ERFORDERLICH
upper_files_folders_label_up_to_date = Dateien/Ordner ({ $files_number }) - Aktuell
# Select popover
button_select_all = Alle auswählen
button_select_reverse = Auswahl umkehren
button_select_custom = Eigene auswählen
button_unselect_all = Alle abwählen
button_select_changed = Geändert auswählen
button_unselect_changed = Auswahl abwählen
# Un/Select custom
select_custom_example = Verwendung: */ordner-nr*/* oder name-version-*.txt
select_custom_path = Pfad
select_custom_current_path = Aktueller Pfad
select_custom_future_path = Zukünftige Pfad
select_custom_path_current_name = Pfad + aktueller Name
select_custom_path_future_name = Pfad + Zufallsname
select_custom_directory_file = Verzeichnis/Datei
select_custom_select_directory = Verzeichnis auswählen
select_custom_unselect_directory = Verzeichnis deaktivieren
# General
dialog_button_ok = OK
dialog_button_cancel = Abbrechen
# Dialogs
dialog_name_files_to_include = Dateien zum Einbinden
dialog_name_folders_to_include = Ordner zum Einbinden
dialog_scan_inside = Scannen innerhalb
dialog_ignore_folders = Ordner ignorieren
dialog_confirm_renaming = Umbenennen bestätigen
dialog_outdated_results = Veraltete Ergebnisse
dialog_results_of_renaming = Ergebnisse des Umbenennens
dialog_save_rule = Regel speichern
dialog_select_custom = Eigene auswählen
settings_open_log_folder = Log-Ordner öffnen

# Rule Window


## Common

label_usage_type = Verwendungstyp:
label_example = BEISPIEL
label_example_text_before = Vor:
label_example_text_after = Nach:
button_rule_window_add = Regel hinzufügen

## Custom

label_custom_instruction = $(NAME) - gibt den Dateinamen aus
                           $(EXT) - gibt die Erweiterung aus
                           $(MODIF) - gibt das Änderungsdatum der Datei aus
                           $(CREAT) - gibt das Erstellungsdatum aus
                           $(CURR) - gibt den aktuellen Dateinamen mit Erweiterung aus
                           $(PARENT) - gibt den Namen des übergeordneten Ordners aus
                           $(N)/$(K) - gibt Zahlen aus (Argumente sind optional)
                           $(N:3:4:5) gibt Zahlen ab 3 aus, mit Schritt 4
                           und füllt sie mit Nullen auf 5 Stellen auf.
                           K gibt stattdessen nur die Position in der Liste an, ebenfalls die Position des Elements im Ordner.
menu_button_load_custom_rule = Eigene Regelauswahl
button_save_custom_rule = Eigene Regel speichern

## Upper/Lower Case

check_button_letters_type_uppercase = Großbuchstaben
check_button_letters_type_lowercase = Kleinbuchstaben
check_button_letters_usage_name = Nur Name
check_button_letters_usage_extension = Nur Erweiterung
check_button_letters_usage_both = Beides
label_letters_tool_type = Werkzeugtyp:
# Purge
label_purge_tool_type = Werkzeugtyp:
check_button_purge_name = Nur Name
check_button_purge_extension = Nur Erweiterung
check_button_purge_both = Beides
# Add number
label_add_number_place = Ort für Nummer:
label_add_number_settings = Nummerneinstellungen:
check_button_add_number_before_name = Vorname
check_button_add_number_after_name = Nachname
label_number_start_number = Startnummer
label_number_step = Schritt
label_number_fill_zeros = Mit Null füllen
# Add text
check_button_add_text_before_name = Vorname
check_button_add_text_after_name = Nachname
label_add_text = Zu hinzufügender Text:
# Replace
check_button_replace_name = Nur Name
check_button_replace_extension = Nur Erweiterung
check_button_replace_both = Beides
check_button_replace_case_sensitive = Groß-/Kleinschreibung
check_button_replace_case_insensitive = Groß-/Kleinschreibung
check_button_replace_regex = Regex verwenden
check_button_replace_replace_all = Alle Vorkommnisse ersetzen
label_replace_replacing_strings = Zeichenketten ersetzen:
label_replace_text_to_find = Zu findende Text
label_replace_text_to_replace = Ersetzter Text
label_replace_captures = Aufnahmen
label_replace_captured_captures = Erfasste Aufnahmen
label_replace_captures_number = ({ $capture_number } Erfassungsgruppen)
label_replace_no_captures = Keine Aufnahmen
label_replace_invalid_regex = UNGÜLTIGE REGEX
# Trim
check_button_trim_name_start = Namensanfang
check_button_trim_name_end = Name Ende
check_button_trim_extension_start = Erweiterungs-Start
check_button_trim_extension_end = Ende der Erweiterung
check_button_trim_case_sensitive = Groß-/Kleinschreibung
check_button_trim_case_insensitive = Groß-/Kleinschreibung
label_trim_trim_text = Text kürzen
label_trim_case_sensitivity = Groß-/Kleinschreibung
# Normalize name
label_normalize_name = Alles – benennt den Namen so um, dass er nur die Zeichen `a-z`, `0-9`, `-`, Leerzeichen und `.` enthält.
                       Beispiel: `żółć CZERona.Txt` → `zolc-czerwona.txt`

                       Teilweise – funktioniert wie die obige Option, erlaubt aber Leerzeichen und Großbuchstaben `A-Z`.
                       Beispiel: ` Źrebię Krokietowe.Rar ` → `Zrebie Krokietowe.Rar`
check_button_normalize_everything = Alles
check_button_normalize_partial = Teilweise
# RuleType
rule_type_custom = Eigene
rule_type_case_size = Fallgröße
rule_type_purge = Bereinigen
rule_type_add_text = Neuer Text
rule_type_trim = Trimmen
rule_type_replace = Ersetzen
rule_type_add_number = Nummer hinzufügen
rule_type_normalize = Normalisieren
# RulePlace
rule_place_none = Nicht zutreffend
rule_place_extension = Nur Erweiterung
rule_place_name = Nur Name
rule_place_extension_name = Erweiterung und Name
rule_place_before_extension = Vor der Erweiterung
rule_place_after_extension = Nach der Erweiterung
rule_place_before_name = Vorname
rule_place_after_name = Nachname
rule_place_from_name_start = Von Anfang
rule_place_from_name_end_reverse = Von Name Ende bis Start
rule_place_from_extension_start = Von Extension Start
rule_place_from_extension_end_reverse = Vom Ende bis zum Start der Erweiterung
# Rule Description
rule_description_full_normalize = Volle Normalisierung
rule_description_partial_normalize = Teilweise normalisieren
rule_description_zeros = und füllen mit { $zeros } Nullen
rule_description_step = Beginnend mit { $start } mit Schritt { $step }{ $zeros }
rule_description_lowercase = Kleinbuchstaben
rule_description_uppercase = Großbuchstaben
rule_description_text = text
rule_description_added_text = Text hinzugefügt:
rule_description_start = anfangen
rule_description_end_of_name = Ende des Namens
rule_description_extension = ausbau
rule_description_end_of_extension = Ende der Erweiterung
rule_description_trimming = Schneiden "{ $trim_text }" von { $where_remove }
rule_description_custom_rule = Eigene Regel: { $custom_rule }
rule_description_replace = Ersetze { $additional_regex_text } "{ $text_to_find }" durch "{ $text_to_replace }"
# Notebooks
notebook_tab_custom = Eigene
notebook_tab_case_size = Ober-/Untere Fälle
notebook_tab_purge = Bereinigen
notebook_tab_add_number = Nummer hinzufügen
notebook_tab_add_text = Neuer Text
notebook_tab_replace = Ersetzen
notebook_tab_trim = Trimmen
notebook_tab_normalize = Normalisiere Name
# Renaming dialog
renaming_question = Sind Sie sicher, dass Sie { $number_of_renamed_files } Dateien umbenennen möchten?
renaming_destination_file_exists = Zieldatei existiert bereits.
renaming_renamed_files = { $properly_renamed } Dateien korrekt umbenannt
renaming_ignored_files = Ignorierte { $ignored } -Dateien, weil der Name vor und nach der Änderung gleich ist.
renaming_failed_files = Umbenennen der { $failed_vector } Dateien fehlgeschlagen
renaming_list_of_failed_to_rename = Liste aller fehlerhaften Umbenennungen
renaming_error = fehlerhaft
renaming_some_records_not_updated = Einige Datensätze werden nicht aktualisiert, Sie können dies durch Klicken auf die Schaltfläche Name aktualisieren.\nSind Sie sicher, dass Sie fortfahren wollen, ohne die Namen zu aktualisieren?
renaming_missing_files = Fehlende Dateien
renaming_require_missing_files = Sie müssen mindestens 1 Datei verwenden
renaming_missing_rules = Fehlende Regeln
renaming_require_missing_rules = Sie müssen mindestens 1 Regel verwenden


# --- Missing translations added ---
ctrl_after_name = Nach dem Namen
ctrl_before_name = Vor dem Namen
ctrl_both = Beides
ctrl_case_insensitive = Groß-/Kleinschreibung ignorieren
ctrl_case_sensitive = Groß-/Kleinschreibung beachten
ctrl_everything = Alles
ctrl_extension_end = Erweiterungsende
ctrl_extension_start = Erweiterungsanfang
ctrl_fill_zeros = Mit Nullen auffüllen
ctrl_lowercase = Kleinschreibung
ctrl_match_against = Abgleichen mit:
ctrl_name_end = Namenende
ctrl_name_start = Namenanfang
ctrl_only_extension = Nur Erweiterung
ctrl_only_name = Nur Name
ctrl_partial = Teilweise
ctrl_replace_all = Alle ersetzen
ctrl_start_number = Startnummer
ctrl_step = Schritt
ctrl_text_to_find = Zu suchender Text
ctrl_text_to_replace = Ersetzter Text
ctrl_trim_text = Zu entfernender Text
ctrl_uppercase = Großschreibung
ctrl_use_regex = Regex verwenden
dialog_add_folders_body = Scan-Optionen konfigurieren
dialog_add_folders_title = Einzuschließende Ordner
dialog_copy_all_errors = Alle Fehler kopieren
dialog_language_body = Anwendungssprache auswählen
dialog_language_restart = Neu starten
dialog_language_restart_confirm = Die Sprache ändert sich nach dem Neustart. Jetzt neu starten?
dialog_language_title = Sprache
dialog_loading = Arbeitsvorgang…
dialog_move_down = Nach unten
dialog_move_up = Nach oben
dialog_save_rule_set_body = Namen der Regeln wählen (falls vorhanden, wird er überschrieben)
dialog_save_rule_set_name = Regelname
dialog_save_rule_set_title = Regelsatz speichern
dialog_saved_rule_sets = Gespeicherte Regelsätze
dialog_select = Auswählen
dialog_select_body = Auswahlaktion wählen
dialog_select_custom_body = Verwendung: */ordner*/* oder name-version-*.txt
dialog_select_custom_hint = Wenn der Verzeichnis-/Datei-Modus aktiv ist, wird das Muster ignoriert.
dialog_select_custom_include_dirs = Verzeichnisse einschließen
dialog_select_custom_match = Abgleichen mit:
dialog_select_custom_pattern = Muster
dialog_select_custom_title = Auswählen / Abwählen benutzerdefiniert
empty_state_files_description = Dateien oder Ordner hinzufügen, um das Umbenennen zu starten
empty_state_files_title = Keine Dateien geladen
empty_state_rules_description = Füge eine Regel hinzu, um festzulegen, wie Dateien umbenannt werden sollen
empty_state_rules_title = Keine Regeln konfiguriert
menu_about = Über
menu_appearance = Erscheinungsbild
menu_dark_theme = Dunkles Theme
menu_language = Sprache…
menu_light_theme = Helles Theme
menu_open_config_dir = Konfigurationsordner öffnen
menu_open_custom_texts_file = Benutzerdefinierte Texte-Datei öffnen
menu_open_log_folder = Protokollordner öffnen
menu_open_rules_file = Regel-Einstellungsdatei öffnen
menu_preferences = Einstellungen
menu_title = Menü
rule_editor_add = Regel hinzufügen
rule_editor_cancel = Abbrechen
rule_editor_custom_save = Benutzerdefinierte Regel speichern
rule_editor_custom_saved = Gespeicherte benutzerdefinierte Texte:
rule_editor_delete = Löschen
rule_editor_edit = Regel bearbeiten
rule_editor_example = BEISPIEL
rule_editor_example_after = Nachher:
rule_editor_example_before = Vorher:
rule_editor_load = Laden
rule_editor_reset = Auf Standard zurücksetzen
rule_editor_title = Regeleditor
rule_editor_tool_type = Werkzeugtyp:
rule_editor_usage_type = Verwendungstyp:
rule_no_selection = Keine Regel ausgewählt. Wähle eine Regel zum Bearbeiten.
select_custom_hint = Wenn der Verzeichnis-/Datei-Modus aktiv ist, wird das Muster ignoriert.
settings_theme = Erscheinungsbild
settings_theme_dark = Dunkel
settings_theme_light = Hell
settings_theme_system = Systemstandard
sort_by = Sortieren nach
sort_descending = Absteigend
sort_future_name = Neuer Name
sort_name = Name
sort_path = Pfad
sort_type = Typ
sort_usage = Verwendung
status_up_to_date = aktuell
status_update_required = AKTUALISIERUNG ERFORDERLICH
tab_add_number = Nummer hinzufügen
tab_add_text = Text hinzufügen
tab_case_size = Groß-/Kleinschreibung
tab_custom = Benutzerdefiniert
tab_normalize = Namen normalisieren
tab_purge = Bereinigen
tab_replace = Ersetzen
tab_trim = Kürzen
