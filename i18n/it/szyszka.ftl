# Upper buttons
upper_start_renaming_button = Inizia A Rinominare
upper_add_files_button = Aggiungi File
upper_add_folders_button = Aggiungi Cartelle
upper_remove_selection_button = Rimuovi Selezione
upper_update_names_button = Aggiorna Nomi
upper_results_one_up_button = Uno Su
upper_results_one_down_button = Uno Giù
upper_select_popup_button = Seleziona
# Bottom Buttons
bottom_rule_add_button = Aggiungi Regola
bottom_rule_edit_button = Modifica Regola
bottom_rule_remove_button = Rimuovi Regola
bottom_rule_one_up_button = Uno Su
bottom_rule_one_down_button = Uno Giù
bottom_rule_save_rules_button = Salva Regole
bottom_rule_load_rules_button = Carica Regole
# Edit names
edit_names_used_in_rules = Nomi usati nelle regole: { $rules }
edit_names_choose_name = Scegli il nome delle regole (se esiste, la sovrascriverà)
# Tree View Rules
tree_view_upper_column_type = Tipo
tree_view_upper_column_current_name = Nome Corrente
tree_view_upper_column_future_name = Nome Futuro
tree_view_upper_column_path = Percorso
# Tree View Results
tree_view_bottom_tool_type = Tipo Di Strumento
tree_view_bottom_usage_name = Nome Utilizzo
tree_view_bottom_description = Descrizione
# Settings
settings_language_label = Lingua
settings_open_rules = Apri file impostazioni regole
settings_open_cache_custom_texts = Apri file cache personalizzato
settings_open_config_dir = Apri cache dir
check_button_dark_theme = Icone scure
# Other in main window
bottom_rule_label_rules = Regole
upper_files_folders_label = File/Cartelle
upper_files_folders_label_update = File/Cartelle ({ $files_number }) – AGGIORNAMENTO RICHIESTO
upper_files_folders_label_up_to_date = File/Cartelle({ $files_number }) - aggiornato
# Select popover
button_select_all = Seleziona Tutto
button_select_reverse = Selezione Inversa
button_select_custom = Seleziona Personalizzato
button_unselect_all = Deseleziona tutto
button_select_changed = Seleziona Modificato
button_unselect_changed = Deseleziona Modificato
# Un/Select custom
select_custom_example = Uso: */cartella-n.*/* o nome-versione-*.txt
select_custom_path = Percorso
select_custom_current_path = Percorso Corrente
select_custom_future_path = Percorso Futuro
select_custom_path_current_name = Percorso + Nome Corrente
select_custom_path_future_name = Percorso + Nome Futuro
select_custom_directory_file = Cartella/File
select_custom_select_directory = Seleziona Cartella
select_custom_unselect_directory = Deseleziona Cartella
# General
dialog_button_ok = OK
dialog_button_cancel = Annulla
# Dialogs
dialog_name_files_to_include = File da includere
dialog_name_folders_to_include = Cartelle da includere
dialog_scan_inside = Scansiona all'interno
dialog_ignore_folders = Ignora cartelle
dialog_confirm_renaming = Conferma rinominazione
dialog_outdated_results = Risultati obsoleti
dialog_results_of_renaming = Risultati della rinominazione
dialog_save_rule = Salva Regola
dialog_select_custom = Seleziona Personalizzato
settings_open_log_folder = Apri cartella dei log

# Rule Window


## Common

label_usage_type = Tipo Di Utilizzo:
label_example = ESEMPIO
label_example_text_before = Prima:
label_example_text_after = Dopo:
button_rule_window_add = Aggiungi Regola

## Custom

label_custom_instruction = $(NAME) - stampa il nome del file
                           $(EXT) - stampa l'estensione
                           $(MODIF) - stampa la data di modifica del file
                           $(CREAT) - stampa la data di creazione del file
                           $(CURR) - stampa il nome corrente del file con l'estensione
                           $(PARENT) - stampa il nome della cartella padre
                           $(N)/$(K) - stampa numeri (gli argomenti sono opzionali)
                           $(N:3:4:5) stampa numeri da 3, con passo 4
                           e li riempie con zeri fino a 5 posizioni.
                           K invece solo la posizione nell'elenco, usa anche la posizione dell'elemento nella cartella.
menu_button_load_custom_rule = Selettore regola personalizzata
button_save_custom_rule = Salva regola personalizzata

## Upper/Lower Case

check_button_letters_type_uppercase = Maiuscolo
check_button_letters_type_lowercase = Minuscolo
check_button_letters_usage_name = Solo Nome
check_button_letters_usage_extension = Solo Estensione
check_button_letters_usage_both = Entrambi
label_letters_tool_type = Tipo Strumento:
# Purge
label_purge_tool_type = Tipo Strumento:
check_button_purge_name = Solo Nome
check_button_purge_extension = Solo Estensione
check_button_purge_both = Entrambi
# Add number
label_add_number_place = Luogo per inserire il numero:
label_add_number_settings = Impostazioni numero:
check_button_add_number_before_name = Prima Del Nome
check_button_add_number_after_name = Dopo Il Nome
label_number_start_number = Numero iniziale
label_number_step = Passo
label_number_fill_zeros = Riempi con zeri
# Add text
check_button_add_text_before_name = Prima Del Nome
check_button_add_text_after_name = Dopo Il Nome
label_add_text = Testo da aggiungere:
# Replace
check_button_replace_name = Solo Nome
check_button_replace_extension = Solo Estensione
check_button_replace_both = Entrambi
check_button_replace_case_sensitive = Distingui Maiuscole
check_button_replace_case_insensitive = Distingui Maiuscole
check_button_replace_regex = Usa regex
check_button_replace_replace_all = Sostituisci tutte le occorrenze
label_replace_replacing_strings = Sostituzione Stringe:
label_replace_text_to_find = Testo da trovare
label_replace_text_to_replace = Testo sostituito
label_replace_captures = Catture
label_replace_captured_captures = Catture catturate
label_replace_captures_number = ({ $capture_number } gruppi acquisiti)
label_replace_no_captures = Nessuna cattura
label_replace_invalid_regex = REGEX INVALIDO
# Trim
check_button_trim_name_start = Inizio Nome
check_button_trim_name_end = Fine Nome
check_button_trim_extension_start = Inizio Estensione
check_button_trim_extension_end = Fine Estensione
check_button_trim_case_sensitive = Distingui Maiuscole
check_button_trim_case_insensitive = Distingui Maiuscole
label_trim_trim_text = Taglia testo
label_trim_case_sensitivity = Sensibilità Caso
# Normalize name
label_normalize_name = Tutto – rinomina il nome in modo che contenga soltanto i caratteri `a-z`, `0-9`, `-`, lo spazio e `.`.
                       Esempio: `żółć CZERona.Txt` → `zolc-czerwona.txt`

                       Parziale – funziona come l’opzione precedente, ma consente gli spazi e le lettere maiuscole `A-Z`.
                       Esempio: ` Źrebię Krokietowe.Rar ` → `Zrebie Krokietowe.Rar`
check_button_normalize_everything = Tutto
check_button_normalize_partial = Parziale
# RuleType
rule_type_custom = Personalizzato
rule_type_case_size = Dimensione Caso
rule_type_purge = Elimina
rule_type_add_text = Aggiungi Testo
rule_type_trim = Taglia
rule_type_replace = Sostituisci
rule_type_add_number = Aggiungi Numero
rule_type_normalize = Normalizza
# RulePlace
rule_place_none = Non applicabile
rule_place_extension = Solo Estensione
rule_place_name = Solo Nome
rule_place_extension_name = Estensione e nome
rule_place_before_extension = Prima Dell'Estensione
rule_place_after_extension = Dopo L'Estensione
rule_place_before_name = Prima Del Nome
rule_place_after_name = Dopo Il Nome
rule_place_from_name_start = Da Inizio
rule_place_from_name_end_reverse = Dalla fine del nome all'inizio
rule_place_from_extension_start = Dall'Inizio Dell'Estensione
rule_place_from_extension_end_reverse = Dalla fine dell'estensione all'avvio
# Rule Description
rule_description_full_normalize = Normalizzazione completa
rule_description_partial_normalize = Normalizzazione parziale
rule_description_zeros = e riempiendo con { $zeros } zeri,
rule_description_step = A partire da { $start } con il passo { $step }{ $zeros }
rule_description_lowercase = Minuscolo
rule_description_uppercase = Maiuscolo
rule_description_text = testo
rule_description_added_text = Testo aggiunto:
rule_description_start = inizio
rule_description_end_of_name = fine del nome
rule_description_extension = estensione
rule_description_end_of_extension = fine dell'estensione
rule_description_trimming = Rifilatura "{ $trim_text }" da { $where_remove }
rule_description_custom_rule = Regola personalizzata: { $custom_rule }
rule_description_replace = Sostituzione { $additional_regex_text } "{ $text_to_find }" con "{ $text_to_replace }"
# Notebooks
notebook_tab_custom = Personalizzato
notebook_tab_case_size = Casi Superiori/Minori
notebook_tab_purge = Elimina
notebook_tab_add_number = Aggiungi Numero
notebook_tab_add_text = Aggiungi Testo
notebook_tab_replace = Sostituisci
notebook_tab_trim = Taglia
notebook_tab_normalize = Nome Normalizza
# Renaming dialog
renaming_question = Sei sicuro di voler rinominare { $number_of_renamed_files } file?
renaming_destination_file_exists = Il file di destinazione esiste già.
renaming_renamed_files = Rinominato correttamente { $properly_renamed } file
renaming_ignored_files = Ignorato { $ignored } file, perché il nome prima e dopo la modifica è lo stesso.
renaming_failed_files = Impossibile rinominare { $failed_vector } file
renaming_list_of_failed_to_rename = Elenco di tutti i rinomini falliti
renaming_error = errore
renaming_some_records_not_updated = Alcuni record non sono aggiornati, puoi farlo facendo clic sul pulsante Aggiorna nomi.\nSei sicuro di voler procedere senza aggiornare i nomi?
renaming_missing_files = File Mancanti
renaming_require_missing_files = È necessario utilizzare almeno 1 file
renaming_missing_rules = Regole Mancanti
renaming_require_missing_rules = Devi usare almeno 1 regola


# --- Missing translations added ---
ctrl_after_name = Dopo il nome
ctrl_before_name = Prima del nome
ctrl_both = Entrambi
ctrl_case_insensitive = Ignora maiuscole/minuscole
ctrl_case_sensitive = Distingui maiuscole/minuscole
ctrl_everything = Tutto
ctrl_extension_end = Fine estensione
ctrl_extension_start = Inizio estensione
ctrl_fill_zeros = Riempire con zeri
ctrl_lowercase = Minuscolo
ctrl_match_against = Corrispondenza con:
ctrl_name_end = Fine nome
ctrl_name_start = Inizio nome
ctrl_only_extension = Solo estensione
ctrl_only_name = Solo nome
ctrl_partial = Parziale
ctrl_replace_all = Sostituisci tutto
ctrl_start_number = Numero iniziale
ctrl_step = Passo
ctrl_text_to_find = Testo da cercare
ctrl_text_to_replace = Testo sostituito
ctrl_trim_text = Testo da tagliare
ctrl_uppercase = Maiuscolo
ctrl_use_regex = Usa regex
dialog_add_folders_body = Configura le opzioni di scansione
dialog_add_folders_title = Cartelle da includere
dialog_copy_all_errors = Copia tutti gli errori
dialog_language_body = Seleziona la lingua dell'applicazione
dialog_language_restart = Riavvia
dialog_language_restart_confirm = La lingua cambierà dopo il riavvio. Riavviare ora?
dialog_language_title = Lingua
dialog_loading = Lavorazione…
dialog_move_down = Sposta giù
dialog_move_up = Sposta su
dialog_save_rule_set_body = Scegli il nome delle regole (se esiste, verrà sovrascritto)
dialog_save_rule_set_name = Nome regola
dialog_save_rule_set_title = Salva set di regole
dialog_saved_rule_sets = Set di regole salvati
dialog_select = Seleziona
dialog_select_body = Scegli un'azione di selezione
dialog_select_custom_body = Utilizzo: */cartella*/* o nome-versione-*.txt
dialog_select_custom_hint = Quando la modalità Directory/File è attiva, il pattern viene ignorato.
dialog_select_custom_include_dirs = Includi directory
dialog_select_custom_match = Corrispondenza con:
dialog_select_custom_pattern = Schema
dialog_select_custom_title = Seleziona / Deseleziona personalizzato
empty_state_files_description = Aggiungi file o cartelle per iniziare a rinominare
empty_state_files_title = Nessun file caricato
empty_state_rules_description = Aggiungi una regola per definire come rinominare i file
empty_state_rules_title = Nessuna regola configurata
menu_about = Informazioni
menu_appearance = Aspetto
menu_dark_theme = Tema scuro
menu_language = Lingua…
menu_light_theme = Tema chiaro
menu_open_config_dir = Apri cartella configurazione
menu_open_custom_texts_file = Apri file testi personalizzati
menu_open_log_folder = Apri cartella log
menu_open_rules_file = Apri file impostazioni regole
menu_preferences = Preferenze
menu_title = Menu
rule_editor_add = Aggiungi regola
rule_editor_cancel = Annulla
rule_editor_custom_save = Salva regola personalizzata
rule_editor_custom_saved = Testi personalizzati salvati:
rule_editor_delete = Elimina
rule_editor_edit = Modifica regola
rule_editor_example = ESEMPIO
rule_editor_example_after = Dopo:
rule_editor_example_before = Prima:
rule_editor_load = Carica
rule_editor_reset = Ripristina predefinito
rule_editor_title = Editor regole
rule_editor_tool_type = Tipo di strumento:
rule_editor_usage_type = Tipo di utilizzo:
rule_no_selection = Nessuna regola selezionata. Seleziona una regola da modificare.
select_custom_hint = Quando la modalità Directory/File è attiva, il pattern viene ignorato.
settings_theme = Tema
settings_theme_dark = Scuro
settings_theme_light = Chiaro
settings_theme_system = Sistema
sort_by = Ordina per
sort_descending = Decrescente
sort_future_name = Nuovo nome
sort_name = Nome
sort_path = Percorso
sort_type = Tipo
sort_usage = Utilizzo
status_up_to_date = aggiornato
status_update_required = AGGIORNAMENTO RICHIESTO
tab_add_number = Aggiungi numero
tab_add_text = Aggiungi testo
tab_case_size = Maiuscole/Minuscole
tab_custom = Personalizzato
tab_normalize = Normalizza nome
tab_purge = Elimina
tab_replace = Sostituisci
tab_trim = Taglia
