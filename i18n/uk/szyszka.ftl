# Upper buttons
upper_start_renaming_button = Почати перейменування
upper_add_files_button = Додати файли
upper_add_folders_button = Додати Папки
upper_remove_selection_button = Видалити виділення
upper_update_names_button = Оновлення назв
upper_results_one_up_button = На один рівень вгору
upper_results_one_down_button = 1 вниз
upper_select_popup_button = Вибрати
# Bottom Buttons
bottom_rule_add_button = Додати правило
bottom_rule_edit_button = Змінити правило
bottom_rule_remove_button = Вилучити правило
bottom_rule_one_up_button = На один рівень вгору
bottom_rule_one_down_button = 1 вниз
bottom_rule_save_rules_button = Зберегти правила
bottom_rule_load_rules_button = Завантажити правила
# Edit names
edit_names_used_in_rules = Імена використовуються в правилах: { $rules }
edit_names_choose_name = Оберіть ім'я правил (якщо існує, це замінить)
# Tree View Rules
tree_view_upper_column_type = Тип
tree_view_upper_column_current_name = Поточне ім'я
tree_view_upper_column_future_name = Назва майбутнього
tree_view_upper_column_path = Шлях
# Tree View Results
tree_view_bottom_tool_type = Тип інструмента
tree_view_bottom_usage_name = Назва використання
tree_view_bottom_description = Опис
# Settings
settings_language_label = Мова:
settings_open_rules = Відкрити файл налаштувань правил
settings_open_cache_custom_texts = Відкрити користувацький файл кешу
settings_open_config_dir = Відкрити кеш dir
check_button_dark_theme = Темні іконки
# Other in main window
bottom_rule_label_rules = Правила
upper_files_folders_label = Файли/Теки
upper_files_folders_label_update = Файли/Папки ({ $files_number }) – ПОТРІБНЕ ОНОВЛЕННЯ
upper_files_folders_label_up_to_date = Файли/Папки({ $files_number }) - З найновішою
# Select popover
button_select_all = Виділити все
button_select_reverse = Зворотній вибір
button_select_custom = Вибрати користувацькі
button_unselect_all = Зняти виділення з усього
button_select_changed = Виберіть змінені
button_unselect_changed = Зняти виділення зі змін
# Un/Select custom
select_custom_example = Використання: */папка-номер*/* або назва-версія-*.txt
select_custom_path = Шлях
select_custom_current_path = Поточний шлях
select_custom_future_path = Шлях в майбутньому
select_custom_path_current_name = Шлях + поточне ім'я
select_custom_path_future_name = Шлях + Назва майбутнього
select_custom_directory_file = Каталог/Файл
select_custom_select_directory = Виберіть каталог
select_custom_unselect_directory = Скасування вибору каталогу
# General
dialog_button_ok = Гаразд
dialog_button_cancel = Скасувати
# Dialogs
dialog_name_files_to_include = Файли для включення
dialog_name_folders_to_include = Папки для включення
dialog_scan_inside = Сканувати через
dialog_ignore_folders = Ігнорувати теки
dialog_confirm_renaming = Підтвердити перейменування
dialog_outdated_results = Результати застаріли
dialog_results_of_renaming = Результати перейменування
dialog_save_rule = Зберегти правило
dialog_select_custom = Вибрати користувацькі
settings_open_log_folder = Відкрити теку журналів

# Rule Window


## Common

label_usage_type = Тип використання:
label_example = ПРИКЛАД
label_example_text_before = Межа:
label_example_text_after = Після цього:
button_rule_window_add = Додавання правила

## Custom

label_custom_instruction = $(NAME) - виводить ім'я файлу
                           $(EXT) - виводить розширення
                           $(MODIF) - виводить дату зміни файлу
                           $(CREAT) - виводить дату створення файлу
                           $(CURR) - виводить поточне ім'я файлу з розширенням
                           $(PARENT) - виводить ім'я батьківської папки
                           $(N)/$(K) - виводить числа (аргументи необов'язкові)
                           $(N:3:4:5) виводить числа з 3, з кроком 4
                           і доповнює їх нулями до 5 позицій.
                           K натомість лише позицію у списку, також використовує позицію елемента у папці.
menu_button_load_custom_rule = Власний вибір правила
button_save_custom_rule = Зберегти індивідуальне правило

## Upper/Lower Case

check_button_letters_type_uppercase = Верхній регістр
check_button_letters_type_lowercase = Нижній регістр
check_button_letters_usage_name = Тільки ім'я
check_button_letters_usage_extension = Тільки розширення
check_button_letters_usage_both = З обох сторін
label_letters_tool_type = Тип інструменту:
# Purge
label_purge_tool_type = Тип інструменту:
check_button_purge_name = Тільки ім'я
check_button_purge_extension = Тільки розширення
check_button_purge_both = З обох сторін
# Add number
label_add_number_place = Місце призначення номер:
label_add_number_settings = Налаштування номера:
check_button_add_number_before_name = Перед ім’ям
check_button_add_number_after_name = Після назви
label_number_start_number = Початковий номер
label_number_step = Крок
label_number_fill_zeros = Заповнити нулями
# Add text
check_button_add_text_before_name = Перед ім’ям
check_button_add_text_after_name = Після назви
label_add_text = Текст для додавання:
# Replace
check_button_replace_name = Тільки ім'я
check_button_replace_extension = Тільки розширення
check_button_replace_both = З обох сторін
check_button_replace_case_sensitive = Чутливість до регістру
check_button_replace_case_insensitive = Без урахування регістру
check_button_replace_regex = Використовувати регулярний вираз
check_button_replace_replace_all = Замінити всі входження
label_replace_replacing_strings = Заміна рядків:
label_replace_text_to_find = Текст для пошуку
label_replace_text_to_replace = Замінений текст
label_replace_captures = Знайдено
label_replace_captured_captures = Захоплені боротьби
label_replace_captures_number = ({ $capture_number } груп захоплення)
label_replace_no_captures = Немає зловживань
label_replace_invalid_regex = НЕПРАВИЛЬНИЙ РЕГУЛЯРНИЙ ВИРАЗ
# Trim
check_button_trim_name_start = Назвати Початок
check_button_trim_name_end = Назвати кінець
check_button_trim_extension_start = Початок розширення
check_button_trim_extension_end = Кінець розширення
check_button_trim_case_sensitive = Чутливість до регістру
check_button_trim_case_insensitive = Без урахування регістру
label_trim_trim_text = Обрізати текст
label_trim_case_sensitivity = Чутливість до регістру
# Normalize name
label_normalize_name = Усе — перейменовує назву так, щоб вона містила лише символи `a-z`, `0-9`, `-`, пробіл і `.`.
                       Приклад: `żółć CZERona.Txt` → `zolc-czerwona.txt`

                       Частково — працює так само, але дозволяє пробіли й великі літери `A-Z`.
                       Приклад: ` Źrebię Krokietowe.Rar ` → `Zrebie Krokietowe.Rar`
check_button_normalize_everything = Все
check_button_normalize_partial = Частково
# RuleType
rule_type_custom = Користувацька
rule_type_case_size = Розмір звернення
rule_type_purge = Очистити
rule_type_add_text = Додати текст
rule_type_trim = Обрізати
rule_type_replace = Заміняти
rule_type_add_number = Додати номер
rule_type_normalize = Нормалізувати
# RulePlace
rule_place_none = Н/А
rule_place_extension = Тільки розширення
rule_place_name = Тільки ім'я
rule_place_extension_name = Розширення і ім'я
rule_place_before_extension = Перед розширенням
rule_place_after_extension = Після розширення
rule_place_before_name = Перед ім’ям
rule_place_after_name = Після назви
rule_place_from_name_start = З самого початку
rule_place_from_name_end_reverse = З кінця назви до початку
rule_place_from_extension_start = З початку розширення
rule_place_from_extension_end_reverse = З кінця розширення до початку
# Rule Description
rule_description_full_normalize = Нормалізувати
rule_description_partial_normalize = Часткова нормалізація
rule_description_zeros = і заповнення { $zeros } нулів,
rule_description_step = Починаючи з { $start } з кроком { $step }{ $zeros }
rule_description_lowercase = Нижній регістр
rule_description_uppercase = Верхній регістр
rule_description_text = текст
rule_description_added_text = Доданий текст:
rule_description_start = почати
rule_description_end_of_name = кінець імені
rule_description_extension = розширення
rule_description_end_of_extension = кінець розширення
rule_description_trimming = Обрізка "{ $trim_text }" від { $where_remove }
rule_description_custom_rule = Власне правило: { $custom_rule }
rule_description_replace = Заміна { $additional_regex_text } "{ $text_to_find }" на "{ $text_to_replace }"
# Notebooks
notebook_tab_custom = Користувацька
notebook_tab_case_size = Верхній/Нижні кейси
notebook_tab_purge = Очистити
notebook_tab_add_number = Додати номер
notebook_tab_add_text = Додати текст
notebook_tab_replace = Заміняти
notebook_tab_trim = Обрізати
notebook_tab_normalize = Ім'я нормалізації
# Renaming dialog
renaming_question = Ви впевнені, що хочете перейменувати { $number_of_renamed_files } файлів?
renaming_destination_file_exists = Файл призначення вже існує.
renaming_renamed_files = Правильно перейменовано { $properly_renamed } файлів
renaming_ignored_files = Ігноровані { $ignored } файлів, тому що ім'я до і після зміни однакові.
renaming_failed_files = Не вдалося перейменувати { $failed_vector } файлів
renaming_list_of_failed_to_rename = Список всіх невдалих перейменувань
renaming_error = помилка
renaming_some_records_not_updated = Деякі записи не оновлені, ви можете зробити це, натиснувши на кнопку Оновити імена.\nВи дійсно бажаєте продовжити без оновлення імен?
renaming_missing_files = Відсутні файли
renaming_require_missing_files = Необхідно використовувати принаймні 1 файл
renaming_missing_rules = Відсутні правила
renaming_require_missing_rules = Необхідно використати принаймні 1 правило


# --- Missing translations added ---
ctrl_after_name = Після назви
ctrl_before_name = Перед назвою
ctrl_both = Обидва
ctrl_case_insensitive = Без урахування регістру
ctrl_case_sensitive = Ураховувати регістр
ctrl_everything = Все
ctrl_extension_end = Кінець розширення
ctrl_extension_start = Початок розширення
ctrl_fill_zeros = Доповнити нулями
ctrl_lowercase = Малими літерами
ctrl_match_against = Зіставити з:
ctrl_name_end = Кінець назви
ctrl_name_start = Початок назви
ctrl_only_extension = Лише розширення
ctrl_only_name = Лише назва
ctrl_partial = Частково
ctrl_replace_all = Замінити всі
ctrl_start_number = Початковий номер
ctrl_step = Крок
ctrl_text_to_find = Текст для пошуку
ctrl_text_to_replace = Замінюваний текст
ctrl_trim_text = Текст для видалення
ctrl_uppercase = Великими літерами
ctrl_use_regex = Використовувати регулярний вираз
dialog_add_folders_body = Налаштувати параметри сканування
dialog_add_folders_title = Папки для включення
dialog_copy_all_errors = Копіювати всі помилки
dialog_language_body = Виберіть мову програми
dialog_language_restart = Перезапустити
dialog_language_restart_confirm = Мова зміниться після перезапуску. Перезапустити зараз?
dialog_language_title = Мова
dialog_loading = Робота…
dialog_move_down = Перемістити вниз
dialog_move_up = Перемістити вгору
dialog_save_rule_set_body = Виберіть назву правил (якщо існує, буде перезаписано)
dialog_save_rule_set_name = Назва правила
dialog_save_rule_set_title = Зберегти набір правил
dialog_saved_rule_sets = Збережені набори правил
dialog_select = Вибрати
dialog_select_body = Виберіть дію виділення
dialog_select_custom_body = Використання: */папка*/* або назва-версія-*.txt
dialog_select_custom_hint = Коли активний режим Каталог/Файл, шаблон ігнорується.
dialog_select_custom_include_dirs = Включити каталоги
dialog_select_custom_match = Зіставити з:
dialog_select_custom_pattern = Шаблон
dialog_select_custom_title = Вибрати / Зняти вибір (налаштувати)
empty_state_files_description = Додайте файли або папки, щоб почати перейменування
empty_state_files_title = Файли не завантажено
empty_state_rules_description = Додайте правило, щоб визначити, як перейменовувати файли
empty_state_rules_title = Правила не налаштовано
menu_about = Про програму
menu_appearance = Зовнішній вигляд
menu_dark_theme = Темна тема
menu_language = Мова…
menu_light_theme = Світла тема
menu_open_config_dir = Відкрити папку конфігурації
menu_open_custom_texts_file = Відкрити файл користувацьких текстів
menu_open_log_folder = Відкрити папку журналів
menu_open_rules_file = Відкрити файл налаштувань правил
menu_preferences = Налаштування
menu_title = Меню
rule_editor_add = Додати правило
rule_editor_cancel = Скасувати
rule_editor_custom_save = Зберегти користувацьке правило
rule_editor_custom_saved = Збережені користувацькі тексти:
rule_editor_delete = Видалити
rule_editor_edit = Змінити правило
rule_editor_example = ПРИКЛАД
rule_editor_example_after = Після:
rule_editor_example_before = До:
rule_editor_load = Завантажити
rule_editor_reset = Скинути до типового
rule_editor_title = Редактор правил
rule_editor_tool_type = Тип інструмента:
rule_editor_usage_type = Тип використання:
rule_no_selection = Правило не вибрано. Виберіть правило для зміни.
select_custom_hint = Коли активний режим Каталог/Файл, шаблон ігнорується.
settings_theme = Тема
settings_theme_dark = Темна
settings_theme_light = Світла
settings_theme_system = Системна
sort_by = Сортувати за
sort_descending = За спаданням
sort_future_name = Нова назва
sort_name = Назва
sort_path = Шлях
sort_type = Тип
sort_usage = Використання
status_up_to_date = актуально
status_update_required = ПОТРІБНЕ ОНОВЛЕННЯ
tab_add_number = Додати номер
tab_add_text = Додати текст
tab_case_size = Регістр
tab_custom = Користувацьке
tab_normalize = Нормалізувати назву
tab_purge = Очистити
tab_replace = Замінити
tab_trim = Обрізати
