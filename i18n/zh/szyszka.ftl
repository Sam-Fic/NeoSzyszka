# Upper buttons
upper_start_renaming_button = 开始重命名
upper_add_files_button = 添加文件
upper_add_folders_button = 添加文件夹
upper_remove_selection_button = 移除所选
upper_update_names_button = 更新名称
upper_results_one_up_button = 上移
upper_results_one_down_button = 下移
upper_select_popup_button = 选择

# Bottom Buttons
bottom_rule_add_button = 添加规则
bottom_rule_edit_button = 编辑规则
bottom_rule_remove_button = 删除规则
bottom_rule_one_up_button = 上移
bottom_rule_one_down_button = 下移
bottom_rule_save_rules_button = 保存规则
bottom_rule_load_rules_button = 加载规则

# Edit names
edit_names_used_in_rules = 规则中使用的名称： { $rules }
edit_names_choose_name = 选择规则名称（如果存在将覆盖）

# Tree View Rules
tree_view_upper_column_type = 类型
tree_view_upper_column_current_name = 当前名称
tree_view_upper_column_future_name = 新名称
tree_view_upper_column_path = 路径

# Tree View Results
tree_view_bottom_tool_type = 工具类型
tree_view_bottom_usage_name = 应用范围
tree_view_bottom_description = 描述

# Settings
settings_language_label = 语言
settings_theme = 主题
settings_theme_system = 跟随系统
settings_theme_light = 浅色
settings_theme_dark = 深色
settings_open_rules = 打开规则设置文件
settings_open_cache_custom_texts = 打开自定义文本文件
settings_open_config_dir = 打开配置目录
settings_open_log_folder = 打开日志文件夹
check_button_dark_theme = 深色主题

# Other in main window
bottom_rule_label_rules = 规则
upper_files_folders_label = 文件/文件夹
upper_files_folders_label_update = 文件/文件夹({ $files_number }) - 需要更新
upper_files_folders_label_up_to_date = 文件/文件夹({ $files_number }) - 已是最新

# Select popover
button_select_all = 全选
button_unselect_all = 取消全选
button_select_reverse = 反选
button_select_custom = 自定义选择
button_select_changed = 选择已更改的
button_unselect_changed = 取消已更改的

