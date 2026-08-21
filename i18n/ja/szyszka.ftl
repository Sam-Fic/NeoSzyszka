# Upper buttons
upper_start_renaming_button = 名前の変更を開始
upper_add_files_button = ファイルを追加
upper_add_folders_button = フォルダを追加
upper_remove_selection_button = 選択範囲を削除
upper_update_names_button = 名前を更新
upper_results_one_up_button = 1つ上へ
upper_results_one_down_button = ワンダウン
upper_select_popup_button = 選択
# Bottom Buttons
bottom_rule_add_button = ルールを追加
bottom_rule_edit_button = ルールの編集
bottom_rule_remove_button = ルールを削除
bottom_rule_one_up_button = 1つ上へ
bottom_rule_one_down_button = ワンダウン
bottom_rule_save_rules_button = ルールを保存
bottom_rule_load_rules_button = ルールを読み込む
# Edit names
edit_names_used_in_rules = ルールで使用される名前: { $rules }
edit_names_choose_name = ルールの名前を選択してください（存在する場合は上書きされます）
# Tree View Rules
tree_view_upper_column_type = タイプ
tree_view_upper_column_current_name = 現在の名前
tree_view_upper_column_future_name = 将来の名前
tree_view_upper_column_path = パス
# Tree View Results
tree_view_bottom_tool_type = ツールタイプ
tree_view_bottom_usage_name = 使用者名
tree_view_bottom_description = 説明
# Settings
settings_language_label = 言語
settings_open_rules = ルール設定ファイルを開く
settings_open_cache_custom_texts = カスタム キャッシュ ファイルを開く
settings_open_config_dir = キャッシュディレクトリを開く
check_button_dark_theme = ダークアイコン
# Other in main window
bottom_rule_label_rules = ルール
upper_files_folders_label = ファイル/フォルダ
upper_files_folders_label_update = ファイル/フォルダ({ $files_number }) - ##### 要求を更新する #####
upper_files_folders_label_up_to_date = ファイル/フォルダ({ $files_number }) - 日付まで
# Select popover
button_select_all = すべて選択
button_select_reverse = 選択を逆にする
button_select_custom = カスタムを選択
button_unselect_all = すべて選択解除
button_select_changed = 変更を選択
button_unselect_changed = 選択解除の変更
# Un/Select custom
select_custom_example = 使用法: */フォルダ-番号*/* または 名前-バージョン-*.txt
select_custom_path = パス
select_custom_current_path = 現在のパス
select_custom_future_path = 将来のパス
select_custom_path_current_name = パス + 現在の名前
select_custom_path_future_name = パス + 変更後の名前
select_custom_directory_file = ディレクトリ/ファイル
select_custom_select_directory = ディレクトリを選択
select_custom_unselect_directory = ディレクトリの選択を解除
# General
dialog_button_ok = OK
dialog_button_cancel = キャンセル
# Dialogs
dialog_name_files_to_include = 含めるファイル
dialog_name_folders_to_include = 含めるフォルダ
dialog_scan_inside = 内側をスキャン
dialog_ignore_folders = フォルダを無視
dialog_confirm_renaming = 名前の変更を確認
dialog_outdated_results = 古い結果
dialog_results_of_renaming = 名前を変更した結果
dialog_save_rule = ルールの保存
dialog_select_custom = カスタムを選択
settings_open_log_folder = ログフォルダーを開く

# Rule Window


## Common

label_usage_type = 使用タイプ:
label_example = 例
label_example_text_before = 以下を参照：
label_example_text_after = あと:
button_rule_window_add = ルールの追加

## Custom

label_custom_instruction = $(NAME) - ファイル名を出力
                           $(EXT) - 拡張子を出力
                           $(MODIF) - ファイルの更新日を出力
                           $(CREAT) - ファイルの作成日を出力
                           $(CURR) - 拡張子付きの現在のファイル名を出力
                           $(PARENT) - 親フォルダ名を出力
                           $(N)/$(K) - 数字を出力（引数は省略可）
                           $(N:3:4:5) 3から始まる数字を、ステップ4で出力し
                           5桁になるようゼロで埋めます。
                           Kは代わりにリスト内の位置のみを出力し、フォルダ内のアイテムの位置も使用します。
menu_button_load_custom_rule = カスタムルール選択
button_save_custom_rule = カスタムルールを保存

## Upper/Lower Case

check_button_letters_type_uppercase = 大文字・小文字
check_button_letters_type_lowercase = 小文字
check_button_letters_usage_name = 名前のみ
check_button_letters_usage_extension = エクステンションのみ
check_button_letters_usage_both = 両方とも
label_letters_tool_type = ツールタイプ:
# Purge
label_purge_tool_type = ツールタイプ:
check_button_purge_name = 名前のみ
check_button_purge_extension = エクステンションのみ
check_button_purge_both = 両方とも
# Add number
label_add_number_place = 数字を入れる場所:
label_add_number_settings = 番号の設定:
check_button_add_number_before_name = 名前の前
check_button_add_number_after_name = 名前の後
label_number_start_number = 開始番号
label_number_step = ステップ
label_number_fill_zeros = ゼロで塗りつぶし
# Add text
check_button_add_text_before_name = 名前の前
check_button_add_text_after_name = 名前の後
label_add_text = 追加するテキスト:
# Replace
check_button_replace_name = 名前のみ
check_button_replace_extension = エクステンションのみ
check_button_replace_both = 両方とも
check_button_replace_case_sensitive = 大文字と小文字を区別する
check_button_replace_case_insensitive = 大文字小文字を区別しない
check_button_replace_regex = 正規表現を使用
check_button_replace_replace_all = すべての繰り返しを置き換え
label_replace_replacing_strings = 文字列の置き換え:
label_replace_text_to_find = 検索するテキスト
label_replace_text_to_replace = 置換されたテキスト
label_replace_captures = キャプチャ
label_replace_captured_captures = キャプチャされたキャプチャ
label_replace_captures_number = ({ $capture_number } 個のキャプチャ)
label_replace_no_captures = キャプチャなし
label_replace_invalid_regex = 無効な正規表現があります
# Trim
check_button_trim_name_start = 名前の開始
check_button_trim_name_end = 名前 終了
check_button_trim_extension_start = 拡張機能の開始
check_button_trim_extension_end = 拡張機能の終了
check_button_trim_case_sensitive = 大文字と小文字を区別する
check_button_trim_case_insensitive = 大文字小文字を区別しない
label_trim_trim_text = テキストをトリムする
label_trim_case_sensitivity = ケース感度
# Normalize name
label_normalize_name = すべて — 名前を `a-z`、`0-9`、`-`、空白、`.` のみで構成される形式に変更します。
                       例: `żółć CZERona.Txt` → `zolc-czerwona.txt`

                       部分的 — 上記と同じように動作しますが、空白と大文字 `A-Z` を使用できます。
                       例: ` Źrebię Krokietowe.Rar ` → `Zrebie Krokietowe.Rar`
check_button_normalize_everything = すべて
check_button_normalize_partial = 部分的な
# RuleType
rule_type_custom = カスタム
rule_type_case_size = 案件サイズ
rule_type_purge = 削除
rule_type_add_text = テキストを追加
rule_type_trim = 切り落とし
rule_type_replace = 置換
rule_type_add_number = 番号を追加
rule_type_normalize = 正規化
# RulePlace
rule_place_none = 該当なし
rule_place_extension = エクステンションのみ
rule_place_name = 名前のみ
rule_place_extension_name = 拡張機能と名前
rule_place_before_extension = 拡張の前
rule_place_after_extension = 拡張機能の後
rule_place_before_name = 名前の前
rule_place_after_name = 名前の後
rule_place_from_name_start = 開始から
rule_place_from_name_end_reverse = 名前の終わりから開始まで
rule_place_from_extension_start = 拡張機能の開始から
rule_place_from_extension_end_reverse = エクステンション終了からスタートまで
# Rule Description
rule_description_full_normalize = 完全な正規化
rule_description_partial_normalize = 部分正規化
rule_description_zeros = そして { $zeros } 個のゼロで満たしています
rule_description_step = { $start } から { $step }で始まる{ $zeros }
rule_description_lowercase = 小文字
rule_description_uppercase = 大文字・小文字
rule_description_text = テキスト
rule_description_added_text = テキストを追加:
rule_description_start = 開始
rule_description_end_of_name = 名前の終わり
rule_description_extension = 拡張
rule_description_end_of_extension = エクステンションの終了
rule_description_trimming = { $trim_text }から " { $where_remove }" をトリミング中
rule_description_custom_rule = カスタムルール: { $custom_rule }
rule_description_replace = { $additional_regex_text } "{ $text_to_find }" を "{ $text_to_replace } " に置き換える
# Notebooks
notebook_tab_custom = カスタム
notebook_tab_case_size = 上位/下位ケース
notebook_tab_purge = 削除
notebook_tab_add_number = 番号を追加
notebook_tab_add_text = テキストを追加
notebook_tab_replace = 置換
notebook_tab_trim = 切り落とし
notebook_tab_normalize = 名前を正規化する
# Renaming dialog
renaming_question = { $number_of_renamed_files } ファイルの名前を変更してもよろしいですか？
renaming_destination_file_exists = 保存先のファイルは既に存在します。
renaming_renamed_files = { $properly_renamed } ファイルの名前を正しく変更しました
renaming_ignored_files = 変更前と変更後の名前が同じであるため、 { $ignored } ファイルを無視しました。
renaming_failed_files = { $failed_vector } ファイルの名前を変更できませんでした
renaming_list_of_failed_to_rename = すべての失敗した名前のリスト
renaming_error = エラー
renaming_some_records_not_updated = 一部のレコードは更新されません。\nボタンをクリックすると更新できます。 \n 名前を更新せずに続行してもよろしいですか？
renaming_missing_files = 不足しているファイル
renaming_require_missing_files = 少なくとも 1 つのファイルを使用する必要があります。
renaming_missing_rules = ルールがありません
renaming_require_missing_rules = 少なくとも1つのルールを使用する必要があります


# --- Missing translations added ---
ctrl_after_name = 名前の後
ctrl_before_name = 名前の前
ctrl_both = 両方
ctrl_case_insensitive = 大文字と小文字を区別しない
ctrl_case_sensitive = 大文字と小文字を区別する
ctrl_everything = すべて
ctrl_extension_end = 拡張子の末尾
ctrl_extension_start = 拡張子の先頭
ctrl_fill_zeros = ゼロで埋める
ctrl_lowercase = 小文字
ctrl_match_against = 次と照合:
ctrl_name_end = 名前の末尾
ctrl_name_start = 名前の先頭
ctrl_only_extension = 拡張子のみ
ctrl_only_name = 名前のみ
ctrl_partial = 部分的
ctrl_replace_all = すべて置換
ctrl_start_number = 開始番号
ctrl_step = ステップ
ctrl_text_to_find = 検索するテキスト
ctrl_text_to_replace = 置換後のテキスト
ctrl_trim_text = 切り取るテキスト
ctrl_uppercase = 大文字
ctrl_use_regex = 正規表現を使用
dialog_add_folders_body = スキャンオプションを設定
dialog_add_folders_title = 含めるフォルダ
dialog_copy_all_errors = すべてのエラーをコピー
dialog_language_body = アプリケーションの言語を選択
dialog_language_restart = 再起動
dialog_language_restart_confirm = 言語は再起動後に変更されます。今すぐ再起動しますか？
dialog_language_title = 言語
dialog_loading = 処理中…
dialog_move_down = 下に移動
dialog_move_up = 上に移動
dialog_save_rule_set_body = ルールの名前を選択（存在する場合は上書きされます）
dialog_save_rule_set_name = ルール名
dialog_save_rule_set_title = ルールセットを保存
dialog_saved_rule_sets = 保存済みルールセット
dialog_select = 選択
dialog_select_body = 選択アクションを選ぶ
dialog_select_custom_body = 使い方: */フォルダ*/* または 名前-バージョン-*.txt
dialog_select_custom_hint = ディレクトリ/ファイルモードが有効な場合、パターンは無視されます。
dialog_select_custom_include_dirs = ディレクトリを含める
dialog_select_custom_match = 次と照合:
dialog_select_custom_pattern = パターン
dialog_select_custom_title = 選択/選択解除（カスタム）
empty_state_files_description = 名前を変更するにはファイルまたはフォルダを追加してください
empty_state_files_title = ファイルが読み込まれていません
empty_state_rules_description = ファイルの名前変更方法を定義するルールを追加してください
empty_state_rules_title = ルールが設定されていません
menu_about = 情報
menu_appearance = 外観
menu_dark_theme = ダークテーマ
menu_language = 言語…
menu_light_theme = ライトテーマ
menu_open_config_dir = 設定ディレクトリを開く
menu_open_custom_texts_file = カスタムテキストファイルを開く
menu_open_log_folder = ログフォルダを開く
menu_open_rules_file = ルール設定ファイルを開く
menu_preferences = 設定
menu_title = メニュー
rule_editor_add = ルールを追加
rule_editor_cancel = キャンセル
rule_editor_custom_save = カスタムルールを保存
rule_editor_custom_saved = 保存済みカスタムテキスト:
rule_editor_delete = 削除
rule_editor_edit = ルールを編集
rule_editor_example = 例
rule_editor_example_after = 後:
rule_editor_example_before = 前:
rule_editor_load = 読み込み
rule_editor_reset = デフォルトにリセット
rule_editor_title = ルールエディタ
rule_editor_tool_type = ツールの種類:
rule_editor_usage_type = 使用法の種類:
rule_no_selection = ルールが選択されていません。編集するルールを選択してください。
select_custom_hint = ディレクトリ/ファイルモードが有効な場合、パターンは無視されます。
settings_theme = テーマ
settings_theme_dark = ダーク
settings_theme_light = ライト
settings_theme_system = システム
sort_by = 並べ替え
sort_descending = 降順
sort_future_name = 新しい名前
sort_name = 名前
sort_path = パス
sort_type = 種類
sort_usage = 使用法
status_up_to_date = 最新
status_update_required = 更新が必要
tab_add_number = 番号を追加
tab_add_text = テキストを追加
tab_case_size = 大文字/小文字
tab_custom = カスタム
tab_normalize = 名前を正規化
tab_purge = 削除
tab_replace = 置換
tab_trim = 切り取り
