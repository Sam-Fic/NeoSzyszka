# Upper buttons
upper_start_renaming_button = Iniciar renombrado
upper_add_files_button = Añadir Archivos
upper_add_folders_button = Añadir Carpetas
upper_remove_selection_button = Eliminar selección
upper_update_names_button = Actualizar nombres
upper_results_one_up_button = Uno arriba
upper_results_one_down_button = Un Abajo
upper_select_popup_button = Seleccionar
# Bottom Buttons
bottom_rule_add_button = Añadir Regla
bottom_rule_edit_button = Editar regla
bottom_rule_remove_button = Eliminar regla
bottom_rule_one_up_button = Uno arriba
bottom_rule_one_down_button = Un Abajo
bottom_rule_save_rules_button = Guardar Reglas
bottom_rule_load_rules_button = Cargar Reglas
# Edit names
edit_names_used_in_rules = Nombres usados en las reglas: { $rules }
edit_names_choose_name = Elija el nombre de las reglas (si existe, lo anulará)
# Tree View Rules
tree_view_upper_column_type = Tipo
tree_view_upper_column_current_name = Nombre actual
tree_view_upper_column_future_name = Nombre futuro
tree_view_upper_column_path = Ruta
# Tree View Results
tree_view_bottom_tool_type = Tipo de herramienta
tree_view_bottom_usage_name = Nombre de uso
tree_view_bottom_description = Descripción
# Settings
settings_language_label = Idioma
settings_open_rules = Abrir archivo de configuración de reglas
settings_open_cache_custom_texts = Abrir archivo de caché personalizado
settings_open_config_dir = Abrir directorio de caché
check_button_dark_theme = Iconos oscuros
# Other in main window
bottom_rule_label_rules = Reglas
upper_files_folders_label = Archivos/Carpetas
upper_files_folders_label_update = Archivos({ $files_number }) - ##### REQUIERDO ACTUALIZADO #####
upper_files_folders_label_up_to_date = Archivos({ $files_number }) - actualizado
# Select popover
button_select_all = Seleccionar todo
button_select_reverse = Invertir selección
button_select_custom = Seleccionar Personalizado
button_unselect_all = Deseleccionar todo
button_select_changed = Seleccionar cambiado
button_unselect_changed = Deseleccionar cambiado
# Un/Select custom
select_custom_example = Uso: */carpeta-n.º*/* o nombre-versión-*.txt
select_custom_path = Ruta
select_custom_current_path = Ruta actual
select_custom_future_path = Ruta futura
select_custom_path_current_name = Ruta + Nombre Actual
select_custom_path_future_name = Ruta + nombre futuro
select_custom_directory_file = Directorio/Archivo
select_custom_select_directory = Seleccionar directorio
select_custom_unselect_directory = Deseleccionar directorio
# General
dialog_button_ok = OK
dialog_button_cancel = Cancelar
# Dialogs
dialog_name_files_to_include = Archivos a incluir
dialog_name_folders_to_include = Carpetas a incluir
dialog_scan_inside = Escanear dentro
dialog_ignore_folders = Ignorar carpetas
dialog_confirm_renaming = Confirmar renombrado
dialog_outdated_results = Resultados obsoletos
dialog_results_of_renaming = Resultados del renombrado
dialog_save_rule = Guardar regla
dialog_select_custom = Seleccionar Personalizado
settings_open_log_folder = Abrir carpeta de registros

# Rule Window


## Common

label_usage_type = Tipo de uso:
label_example = EJEMPLO
label_example_text_before = Antes:
label_example_text_after = Después:
button_rule_window_add = Regla Añadir

## Custom

label_custom_instruction = $(NAME) - imprime el nombre del archivo
                           $(EXT) - imprime la extensión
                           $(MODIF) - imprime la fecha de modificación del archivo
                           $(CREAT) - imprime la fecha de creación del archivo
                           $(CURR) - imprime el nombre actual del archivo con la extensión
                           $(PARENT) - imprime el nombre de la carpeta padre
                           $(N)/$(K) - imprime números (los argumentos son opcionales)
                           $(N:3:4:5) imprime números desde 3, con paso 4
                           y los rellena con ceros hasta 5 posiciones.
                           K en su lugar solo la posición en la lista, también usa la posición del elemento en la carpeta.
menu_button_load_custom_rule = Selector de reglas personalizado
button_save_custom_rule = Guardar regla personalizada

## Upper/Lower Case

check_button_letters_type_uppercase = Mayúsculas
check_button_letters_type_lowercase = Minúsculas
check_button_letters_usage_name = Sólo Nombre
check_button_letters_usage_extension = Sólo extensión
check_button_letters_usage_both = Ambos
label_letters_tool_type = Tipo de herramienta:
# Purge
label_purge_tool_type = Tipo de herramienta:
check_button_purge_name = Sólo Nombre
check_button_purge_extension = Sólo extensión
check_button_purge_both = Ambos
# Add number
label_add_number_place = Colocar para poner número:
label_add_number_settings = Ajustes del número:
check_button_add_number_before_name = Antes de Nombre
check_button_add_number_after_name = Después del nombre
label_number_start_number = Número inicial
label_number_step = Paso
label_number_fill_zeros = Rellenar con ceros
# Add text
check_button_add_text_before_name = Antes de Nombre
check_button_add_text_after_name = Después del nombre
label_add_text = Texto a añadir:
# Replace
check_button_replace_name = Sólo Nombre
check_button_replace_extension = Sólo extensión
check_button_replace_both = Ambos
check_button_replace_case_sensitive = Sensitivo mayúsculas
check_button_replace_case_insensitive = Insensible a mayúsculas
check_button_replace_regex = Usar regex
check_button_replace_replace_all = Reemplazar todas las ocurrencias
label_replace_replacing_strings = Reemplazando cadenas:
label_replace_text_to_find = Texto a encontrar
label_replace_text_to_replace = Texto reemplazado
label_replace_captures = Capturas
label_replace_captured_captures = Capturar capturas
label_replace_captures_number = ({ $capture_number } grupos capturados)
label_replace_no_captures = No hay capturas
label_replace_invalid_regex = REGEX INVÁLIDO
# Trim
check_button_trim_name_start = Nombre Inicio
check_button_trim_name_end = Fin del nombre
check_button_trim_extension_start = Inicio de extensión
check_button_trim_extension_end = Fin de extensión
check_button_trim_case_sensitive = Sensitivo mayúsculas
check_button_trim_case_insensitive = Insensible a mayúsculas
label_trim_trim_text = Recortar texto
label_trim_case_sensitivity = Sensibilidad de Caso
# Normalize name
label_normalize_name = Todo — cambia el nombre para que solo contenga los caracteres `a-z`, `0-9`, `-`, espacio y `.`.
                       Ejemplo: `żółć CZERona.Txt` → `zolc-czerwona.txt`

                       Parcial — funciona igual que la opción anterior, pero permite espacios y letras mayúsculas `A-Z`.
                       Ejemplo: ` Źrebię Krokietowe.Rar ` → `Zrebie Krokietowe.Rar`
check_button_normalize_everything = Todo
check_button_normalize_partial = Parcial
# RuleType
rule_type_custom = Personalizado
rule_type_case_size = Tamaño del caso
rule_type_purge = Purgar
rule_type_add_text = Añadir texto
rule_type_trim = Recortar
rule_type_replace = Reemplazar
rule_type_add_number = Añadir número
rule_type_normalize = Normalizar
# RulePlace
rule_place_none = No aplicable
rule_place_extension = Sólo extensión
rule_place_name = Sólo Nombre
rule_place_extension_name = Extensión y nombre
rule_place_before_extension = Antes de la extensión
rule_place_after_extension = Después de la extensión
rule_place_before_name = Antes de Nombre
rule_place_after_name = Después del nombre
rule_place_from_name_start = Desde el inicio
rule_place_from_name_end_reverse = De nombre final al inicio
rule_place_from_extension_start = Desde inicio de extensión
rule_place_from_extension_end_reverse = De la extensión final al inicio
# Rule Description
rule_description_full_normalize = normalización completa
rule_description_partial_normalize = Normalización parcial
rule_description_zeros = y rellenando con { $zeros } ceros,
rule_description_step = Comenzando con { $start } con el paso { $step }{ $zeros }
rule_description_lowercase = Minúsculas
rule_description_uppercase = Mayúsculas
rule_description_text = texto
rule_description_added_text = Texto añadido:
rule_description_start = empezar
rule_description_end_of_name = fin del nombre
rule_description_extension = extensión
rule_description_end_of_extension = fin de la extensión
rule_description_trimming = Recortando "{ $trim_text }" de { $where_remove }
rule_description_custom_rule = Regla personalizada: { $custom_rule }
rule_description_replace = Reemplazando { $additional_regex_text } "{ $text_to_find }" por "{ $text_to_replace }"
# Notebooks
notebook_tab_custom = Personalizado
notebook_tab_case_size = Casos superior/inferior
notebook_tab_purge = Purgar
notebook_tab_add_number = Añadir número
notebook_tab_add_text = Añadir texto
notebook_tab_replace = Reemplazar
notebook_tab_trim = Recortar
notebook_tab_normalize = Normalizar nombre
# Renaming dialog
renaming_question = ¿Estás seguro de que quieres renombrar { $number_of_renamed_files } archivos?
renaming_destination_file_exists = El archivo de destino ya existe.
renaming_renamed_files = Archivos renombrados correctamente { $properly_renamed }
renaming_ignored_files = Ignorados { $ignored } archivos, porque el nombre antes y después del cambio son los mismos.
renaming_failed_files = Error al renombrar { $failed_vector } archivos
renaming_list_of_failed_to_rename = Lista de todos los renombrados fallidos
renaming_error = Error
renaming_some_records_not_updated = Algunos registros no se actualizan, puede hacerlo haciendo clic en el botón Actualizar nombres.\n¿Está seguro que desea continuar sin actualizar nombres?
renaming_missing_files = Falta archivos
renaming_require_missing_files = Necesitas usar al menos 1 archivo
renaming_missing_rules = Reglas faltantes
renaming_require_missing_rules = Necesitas usar al menos 1 regla


# --- Missing translations added ---
ctrl_after_name = Después del nombre
ctrl_before_name = Antes del nombre
ctrl_both = Ambos
ctrl_case_insensitive = No distinguir mayúsculas
ctrl_case_sensitive = Distinguir mayúsculas
ctrl_everything = Todo
ctrl_extension_end = Final de la extensión
ctrl_extension_start = Inicio de la extensión
ctrl_fill_zeros = Rellenar con ceros
ctrl_lowercase = Minúsculas
ctrl_match_against = Coincidir con:
ctrl_name_end = Final del nombre
ctrl_name_start = Inicio del nombre
ctrl_only_extension = Solo extensión
ctrl_only_name = Solo nombre
ctrl_partial = Parcial
ctrl_replace_all = Reemplazar todo
ctrl_start_number = Número inicial
ctrl_step = Paso
ctrl_text_to_find = Texto a buscar
ctrl_text_to_replace = Texto reemplazado
ctrl_trim_text = Texto a recortar
ctrl_uppercase = Mayúsculas
ctrl_use_regex = Usar regex
dialog_add_folders_body = Configurar opciones de escaneo
dialog_add_folders_title = Carpetas a incluir
dialog_copy_all_errors = Copiar todos los errores
dialog_language_body = Seleccionar idioma de la aplicación
dialog_language_restart = Reiniciar
dialog_language_restart_confirm = El idioma cambiará tras reiniciar. ¿Reiniciar ahora?
dialog_language_title = Idioma
dialog_loading = Trabajando…
dialog_move_down = Mover abajo
dialog_move_up = Mover arriba
dialog_save_rule_set_body = Elija el nombre de las reglas (si existe, se sobrescribirá)
dialog_save_rule_set_name = Nombre de la regla
dialog_save_rule_set_title = Guardar conjunto de reglas
dialog_saved_rule_sets = Conjuntos de reglas guardados
dialog_select = Seleccionar
dialog_select_body = Elija una acción de selección
dialog_select_custom_body = Uso: */carpeta*/* o nombre-version-*.txt
dialog_select_custom_hint = Cuando el modo Directorio/Archivo está activo, el patrón se ignora.
dialog_select_custom_include_dirs = Incluir directorios
dialog_select_custom_match = Coincidir con:
dialog_select_custom_pattern = Patrón
dialog_select_custom_title = Seleccionar/Deseleccionar personalizado
empty_state_files_description = Añade archivos o carpetas para empezar a renombrar
empty_state_files_title = No hay archivos cargados
empty_state_rules_description = Añade una regla para definir cómo renombrar los archivos
empty_state_rules_title = No hay reglas configuradas
menu_about = Acerca de
menu_appearance = Apariencia
menu_dark_theme = Tema oscuro
menu_language = Idioma…
menu_light_theme = Tema claro
menu_open_config_dir = Abrir carpeta de configuración
menu_open_custom_texts_file = Abrir archivo de textos personalizados
menu_open_log_folder = Abrir carpeta de registro
menu_open_rules_file = Abrir archivo de configuración de reglas
menu_preferences = Preferencias
menu_title = Menú
rule_editor_add = Añadir regla
rule_editor_cancel = Cancelar
rule_editor_custom_save = Guardar regla personalizada
rule_editor_custom_saved = Textos personalizados guardados:
rule_editor_delete = Eliminar
rule_editor_edit = Editar regla
rule_editor_example = EJEMPLO
rule_editor_example_after = Después:
rule_editor_example_before = Antes:
rule_editor_load = Cargar
rule_editor_reset = Restablecer por defecto
rule_editor_title = Editor de reglas
rule_editor_tool_type = Tipo de herramienta:
rule_editor_usage_type = Tipo de uso:
rule_no_selection = No hay regla seleccionada. Selecciona una regla para editar.
select_custom_hint = Cuando el modo Directorio/Archivo está activo, el patrón se ignora.
settings_theme = Tema
settings_theme_dark = Oscuro
settings_theme_light = Claro
settings_theme_system = Sistema
sort_by = Ordenar por
sort_descending = Descendente
sort_future_name = Nuevo nombre
sort_name = Nombre
sort_path = Ruta
sort_type = Tipo
sort_usage = Uso
status_up_to_date = actualizado
status_update_required = ACTUALIZACIÓN REQUERIDA
tab_add_number = Añadir número
tab_add_text = Añadir texto
tab_case_size = Mayúsculas/Minúsculas
tab_custom = Personalizado
tab_normalize = Normalizar nombre
tab_purge = Purgar
tab_replace = Reemplazar
tab_trim = Recortar