# Un/Select custom
select_custom_example = 用法：*/文件夹*/* 或 名称-版本-*.txt
select_custom_path = 路径
select_custom_current_path = 当前名称
select_custom_future_path = 新名称
select_custom_path_current_name = 路径 + 当前名称
select_custom_path_future_name = 路径 + 新名称
select_custom_directory_file = 目录/文件
select_custom_select_directory = 包含目录
select_custom_unselect_directory = 排除目录

select_custom_hint = 目录/文件模式下忽略模式匹配。

# Sort options (list view)
sort_by = 排序
sort_name = 名称
sort_future_name = 新名称
sort_path = 路径
sort_type = 类型
sort_usage = 用途
sort_descending = 降序

# General
dialog_button_ok = 确定
dialog_button_cancel = 取消

# Dialogs
dialog_name_files_to_include = 要包含的文件
dialog_name_folders_to_include = 要包含的文件夹
dialog_scan_inside = 扫描子目录
dialog_ignore_folders = 忽略文件夹
dialog_confirm_renaming = 确认重命名
dialog_outdated_results = 结果已过时
dialog_results_of_renaming = 重命名结果
dialog_save_rule = 保存规则
dialog_select_custom = 自定义选择

# Rule Window
## Common
label_usage_type = 应用范围：
label_example = 示例
label_example_text_before = 修改前：
label_example_text_after = 修改后：
button_rule_window_add = 添加规则

## Custom
label_custom_instruction = $(NAME) - 打印文件名
                           $(EXT) - 打印扩展名
                           $(MODIF) - 打印文件修改日期
                           $(CREAT) - 打印文件创建日期
                           $(CURR) - 打印带扩展名的当前文件名
                           $(PARENT) - 打印父文件夹名称
                           $(N)/$(K) - 打印数字（参数为可选）
                           $(N:3:4:5) 从 3 开始打印数字，步长为 4
                           并用零填充到 5 位。
                           K 则仅打印列表中的位置，也使用文件夹中项目的所在位置。

menu_button_load_custom_rule = 加载自定义规则
button_save_custom_rule = 保存自定义规则

## Upper/Lower Case
check_button_letters_type_uppercase = 大写
check_button_letters_type_lowercase = 小写
check_button_letters_usage_name = 仅名称
check_button_letters_usage_extension = 仅扩展名
check_button_letters_usage_both = 两者都改
label_letters_tool_type = 工具类型：

# Purge
label_purge_tool_type = 工具类型：
check_button_purge_name = 仅名称
check_button_purge_extension = 仅扩展名
check_button_purge_both = 两者都改

# Add number
label_add_number_place = 数字放置位置：
label_add_number_settings = 数字设置：
check_button_add_number_before_name = 名称前
check_button_add_number_after_name = 名称后
label_number_start_number = 起始数字
label_number_step = 步长
label_number_fill_zeros = 用零填充

# Add text
check_button_add_text_before_name = 名称前
check_button_add_text_after_name = 名称后
label_add_text = 要添加的文本：

# Replace
check_button_replace_name = 仅名称
check_button_replace_extension = 仅扩展名
check_button_replace_both = 两者都改
check_button_replace_case_sensitive = 区分大小写
check_button_replace_case_insensitive = 不区分大小写
check_button_replace_regex = 使用正则表达式
check_button_replace_replace_all = 替换所有匹配
label_replace_replacing_strings = 替换文本：
label_replace_text_to_find = 查找文本
label_replace_text_to_replace = 替换为
label_replace_captures = 捕获组
label_replace_captured_captures = 已捕获的内容
label_replace_captures_number = （{ $capture_number } 个捕获组）
label_replace_no_captures = 无捕获组
label_replace_invalid_regex = 无效的正则表达式

# Trim
check_button_trim_name_start = 名称开头
check_button_trim_name_end = 名称末尾
check_button_trim_extension_start = 扩展名开头
check_button_trim_extension_end = 扩展名末尾
check_button_trim_case_sensitive = 区分大小写
check_button_trim_case_insensitive = 不区分大小写
label_trim_trim_text = 要修剪的文本
label_trim_case_sensitivity = 大小写敏感

# Normalize name
label_normalize_name = 完全规范化 - 仅保留 `a-z 0-9 - . 空格`。
                       部分规范化 - 额外允许 `A-Z` 和空格。

check_button_normalize_everything = 完全规范化
check_button_normalize_partial = 部分规范化

# RuleType
rule_type_custom = 自定义
rule_type_case_size = 大小写转换
rule_type_purge = 清除特殊字符
rule_type_add_text = 添加文本
rule_type_trim = 修剪文本
rule_type_replace = 替换
rule_type_add_number = 添加数字
rule_type_normalize = 规范化名称

# RulePlace
rule_place_none = 不适用
rule_place_extension = 仅扩展名
rule_place_name = 仅名称
rule_place_extension_name = 扩展名和名称
rule_place_before_extension = 扩展名前
rule_place_after_extension = 扩展名后
rule_place_before_name = 名称前
rule_place_after_name = 名称后
rule_place_from_name_start = 名称开头
rule_place_from_name_end_reverse = 名称末尾
rule_place_from_extension_start = 扩展名开头
rule_place_from_extension_end_reverse = 扩展名末尾

# Rule Description
rule_description_full_normalize = 完全规范化
rule_description_partial_normalize = 部分规范化
rule_description_zeros = 并以 { $zeros } 位零填充
rule_description_step = 从 { $start } 开始，步长 { $step }{ $zeros }
rule_description_lowercase = 小写
rule_description_uppercase = 大写
rule_description_text = 文本
rule_description_added_text = 添加文本：
rule_description_start = 开头
rule_description_end_of_name = 名称末尾
rule_description_extension = 扩展名
rule_description_end_of_extension = 扩展名末尾
rule_description_trimming = 从 { $where_remove } 修剪 "{ $trim_text }"
rule_description_custom_rule = 自定义规则：{ $custom_rule }
rule_description_replace = 将 { $additional_regex_text } "{ $text_to_find }" 替换为 "{ $text_to_replace }"

# Notebooks
notebook_tab_custom = 自定义
notebook_tab_case_size = 大小写转换
notebook_tab_purge = 清除特殊字符
notebook_tab_add_number = 添加数字
notebook_tab_add_text = 添加文本
notebook_tab_replace = 替换
notebook_tab_trim = 修剪文本
notebook_tab_normalize = 规范化名称

# Renaming dialog
renaming_question = 确定要重命名 { $number_of_renamed_files } 个文件吗？
renaming_destination_file_exists = 目标文件已存在。
renaming_renamed_files = 成功重命名 { $properly_renamed } 个文件
renaming_ignored_files = 忽略 { $ignored } 个文件（修改前后名称相同）
renaming_failed_files = 重命名失败 { $failed_vector } 个文件
renaming_list_of_failed_to_rename = 所有失败的重命名列表
renaming_error = 错误
renaming_some_records_not_updated = 部分记录尚未更新，可点击"更新名称"按钮进行更新。\n确定要在未更新的情况下继续吗？
renaming_missing_files = 缺少文件
renaming_require_missing_files = 至少需要 1 个文件
renaming_missing_rules = 缺少规则
renaming_require_missing_rules = 至少需要 1 条规则

# Menu
menu_title = 菜单
menu_preferences = 偏好设置
menu_appearance = 外观
menu_dark_theme = 深色主题
menu_light_theme = 浅色主题
menu_open_rules_file = 打开规则设置文件
menu_open_custom_texts_file = 打开自定义文本文件
menu_open_config_dir = 打开配置目录
menu_open_log_folder = 打开日志文件夹
menu_language = 语言…
menu_about = 关于

# Dialogs
dialog_copy_all_errors = 复制所有错误
dialog_select = 选择
dialog_select_body = 选择操作
dialog_select_custom_title = 自定义选择
dialog_select_custom_body = 用法：*/文件夹*/* 或 名称-版本-*.txt
dialog_select_custom_pattern = 模式
dialog_select_custom_include_dirs = 包含目录
dialog_select_custom_match = 匹配：
dialog_select_custom_hint = 目录/文件模式下忽略模式匹配。
dialog_add_folders_title = 要包含的文件夹
dialog_add_folders_body = 配置扫描选项
dialog_save_rule_set_title = 保存规则集
dialog_save_rule_set_body = 选择规则名称（如果存在将覆盖）
dialog_save_rule_set_name = 规则名称
dialog_saved_rule_sets = 已保存的规则集
dialog_language_title = 语言
dialog_language_body = 选择应用语言
dialog_language_restart_confirm = 切换语言需要重启应用。是否立即重启？
dialog_language_restart = 重启
dialog_loading = 处理中…
dialog_move_up = 上移
dialog_move_down = 下移

# Rule editor
rule_editor_title = 规则编辑器
rule_editor_custom_save = 保存自定义规则
rule_editor_custom_saved = 已保存的自定义文本：
rule_editor_load = 加载
rule_editor_add = 添加规则
rule_editor_edit = 编辑规则
rule_no_selection = 未选择任何规则，请先选择要编辑的规则。
rule_editor_cancel = 取消
rule_editor_reset = 重置为默认
rule_editor_delete = 删除
rule_editor_tool_type = 工具类型：
rule_editor_usage_type = 应用范围：
rule_editor_example = 示例
rule_editor_example_before = 修改前：
rule_editor_example_after = 修改后：

# Rule tabs
tab_custom = 自定义
tab_case_size = 大小写转换
tab_purge = 清除特殊字符
tab_add_number = 添加数字
tab_add_text = 添加文本
tab_replace = 替换
tab_trim = 修剪文本
tab_normalize = 规范化名称

# Rule controls
ctrl_lowercase = 小写
ctrl_uppercase = 大写
ctrl_only_name = 仅名称
ctrl_only_extension = 仅扩展名
ctrl_both = 两者都改
ctrl_before_name = 名称前
ctrl_after_name = 名称后
ctrl_name_start = 名称开头
ctrl_name_end = 名称末尾
ctrl_extension_start = 扩展名开头
ctrl_extension_end = 扩展名末尾
ctrl_case_sensitive = 区分大小写
ctrl_case_insensitive = 不区分大小写
ctrl_use_regex = 使用正则表达式
ctrl_replace_all = 替换所有匹配
ctrl_everything = 完全规范化
ctrl_partial = 部分规范化
ctrl_start_number = 起始数字
ctrl_step = 步长
ctrl_fill_zeros = 用零填充
ctrl_text_to_find = 查找文本
ctrl_text_to_replace = 替换为
ctrl_trim_text = 要修剪的文本
ctrl_match_against = 匹配：

# Empty states
empty_state_files_title = 未加载文件
empty_state_files_description = 添加文件或文件夹以开始重命名
empty_state_rules_title = 未配置规则
empty_state_rules_description = 添加规则以定义文件重命名方式

# Status
status_update_required = 需要更新
status_up_to_date = 已是最新
