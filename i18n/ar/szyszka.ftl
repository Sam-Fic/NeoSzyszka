# Upper buttons
upper_start_renaming_button = بدء إعادة التسمية
upper_add_files_button = إضافة ملفات
upper_add_folders_button = إضافة مجلدات
upper_remove_selection_button = إزالة التحديد
upper_update_names_button = تحديث الأسماء
upper_results_one_up_button = رفع واحد
upper_results_one_down_button = أسفل واحد
upper_select_popup_button = حدد
# Bottom Buttons
bottom_rule_add_button = إضافة قاعدة
bottom_rule_edit_button = تعديل القاعدة
bottom_rule_remove_button = إزالة القاعدة
bottom_rule_one_up_button = رفع واحد
bottom_rule_one_down_button = أسفل واحد
bottom_rule_save_rules_button = حفظ القواعد
bottom_rule_load_rules_button = تحميل القواعد
# Edit names
edit_names_used_in_rules = الأسماء المستخدمة في القواعد: { $rules }
edit_names_choose_name = اختر اسم القواعد(إذا كان موجودا، سوف يتجاوزها)
# Tree View Rules
tree_view_upper_column_type = نوع
tree_view_upper_column_current_name = الاسم الحالي
tree_view_upper_column_future_name = اسم المستقبل
tree_view_upper_column_path = المسار
# Tree View Results
tree_view_bottom_tool_type = نوع الأداة
tree_view_bottom_usage_name = اسم الاستخدام
tree_view_bottom_description = الوصف
# Settings
settings_language_label = اللغة
settings_open_rules = فتح ملف إعدادات القواعد
settings_open_cache_custom_texts = فتح ملف ذاكرة التخزين المؤقت المخصص
settings_open_config_dir = فتح ذاكرة التخزين المؤقت
check_button_dark_theme = أيقونات داكنة
# Other in main window
bottom_rule_label_rules = القواعد
upper_files_folders_label = الملفات/المجلدات
upper_files_folders_label_update = الملفات/المجلدات({ $files_number }) - ###### تحديث مطلوب QUIRED #### #
upper_files_folders_label_up_to_date = الملفات/المجلدات ({ $files_number }) - محدثة
# Select popover
button_select_all = حدد الكل
button_select_reverse = الاختيار العكسي
button_select_custom = تحديد مخصص
button_unselect_all = إلغاء تحديد الكل
button_select_changed = حدد التغيير
button_unselect_changed = غير محدد
# Un/Select custom
select_custom_example = الاستخدام: */مجلد-رقم*/* أو اسم-إصدار-*.txt
select_custom_path = المسار
select_custom_current_path = المسار الحالي
select_custom_future_path = المسار المستقبلي
select_custom_path_current_name = المسار + الاسم الحالي
select_custom_path_future_name = المسار + اسم المستقبل
select_custom_directory_file = الدليل/الملف
select_custom_select_directory = حدد الدليل
select_custom_unselect_directory = إلغاء تحديد الدليل
# General
dialog_button_ok = حسناً
dialog_button_cancel = إلغاء
# Dialogs
dialog_name_files_to_include = الملفات المراد تضمينها
dialog_name_folders_to_include = مجلدات لتضمينها
dialog_scan_inside = مسح داخلي
dialog_ignore_folders = تجاهل المجلدات
dialog_confirm_renaming = تأكيد إعادة التسمية
dialog_outdated_results = النتائج العتيقة
dialog_results_of_renaming = نتائج إعادة التسمية
dialog_save_rule = حفظ القاعدة
dialog_select_custom = تحديد مخصص
settings_open_log_folder = فتح مجلد السجل

# Rule Window


## Common

label_usage_type = نوع الاستخدام:
label_example = اكتمال
label_example_text_before = سابقا:
label_example_text_after = بعد:
button_rule_window_add = إضافة قاعدة

## Custom

label_custom_instruction = $(NAME) - يطبع اسم الملف
                           $(EXT) - يطبع الامتداد
                           $(MODIF) - يطبع تاريخ تعديل الملف
                           $(CREAT) - يطبع تاريخ إنشاء الملف
                           $(CURR) - يطبع اسم الملف الحالي مع الامتداد
                           $(PARENT) - يطبع اسم المجلد الأصلي
                           $(N)/$(K) - يطبع الأرقام (الوسائط اختيارية)
                           $(N:3:4:5) يطبع الأرقام بدءًا من 3، وبخطوة 4
                           ويملؤها بالأصفار حتى 5 خانات.
                           K بدلًا من ذلك موضع القائمة فقط، ويستخدم أيضًا موضع العنصر في المجلد.
menu_button_load_custom_rule = اختيار قاعدة مخصصة
button_save_custom_rule = حفظ قاعدة مخصصة

## Upper/Lower Case

check_button_letters_type_uppercase = الحروف
check_button_letters_type_lowercase = أقل حروف
check_button_letters_usage_name = الاسم فقط
check_button_letters_usage_extension = ملحق فقط
check_button_letters_usage_both = كلاهما
label_letters_tool_type = نوع الأداة:
# Purge
label_purge_tool_type = نوع الأداة:
check_button_purge_name = الاسم فقط
check_button_purge_extension = ملحق فقط
check_button_purge_both = كلاهما
# Add number
label_add_number_place = مكان لوضع الرقم:
label_add_number_settings = إعدادات الرقم:
check_button_add_number_before_name = قبل الاسم
check_button_add_number_after_name = بعد الاسم
label_number_start_number = رقم البدء
label_number_step = خطوة
label_number_fill_zeros = ملء بالأصفار
# Add text
check_button_add_text_before_name = قبل الاسم
check_button_add_text_after_name = بعد الاسم
label_add_text = النص المراد إضافة:
# Replace
check_button_replace_name = الاسم فقط
check_button_replace_extension = ملحق فقط
check_button_replace_both = كلاهما
check_button_replace_case_sensitive = حالة حساسة
check_button_replace_case_insensitive = حالة غير حساسة
check_button_replace_regex = استخدام regex
check_button_replace_replace_all = استبدال جميع الحوادث
label_replace_replacing_strings = استبدال المقاطع
label_replace_text_to_find = النص للبحث عنه
label_replace_text_to_replace = استبدال النص
label_replace_captures = التقاط
label_replace_captured_captures = التقاط مأسور
label_replace_captures_number = ({ $capture_number } مجموعات ملتقطة)
label_replace_no_captures = لا يوجد التقاط
label_replace_invalid_regex = تعبير نمطي غير صالح
# Trim
check_button_trim_name_start = إسم البداية
check_button_trim_name_end = نهاية الاسم
check_button_trim_extension_start = بدء الإضافات
check_button_trim_extension_end = نهاية الملحق
check_button_trim_case_sensitive = حالة حساسة
check_button_trim_case_insensitive = حالة غير حساسة
label_trim_trim_text = تقليم النص
label_trim_case_sensitivity = حساسية الحالة
# Normalize name
label_normalize_name = "الكل" — يعيد تسمية الاسم بحيث لا يحتوي إلا على الأحرف `a-z` والأرقام `0-9` و`-` والمسافة و`.`.
                       مثال: `żółć CZERona.Txt` ← `zolc-czerwona.txt`

                       "جزئي" — يعمل بالطريقة نفسها، لكنه يسمح بالمسافات والأحرف الكبيرة `A-Z`.
                       مثال: ` Źrebię Krokietowe.Rar ` ← `Zrebie Krokietowe.Rar`
check_button_normalize_everything = كل شيء
check_button_normalize_partial = جزئي
# RuleType
rule_type_custom = مخصص
rule_type_case_size = حجم الحالة
rule_type_purge = تنظيف
rule_type_add_text = إضافة نص
rule_type_trim = تقليم
rule_type_replace = استبدل
rule_type_add_number = إضافة رقم
rule_type_normalize = تطبيع
# RulePlace
rule_place_none = لا
rule_place_extension = ملحق فقط
rule_place_name = الاسم فقط
rule_place_extension_name = التمديد والاسم
rule_place_before_extension = قبل التمديد
rule_place_after_extension = بعد التمديد
rule_place_before_name = قبل الاسم
rule_place_after_name = بعد الاسم
rule_place_from_name_start = من البداية
rule_place_from_name_end_reverse = من الاسم إلى البداية
rule_place_from_extension_start = من بداية الملحق
rule_place_from_extension_end_reverse = من نهاية الملحق إلى البدء
# Rule Description
rule_description_full_normalize = التطبيع الكامل
rule_description_partial_normalize = تطبيع جزئي
rule_description_zeros = وملء بـ { $zeros } صفر،
rule_description_step = يبدأ بـ { $start } بخطوة { $step }{ $zeros }
rule_description_lowercase = أقل حروف
rule_description_uppercase = الحروف
rule_description_text = نص
rule_description_added_text = النص المضاف:
rule_description_start = ابدأ
rule_description_end_of_name = نهاية الاسم
rule_description_extension = التمديد
rule_description_end_of_extension = نهاية التمديد
rule_description_trimming = تقليم "{ $trim_text }" من { $where_remove }
rule_description_custom_rule = قاعدة مخصصة: { $custom_rule }
rule_description_replace = استبدال { $additional_regex_text } "{ $text_to_find }" ب "{ $text_to_replace }"
# Notebooks
notebook_tab_custom = مخصص
notebook_tab_case_size = الحالات العليا/السفلى
notebook_tab_purge = تنظيف
notebook_tab_add_number = إضافة رقم
notebook_tab_add_text = إضافة نص
notebook_tab_replace = استبدل
notebook_tab_trim = تقليم
notebook_tab_normalize = تطبيع الاسم
# Renaming dialog
renaming_question = هل أنت متأكد من أنك تريد إعادة تسمية { $number_of_renamed_files } ملف؟
renaming_destination_file_exists = ملف الوجهة موجود مسبقاً.
renaming_renamed_files = تمت إعادة تسميته بشكل صحيح إلى { $properly_renamed } ملفات
renaming_ignored_files = تجاهل { $ignored } ملفات، لأن الاسم قبل التغيير وبعده هو نفسه.
renaming_failed_files = فشل في إعادة تسمية { $failed_vector } ملفات
renaming_list_of_failed_to_rename = قائمة بجميع عمليات إعادة التسمية الفاشلة
renaming_error = خطأ
renaming_some_records_not_updated = لم يتم تحديث بعض السجلات، يمكنك القيام بذلك من خلال النقر على زر تحديث الأسماء.\nهل أنت متأكد من أنك تريد المضي قدما دون تحديث الأسماء؟
renaming_missing_files = الملفات المفقودة
renaming_require_missing_files = تحتاج إلى استخدام ملف واحد على الأقل
renaming_missing_rules = القواعد مفقودة
renaming_require_missing_rules = تحتاج إلى استخدام قاعدة واحدة على الأقل


# --- Missing translations added ---
ctrl_after_name = بعد الاسم
ctrl_before_name = قبل الاسم
ctrl_both = كلاهما
ctrl_case_insensitive = غير حساس لحالة الأحرف
ctrl_case_sensitive = حساس لحالة الأحرف
ctrl_everything = الكل
ctrl_extension_end = نهاية الامتداد
ctrl_extension_start = بداية الامتداد
ctrl_fill_zeros = تعبئة بالأصفار
ctrl_lowercase = أحرف صغيرة
ctrl_match_against = المطابقة مع:
ctrl_name_end = نهاية الاسم
ctrl_name_start = بداية الاسم
ctrl_only_extension = الامتداد فقط
ctrl_only_name = الاسم فقط
ctrl_partial = جزئي
ctrl_replace_all = استبدال الكل
ctrl_start_number = رقم البداية
ctrl_step = الخطوة
ctrl_text_to_find = النص المراد البحث عنه
ctrl_text_to_replace = النص المستبدل
ctrl_trim_text = النص المراد قصه
ctrl_uppercase = أحرف كبيرة
ctrl_use_regex = استخدام التعبير النمطي
dialog_add_folders_body = تهيئة خيارات المسح
dialog_add_folders_title = المجلدات المراد تضمينها
dialog_copy_all_errors = نسخ جميع الأخطاء
dialog_language_body = اختر لغة التطبيق
dialog_language_restart = إعادة التشغيل
dialog_language_restart_confirm = ستتغير اللغة بعد إعادة التشغيل. إعادة التشغيل الآن؟
dialog_language_title = اللغة
dialog_loading = جارٍ العمل…
dialog_move_down = تحريك لأسفل
dialog_move_up = تحريك لأعلى
dialog_save_rule_set_body = اختر اسم القواعد (إذا وجد، سيتم استبداله)
dialog_save_rule_set_name = اسم القاعدة
dialog_save_rule_set_title = حفظ مجموعة القواعد
dialog_saved_rule_sets = مجموعات القواعد المحفوظة
dialog_select = تحديد
dialog_select_body = اختر إجراءً للتحديد
dialog_select_custom_body = الاستخدام: */مجلد*/* أو اسم-إصدار-*.txt
dialog_select_custom_hint = عند تفعيل وضع الدليل/الملف، يتم تجاهل النمط.
dialog_select_custom_include_dirs = تضمين الأدلة
dialog_select_custom_match = المطابقة مع:
dialog_select_custom_pattern = النمط
dialog_select_custom_title = تحديد / إلغاء تحديد مخصص
empty_state_files_description = أضف ملفات أو مجلدات لبدء إعادة التسمية
empty_state_files_title = لا توجد ملفات محملة
empty_state_rules_description = أضف قاعدة لتحديد كيفية إعادة تسمية الملفات
empty_state_rules_title = لا توجد قواعد مهيأة
menu_about = حول
menu_appearance = المظهر
menu_dark_theme = السمة الداكنة
menu_language = اللغة…
menu_light_theme = السمة الفاتحة
menu_open_config_dir = فتح مجلد الإعدادات
menu_open_custom_texts_file = فتح ملف النصوص المخصصة
menu_open_log_folder = فتح مجلد السجلات
menu_open_rules_file = فتح ملف إعدادات القواعد
menu_preferences = التفضيلات
menu_title = القائمة
rule_editor_add = إضافة قاعدة
rule_editor_cancel = إلغاء
rule_editor_custom_save = حفظ قاعدة مخصصة
rule_editor_custom_saved = النصوص المخصصة المحفوظة:
rule_editor_delete = حذف
rule_editor_edit = تحرير القاعدة
rule_editor_example = مثال
rule_editor_example_after = بعد:
rule_editor_example_before = قبل:
rule_editor_load = تحميل
rule_editor_reset = إعادة تعيين إلى الافتراضي
rule_editor_title = محرر القواعد
rule_editor_tool_type = نوع الأداة:
rule_editor_usage_type = نوع الاستخدام:
rule_no_selection = لم يتم تحديد قاعدة. حدد قاعدة لتحريرها.
select_custom_hint = عند تفعيل وضع الدليل/الملف، يتم تجاهل النمط.
settings_theme = السمة
settings_theme_dark = داكن
settings_theme_light = فاتح
settings_theme_system = النظام
sort_by = ترتيب حسب
sort_descending = تنازلي
sort_future_name = الاسم الجديد
sort_name = الاسم
sort_path = المسار
sort_type = النوع
sort_usage = الاستخدام
status_up_to_date = محدّث
status_update_required = التحديث مطلوب
tab_add_number = إضافة رقم
tab_add_text = إضافة نص
tab_case_size = الحروف الكبيرة/الصغيرة
tab_custom = مخصص
tab_normalize = تطبيع الاسم
tab_purge = تنظيف
tab_replace = استبدال
tab_trim = قص
