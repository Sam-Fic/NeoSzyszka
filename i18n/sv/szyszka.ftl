# Upper buttons
upper_start_renaming_button = Börja döpa om
upper_add_files_button = Lägg till filer
upper_add_folders_button = Lägg till mappar
upper_remove_selection_button = Ta bort markering
upper_update_names_button = Uppdatera namn
upper_results_one_up_button = En Upp
upper_results_one_down_button = En Ner
upper_select_popup_button = Välj
# Bottom Buttons
bottom_rule_add_button = Lägg till regel
bottom_rule_edit_button = Redigera regel
bottom_rule_remove_button = Ta bort regel
bottom_rule_one_up_button = En Upp
bottom_rule_one_down_button = En Ner
bottom_rule_save_rules_button = Spara regler
bottom_rule_load_rules_button = Ladda regler
# Edit names
edit_names_used_in_rules = Namn som används i regler: { $rules }
edit_names_choose_name = Välj namn på regler (om det finns, kommer att åsidosätta det)
# Tree View Rules
tree_view_upper_column_type = Typ
tree_view_upper_column_current_name = Nuvarande namn
tree_view_upper_column_future_name = Framtida namn
tree_view_upper_column_path = Sökväg
# Tree View Results
tree_view_bottom_tool_type = Typ av verktyg
tree_view_bottom_usage_name = Användarnamn
tree_view_bottom_description = Beskrivning
# Settings
settings_language_label = Språk
settings_open_rules = Öppna regelinställningar fil
settings_open_cache_custom_texts = Öppna anpassad cachefil
settings_open_config_dir = Öppna cache dir
check_button_dark_theme = Mörka ikoner
# Other in main window
bottom_rule_label_rules = Regler
upper_files_folders_label = Filer/Mappar
upper_files_folders_label_update = Filer/Mappar({ $files_number }) - ##### UPPDATERA KRÄVS #####
upper_files_folders_label_up_to_date = Filer/Mappar({ $files_number }) - aktuella
# Select popover
button_select_all = Markera alla
button_select_reverse = Omvänd markering
button_select_custom = Välj anpassad
button_unselect_all = Avmarkera alla
button_select_changed = Välj Ändrad
button_unselect_changed = Avmarkera ändrad
# Un/Select custom
select_custom_example = Användning: */mapp-nr*/* eller namn-version-*.txt
select_custom_path = Sökväg
select_custom_current_path = Nuvarande sökväg
select_custom_future_path = Framtida sökväg
select_custom_path_current_name = Sökväg + aktuellt namn
select_custom_path_future_name = Sökväg + framtida namn
select_custom_directory_file = Katalog/Fil
select_custom_select_directory = Välj katalog
select_custom_unselect_directory = Avmarkera katalog
# General
dialog_button_ok = OK
dialog_button_cancel = Avbryt
# Dialogs
dialog_name_files_to_include = Filer att inkludera
dialog_name_folders_to_include = Mappar att inkludera
dialog_scan_inside = Skanna inuti
dialog_ignore_folders = Ignorera mappar
dialog_confirm_renaming = Bekräfta namnbyte
dialog_outdated_results = Föråldrade resultat
dialog_results_of_renaming = Resultat av att byta namn
dialog_save_rule = Spara regel
dialog_select_custom = Välj anpassad
settings_open_log_folder = Öppna loggmapp

# Rule Window


## Common

label_usage_type = Typ av användning:
label_example = EXEMPEL
label_example_text_before = Före:
label_example_text_after = Efter:
button_rule_window_add = Regel Lägg till

## Custom

label_custom_instruction = $(NAME) - skriver ut filnamnet
                           $(EXT) - skriver ut tillägget
                           $(MODIF) - skriver ut filens ändringsdatum
                           $(CREAT) - skriver ut filens skapandedatum
                           $(CURR) - skriver ut det aktuella filnamnet med tillägg
                           $(PARENT) - skriver ut namnet på den överordnade mappen
                           $(N)/$(K) - skriver ut nummer (argumenten är valfria)
                           $(N:3:4:5) skriver ut nummer från 3, med steg 4
                           och fyller dem med nollor till 5 positioner.
                           K skriver istället bara ut positionen i listan, använder också positionen för objektet i mappen.
menu_button_load_custom_rule = Anpassad regel väljare
button_save_custom_rule = Spara anpassad regel

## Upper/Lower Case

check_button_letters_type_uppercase = Versaler
check_button_letters_type_lowercase = Gemener
check_button_letters_usage_name = Endast namn
check_button_letters_usage_extension = Endast tillägg
check_button_letters_usage_both = Båda
label_letters_tool_type = Typ av verktyg:
# Purge
label_purge_tool_type = Typ av verktyg:
check_button_purge_name = Endast namn
check_button_purge_extension = Endast tillägg
check_button_purge_both = Båda
# Add number
label_add_number_place = Plats att sätta nummer:
label_add_number_settings = Nummerinställningar:
check_button_add_number_before_name = Före namn
check_button_add_number_after_name = Efter namn
label_number_start_number = Starta nummer
label_number_step = Steg
label_number_fill_zeros = Fyll med nollor
# Add text
check_button_add_text_before_name = Före namn
check_button_add_text_after_name = Efter namn
label_add_text = Text att tillägga:
# Replace
check_button_replace_name = Endast namn
check_button_replace_extension = Endast tillägg
check_button_replace_both = Båda
check_button_replace_case_sensitive = Ärendekänslig
check_button_replace_case_insensitive = Ärendet okänslig
check_button_replace_regex = Använd regex
check_button_replace_replace_all = Ersätt alla förekomster
label_replace_replacing_strings = Ersätter strängar:
label_replace_text_to_find = Text att hitta
label_replace_text_to_replace = Ersatt text
label_replace_captures = Fånga
label_replace_captured_captures = Fångade fångar
label_replace_captures_number = ({ $capture_number } fångstgrupper)
label_replace_no_captures = Inga bilder
label_replace_invalid_regex = OGILTIGT REGULJÄRT UTTRYCK
# Trim
check_button_trim_name_start = Start för namn
check_button_trim_name_end = Namn Slut
check_button_trim_extension_start = Starta tillägg
check_button_trim_extension_end = Tillägg Slut
check_button_trim_case_sensitive = Ärendekänslig
check_button_trim_case_insensitive = Ärendet okänslig
label_trim_trim_text = Trimma text
label_trim_case_sensitivity = Ärendets känslighet
# Normalize name
label_normalize_name = Allt – byter namn så att namnet endast innehåller tecknen `a-z`, `0-9`, `-`, blanksteg och `.`.
                       Exempel: `żółć CZERona.Txt` → `zolc-czerwona.txt`

                       Delvis – fungerar som alternativet ovan men tillåter blanksteg och versaler `A-Z`.
                       Exempel: ` Źrebię Krokietowe.Rar ` → `Zrebie Krokietowe.Rar`
check_button_normalize_everything = Allt
check_button_normalize_partial = Delvis
# RuleType
rule_type_custom = Anpassad
rule_type_case_size = Storlek på ärende
rule_type_purge = Rensa
rule_type_add_text = Lägg till text
rule_type_trim = Beskär
rule_type_replace = Ersätt
rule_type_add_number = Lägg till nummer
rule_type_normalize = Normalisera
# RulePlace
rule_place_none = Ej tillämpligt
rule_place_extension = Endast tillägg
rule_place_name = Endast namn
rule_place_extension_name = Tillägg och namn
rule_place_before_extension = Före tillägg
rule_place_after_extension = Efter tillägg
rule_place_before_name = Före namn
rule_place_after_name = Efter namn
rule_place_from_name_start = Från början
rule_place_from_name_end_reverse = Från namnslut till start
rule_place_from_extension_start = Från tilläggsstart
rule_place_from_extension_end_reverse = Från förlängningsslut till start
# Rule Description
rule_description_full_normalize = Helt normalisera
rule_description_partial_normalize = Delvis normalisera
rule_description_zeros = och fyllning med { $zeros } nollor,
rule_description_step = Börjar med { $start } med steg { $step }{ $zeros }
rule_description_lowercase = Gemener
rule_description_uppercase = Versaler
rule_description_text = text
rule_description_added_text = Lade till text:
rule_description_start = början
rule_description_end_of_name = slutet av namnet
rule_description_extension = tillägg
rule_description_end_of_extension = slut på förlängning
rule_description_trimming = Beskär "{ $trim_text }" från { $where_remove }
rule_description_custom_rule = Anpassad regel: { $custom_rule }
rule_description_replace = Ersätter { $additional_regex_text } "{ $text_to_find }" med "{ $text_to_replace }"
# Notebooks
notebook_tab_custom = Anpassad
notebook_tab_case_size = Övre/Lägre Fall
notebook_tab_purge = Rensa
notebook_tab_add_number = Lägg till nummer
notebook_tab_add_text = Lägg till text
notebook_tab_replace = Ersätt
notebook_tab_trim = Beskär
notebook_tab_normalize = Normalisera namn
# Renaming dialog
renaming_question = Är du säker på att du vill byta namn på { $number_of_renamed_files } filer?
renaming_destination_file_exists = Målfilen finns redan.
renaming_renamed_files = Korrekt omdöpt till { $properly_renamed } filer
renaming_ignored_files = Ignorerade { $ignored } filer, eftersom namnet före och efter ändringen är samma.
renaming_failed_files = Det gick inte att byta namn på { $failed_vector } filer
renaming_list_of_failed_to_rename = Lista över alla misslyckade namnbyte
renaming_error = fel
renaming_some_records_not_updated = Vissa poster är inte uppdaterade, du kan göra det genom att klicka på knappen Uppdateringsnamn.\nÄr du säker på att du vill fortsätta utan att uppdatera namn?
renaming_missing_files = Saknade filer
renaming_require_missing_files = Du måste använda minst 1 fil
renaming_missing_rules = Saknade regler
renaming_require_missing_rules = Du måste använda minst 1 regel


# --- Missing translations added ---
ctrl_after_name = Efter namnet
ctrl_before_name = Före namnet
ctrl_both = Båda
ctrl_case_insensitive = Skiftlägesokänslig
ctrl_case_sensitive = Skiftlägeskänslig
ctrl_everything = Allt
ctrl_extension_end = Slutet av tillägget
ctrl_extension_start = Början av tillägget
ctrl_fill_zeros = Fyll med nollor
ctrl_lowercase = Gemener
ctrl_match_against = Matcha mot:
ctrl_name_end = Slutet av namnet
ctrl_name_start = Början av namnet
ctrl_only_extension = Endast tillägg
ctrl_only_name = Endast namn
ctrl_partial = Delvis
ctrl_replace_all = Ersätt alla
ctrl_start_number = Startnummer
ctrl_step = Steg
ctrl_text_to_find = Text att söka
ctrl_text_to_replace = Ersatt text
ctrl_trim_text = Text att trimma
ctrl_uppercase = Versaler
ctrl_use_regex = Använd regex
dialog_add_folders_body = Konfigurera skanningsalternativ
dialog_add_folders_title = Mappar att inkludera
dialog_copy_all_errors = Kopiera alla fel
dialog_language_body = Välj programspråk
dialog_language_restart = Starta om
dialog_language_restart_confirm = Språket ändras efter omstart. Starta om nu?
dialog_language_title = Språk
dialog_loading = Arbetar…
dialog_move_down = Flytta ner
dialog_move_up = Flytta upp
dialog_save_rule_set_body = Välj namn på regler (om det finns skrivs det över)
dialog_save_rule_set_name = Regelnamn
dialog_save_rule_set_title = Spara regeluppsättning
dialog_saved_rule_sets = Sparade regeluppsättningar
dialog_select = Välj
dialog_select_body = Välj en markeringsåtgärd
dialog_select_custom_body = Användning: */mapp*/* eller namn-version-*.txt
dialog_select_custom_hint = När Katalog/Fil-läget är aktivt ignoreras mönstret.
dialog_select_custom_include_dirs = Inkludera kataloger
dialog_select_custom_match = Matcha mot:
dialog_select_custom_pattern = Mönster
dialog_select_custom_title = Välj / Avmarkera anpassad
empty_state_files_description = Lägg till filer eller mappar för att börja byta namn
empty_state_files_title = Inga filer inlästa
empty_state_rules_description = Lägg till en regel för att definiera hur filer ska bytas namn
empty_state_rules_title = Inga regler konfigurerade
menu_about = Om
menu_appearance = Utseende
menu_dark_theme = Mörkt tema
menu_language = Språk…
menu_light_theme = Ljust tema
menu_open_config_dir = Öppna konfigurationsmapp
menu_open_custom_texts_file = Öppna fil med anpassade texter
menu_open_log_folder = Öppna loggmapp
menu_open_rules_file = Öppna regelinställningsfil
menu_preferences = Inställningar
menu_title = Meny
rule_editor_add = Lägg till regel
rule_editor_cancel = Avbryt
rule_editor_custom_save = Spara anpassad regel
rule_editor_custom_saved = Sparade anpassade texter:
rule_editor_delete = Ta bort
rule_editor_edit = Redigera regel
rule_editor_example = EXEMPEL
rule_editor_example_after = Efter:
rule_editor_example_before = Före:
rule_editor_load = Läs in
rule_editor_reset = Återställ till standard
rule_editor_title = Regelredigerare
rule_editor_tool_type = Verktygstyp:
rule_editor_usage_type = Användningstyp:
rule_no_selection = Ingen regel vald. Välj en regel att redigera.
select_custom_hint = När Katalog/Fil-läget är aktivt ignoreras mönstret.
settings_theme = Tema
settings_theme_dark = Mörkt
settings_theme_light = Ljust
settings_theme_system = Systemstandard
sort_by = Sortera efter
sort_descending = Fallande
sort_future_name = Nytt namn
sort_name = Namn
sort_path = Sökväg
sort_type = Typ
sort_usage = Användning
status_up_to_date = uppdaterad
status_update_required = UPPDATERING KRÄVS
tab_add_number = Lägg till nummer
tab_add_text = Lägg till text
tab_case_size = Versaler/Gemener
tab_custom = Anpassad
tab_normalize = Normalisera namn
tab_purge = Rensa
tab_replace = Ersätt
tab_trim = Trimma
