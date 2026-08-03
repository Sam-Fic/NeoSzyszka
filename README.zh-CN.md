# NeoSzyszka

<div align="center">
  <img src="data/icons/com.github.samfic.szyszka.svg" alt="NeoSzyszka" width="128" height="128">
</div>

[English](README.md)

> **分支说明：** 这是 **Rafał Mikrut** 开发的 [Szyszka](https://github.com/qarmin/szyszka) 的一个分支，使用 **GTK 4 和 libadwaita** 重新编写（符合 GNOME 人机界面指南）。  
> 原作者：Rafał Mikrut —— 原仓库地址：<https://github.com/qarmin/szyszka>。该分支由 [Sam-Fic](https://github.com/Sam-Fic/NeoSzyszka) 维护。

NeoSzyszka 是一款简单但强大且快速的批量重命名工具。

## 截图

![NeoSzyszka](screenshot/image.png)

## 功能特性
- 出色的性能（通过 `rayon`/`jwalk` 实现多线程文件搜索）
- 支持 Linux、Mac 和 Windows 平台
- 采用 GTK 4 与 libadwaita 构建的现代图形界面（符合 GNOME 人机界面指南）
- 可通过浏览、拖放或命令行添加文件和文件夹
- 提供多种可自由组合的规则：
  - 文本替换（支持正则表达式）
  - 文本修剪
  - 添加文本
  - 添加序号（包括按文件夹计数的计数器）
  - 清除文本
  - 将字母转换为大写/小写
  - 规范化 Unicode/空白字符
  - 自定义规则（带有可选数值的宏解析器）
- 可保存规则以便日后使用
- 可编辑、重新排序并整理规则与结果列表
- 空状态提示以及重命名操作时的进度对话框
- 应用级偏好设置：语言与主题（浅色/深色）
- 支持 14 种语言：阿拉伯语、捷克语、德语、英语、西班牙语、法语、意大利语、日语、波兰语、葡萄牙语、俄语、瑞典语、乌克兰语、中文
- 可处理数十万条记录

## 系统要求
### Linux
需安装 GTK 4 和 libadwaita 开发库。
```shell
# Ubuntu/Debian
sudo apt install libgtk-4-dev libadwaita-1-dev

# Fedora
sudo dnf install gtk4-devel libadwaita-devel

# Arch
sudo pacman -S gtk4 libadwaita
```

### macOS
需使用 brew 安装 GTK 和 libadwaita：
```shell
brew install gtk4 libadwaita pkg-config
```

### Windows
发布的 ZIP 压缩包已包含所有依赖项，因此在 Windows 10 及以上版本中可直接运行。

## 安装方式
### 预编译二进制文件
可在 https://github.com/Sam-Fic/NeoSzyszka/releases 下载。

### Flatpak
```shell
flatpak install --user https://github.com/Sam-Fic/NeoSzyszka/releases/download/v4.0.0/szyszka-4.0.0.flatpak
flatpak run com.github.samfic.szyszka
```

### 从源码编译
需先安装 [系统要求](#requirements) 中列出的依赖项。
```shell
# 调试版本
cargo build

# 发布版本
cargo build --release

# 直接运行
cargo run
```

该项目还提供了一个 `justfile`，内含常用任务：
```shell
just build      # cargo build
just buildr     # cargo build --release
just run        # cargo run
just runr       # cargo run --release
just clip       # cargo clippy --fix
just fix        # 规范化短横线 + cargo fmt + clippy
just upgrade    # cargo update
```

## 同类工具对比
我尝试过其他几款应用，但它们并不符合我的需求。
- [Nautilus Renamer](https://launchpad.net/nautilus-renamer)：速度较快，内置于 Nautilus 中，但在处理超过 1 万个文件时会卡顿，且无法对不同目录下的文件/文件夹进行重命名。
- [Thunar Bulk Rename](https://docs.xfce.org/xfce/thunar/bulk-renamer/start)：NeoSzyszka 的许多功能都借鉴了这款应用；不过 Thunar Bulk Rename 无法递归添加项目或重命名文件夹。
- [Bulky](https://github.com/linuxmint/bulky)：界面简洁美观且功能强大，但运行较慢，我在安装时遇到了一些问题。

## 贡献方式
非常欢迎各位贡献——无论是提交 Bug 报告、Pull Request 还是参与测试。  
在创建或修改现有规则时，别忘了更新或添加测试用例！  
您也可以在 Crowdin 上添加或完善翻译：https://crowdin.com/project/szyszka

## 名称由来
“Szyszka”是一个波兰语词汇，意为“松果”。

为什么取这么一个奇怪的名字呢？

你能记住类似“超级文件重命名工具”这样的应用名吗？  

大概记不住吧。  

但“Szyszka”这个名字你能记住吗？  

嗯……可能也记不住，不过当你听到这个名字时，肯定会立刻联想到这款应用。

## 许可证
MIT