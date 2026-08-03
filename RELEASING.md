# NeoSzyszka 发布指南（Release Guide）

> 涵盖版本发布流程（AI 走前几步 + `release.yml` CI 自动构建三平台并发布）以及 Flatpak 构建专项细节。

> 本文档供 AI 编程助手在协助构建和发布版本时参考。
>
> **发布模型（重要）**：本项目的实际发布由 `.github/workflows/release.yml` 全自动完成——推送 `v*` tag 后，CI 并行构建三平台产物（Flatpak / Windows / macOS），并自动创建 GitHub Release 上传全部安装包。
> 因此 **AI 在本地只负责「版本元数据」与「提交 + 打 tag + 推送」**，不要本地执行 flatpak 构建，也不要手动 `gh release create`（会重复创建或与 CI 冲突）。构建与发布一律交给 CI。
>
> **AI 应自动完成**：确定 changelog → 更新 `Cargo.toml` / `Cargo.lock` / `metainfo.xml` → commit → tag → push。无需用户手动执行任何步骤。

## 一、前置条件

确保系统已安装：

```bash
flatpak --version       # 需要 >= 1.12
flatpak-builder --version
cargo --version
```

需要添加 Flathub 运行时源（首次）：

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.gnome.Platform//47 org.gnome.Sdk//47
flatpak install --user flathub org.freedesktop.Sdk.Extension.rust-stable//24.08
```

## 二、版本发布完整流程

> **AI 执行说明**：以下所有步骤应由 AI 自动完成，无需用户手动操作。AI 应按顺序执行：查看 git 历史 → 更新版本号 → 更新 metainfo → commit → tag → push。推送 `v*` tag 后，三平台构建与 GitHub Release 创建由 `release.yml` CI 自动完成，AI **不**应在本地执行 flatpak 构建或手动 `gh release create`。

### 2.1 版本发布提交规范

**每次版本发布包含多个功能提交 + 1 个版本更新提交**：

1. **功能提交**：将代码变更提交到主分支（数量不限）
2. **发布提交**：修改版本号到 `Cargo.toml` 和 `metainfo.xml`，并重新生成 `Cargo.lock`

**版本发布 commit 格式**：

```bash
git commit -m "release: v4.1.0"
```

> `metainfo.xml` 中的 `version` 属性为纯版本号（如 `4.1.0`），不含 `v` 前缀。

### 2.2 确定更新内容范围

在填写版本更新日志时，需要通过 Git 提交历史来确定新版本包含的变更：

```bash
# 查看当前版本与上一版本之间的所有提交
git log v4.0.0..HEAD --oneline

# 查看详细变更内容（用于总结更新日志）
git log v4.0.0..HEAD --stat --name-only
```

> 💡 **提示**：当 Git 提交记录中没有明确的版本标记时，请查看最近 20-50 条提交历史，结合 README 和代码变更来判断版本边界。通常版本号更新提交会包含 `Cargo.toml` 和 `metainfo.xml` 的修改。

---

### 2.3 更新版本号

需要修改 **3 个文件**：

| 文件 | 修改内容 |
| --- | --- |
| `Cargo.toml` | 第 5 行 `version = "x.y.z"`（此为唯一版本源） |
| `Cargo.lock` | 运行 `cargo check` 自动更新 |
| `data/com.github.samfic.szyszka.metainfo.xml` | 在 `<releases>` 内新增 `<release>` 条目，按版本号**从新到旧**排列，`date` 使用当天日期（格式 `YYYY-MM-DD`） |

`metainfo.xml` 新增条目的格式示例：

```xml
<release version="4.1.0" date="2026-07-10">
  <description>
    <p>新特性与修复：</p>
    <ul>
      <li>简单描述：具体变更 1</li>
      <li>简单描述：具体变更 2</li>
    </ul>
  </description>
</release>
```

> 💡 `date` 属性使用当天日期，格式为 `YYYY-MM-DD`。

### 2.4 提交、打标签与推送

> **推送即发布**：推 `v*` tag 后，`release.yml` 会自动构建三平台产物并创建 GitHub Release。所以这一步之后 AI 无需再做构建或发布操作，只需等待 CI 完成并验证结果。

AI 应直接执行以下命令，无需询问用户：

```bash
# 更新 Cargo.lock
cargo check

git add Cargo.toml Cargo.lock data/com.github.samfic.szyszka.metainfo.xml
git commit -m "release: vX.Y.Z"
git tag vX.Y.Z
git push && git push origin vX.Y.Z
```

### 2.5 本地构建 Flatpak（仅用于验证，不参与发布）

> ⚠️ **本地产物不进入发布流程**：实际发布由 `release.yml` CI 自动完成。以下本地步骤仅供开发期快速验证（确认能打包/能运行），**不要**把本地导出的 `.flatpak` 手动传到 GitHub Release——那会与 CI 自动创建的 Release 重复或冲突。

#### 方式 A：仅本地安装（快速验证）

```bash
# 1. 生成 vendored 依赖
cargo vendor

# 2. 构建并安装
flatpak-builder build-dir flatpak/com.github.samfic.szyszka.yml --user --install --force-clean

# 3. 清理
rm -rf vendor/
```

- `build-dir/` 是临时构建目录（已在 `.gitignore` 中忽略）
- `--force-clean` 会删除旧的构建目录，避免缓存冲突
- `--user --install` 构建完成后自动安装到当前用户环境

#### 方式 B：导出 .flatpak 文件（本地验证用，非发布路径）

> ⚠️ **重要说明**：`flatpak-builder --repo=flatpak-repo build-dir ...` 会创建两个独立的目录：
>
> - `build-dir/` — **构建目录**，存放编译产物（可被 `--force-clean` 清理，已在 `.gitignore` 中忽略）
> - `flatpak-repo/` — **仓库目录**，由 `--repo` 指定的地方，`build-bundle` 必须从此读取仓库数据
>
> 如果将 `build-dir` 误用作 `build-bundle` 的参数会报错。

```bash
# 步骤 1：生成 vendored 依赖
cargo vendor

# 步骤 2：构建到本地仓库
flatpak-builder --repo=flatpak-repo build-dir flatpak/com.github.samfic.szyszka.yml --force-clean

# 步骤 3：从本地仓库导出单文件 bundle
flatpak build-bundle flatpak-repo szyszka-X.Y.Z.flatpak com.github.samfic.szyszka

# 步骤 4：清理
rm -rf vendor/
```

> ⚠️ **常见错误**：`build-bundle` 的第一个参数必须是 **本地仓库目录**（即 `--repo=` 指定的目录），**不是**构建目录 `build-dir/`。如果传入 `build-dir/` 会报错：
>
> ```
> error: 'build-dir' is not a valid repository: opening repo: opendir(objects): No such file or directory
> ```

### 2.6 验证构建结果

```bash
# 检查 bundle 文件大小
ls -lh szyszka-*.flatpak

# 确认 flathub 源已添加（首次需要）
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# 安装并运行验证
flatpak install --user --or-update -y szyszka-X.Y.Z.flatpak
flatpak run com.github.samfic.szyszka

# 确认 metainfo 中的版本号正确
flatpak info com.github.samfic.szyszka
```

> 💡 **交互式确认**：`flatpak install` 可能弹出确认提示 `[Y/n]`，在脚本中可添加 `--noninteractive` 标志：
>
> ```bash
> flatpak install --noninteractive --user --or-update szyszka-X.Y.Z.flatpak
> ```

### 2.7 修改源码后重新构建

如果在构建 flatpak **之后**又修改了源码（如修正版本号、更新翻译等），**必须重新执行完整构建流程**（`cargo vendor` → `flatpak-builder --repo=...` + `build-bundle`），否则安装的仍是旧构建。仅重新 `cargo build` 不会影响已安装的 flatpak 包。

## 三、项目结构说明

```
flatpak/
  com.github.samfic.szyszka.yml   ← Flatpak 构建清单（manifest）
Cargo.toml                        ← Cargo 构建配置（**唯一版本源**）
Cargo.lock                        ← 依赖锁定文件（cargo check 自动更新）
data/
  com.github.samfic.szyszka.metainfo.xml  ← AppStream 元数据（版本记录在此）
  com.github.samfic.szyszka.desktop       ← 桌面入口文件
  icons/com.github.samfic.szyszka.svg     ← 应用图标
```

### 构建清单结构

`flatpak/com.github.samfic.szyszka.yml` 包含一个模块：

1. **`szyszka`**：主应用，使用 `type: dir` 指向本地源码 + vendored Cargo 依赖

构建流程：
- `cargo vendor` 将所有 crate 下载到 `vendor/` 目录
- `.cargo/config.toml`（inline source）告诉 cargo 使用 vendored 依赖
- `cargo --offline build --release` 离线编译

> 说明：`type: dir` 在 CI 中同样可用——`release.yml` 的 Flatpak job 在容器内 checkout 仓库后，清单里的 `path: ..` 正好指向仓库根目录，因此无需改成 `type: archive` 或 `type: git`。

## 四、构建配置的关键细节

### 4.1 运行时版本

当前使用 `org.gnome.Platform` **runtime-version: 47**（对应 GNOME 47）。

如果需要升级运行时版本（例如 GNOME 48 发布后），需要同时更新：

- `flatpak/com.github.samfic.szyszka.yml` 中的 `runtime-version`
- CI/CD 中安装的运行时版本

### 4.2 权限（finish-args）

```yaml
- --share=ipc          # 进程间通信（X11 需要）
- --socket=fallback-x11 # X11 回退
- --socket=wayland     # Wayland 显示协议
- --device=dri         # GPU 硬件加速
```

> 注意：NeoSzyszka 不需要 `--filesystem=host`，因为用户通过 GTK 文件选择器添加文件，不需要直接访问文件系统。

### 4.3 Rust SDK 扩展

```yaml
sdk-extensions:
  - org.freedesktop.Sdk.Extension.rust-stable
```

Rust 工具链通过 SDK 扩展提供，无需在 manifest 中单独构建。

## 五、常见问题排查

### 5.1 构建失败：缺少 vendored 依赖

```
error: no matching package named `xxx` found
note: offline mode (via `--offline`) can sometimes cause surprising resolution failures
```

**解决**：确保在构建前执行了 `cargo vendor`，并且 `.cargo/config.toml` 正确指向 `vendor/` 目录。

### 5.2 构建失败：Rust 扩展未安装

```
error: /usr/lib/sdk/rust-stable/bin/cargo: No such file or directory
```

**解决**：

```bash
flatpak install --user flathub org.freedesktop.Sdk.Extension.rust-stable//24.08
```

### 5.3 构建失败：GNOME SDK 版本不匹配

**解决**：检查 `flatpak/com.github.samfic.szyszka.yml` 中的 `runtime-version` 是否与已安装的 SDK 版本一致。

### 5.4 本地安装时交互式提示

```
Configure this as new remote 'flathub' [Y/n]:
```

如果在自动化脚本中运行，可以预先添加 flathub 远程源避免提示：

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

### 5.5 网络超时/重试

构建时下载 vendored crate 可能因网络不稳定失败：

```bash
# 失败后直接重试即可，vendor 目录会被缓存
cargo vendor
flatpak-builder --repo=flatpak-repo build-dir flatpak/com.github.samfic.szyszka.yml --force-clean
```

### 5.6 文件路径不被 Git 跟踪

构建产生的 `*.flatpak`、`build-dir/`、`flatpak-repo/`、`.flatpak-builder/`、`vendor/` 等均已包含在 `.gitignore` 中。如果希望保留某个版本的 bundle，手动复制到其他目录或发布到 GitHub Releases。

### 5.7 构建产物清理

构建产物不会自动清理，建议定期删除旧版本 bundle 以节省磁盘空间：

```bash
# 删除旧版本 bundle，保留当前版本
find . -name "szyszka-*.flatpak" ! -name "szyszka-4.1.0.flatpak" -delete

# 清理旧的构建目录
rm -rf build-dir/ flatpak-repo/ .flatpak-builder/ vendor/
```

### 5.8 跨版本构建注意事项

从旧版本构建升级时，注意 `.flatpak-builder/` 缓存可能导致问题。使用 `--force-clean` 可确保完全重新构建。

## 六、AI 执行发布的前几步（本地手动，无脚本封装）

> 本项目**不提供发版脚本**，AI 直接按下列清单逐步执行本地步骤；构建与发布由 `release.yml` CI 自动完成。所有步骤由 AI 自动完成，用户无需手动操作。

```bash
# ──────────────────────────────────────
# 发布前几步：AI 本地执行；构建+发布交给 CI
# ──────────────────────────────────────
# 1. 取上一版本到现在的提交作为 changelog 草稿来源：
#      LAST=$(git tag -l 'v*' | sort -V | tail -1)
#      git log ${LAST}..HEAD --pretty=format:'%s'
#    （无历史 tag 时用 git log --pretty=format:'%s' -20）
#
# 2. 【关键】把草稿逐条二次改写成最终发布日志（强制格式，禁止直接照搬 commit 原文）：
#      · 每条 <li> 使用「简短描述：具体变更」的中英文双语，例如：
#        <li>批量重命名：支持正则替换文件名 (Batch rename: regex filename substitution)</li>
#      · 语言需流畅、面向用户，不要出现内部 commit 风格（如 "fix:"、"refactor:"）
#      · 在 metainfo.xml 的 <releases> 顶部插入 <release> 条目（version 纯版本号，无 v 前缀；date 用今天 YYYY-MM-DD）：
#        <release version="X.Y.Z" date="YYYY-MM-DD">
#          <description>
#            <p>新特性与修复：</p>
#            <ul>
#              <li>...</li>
#            </ul>
#          </description>
#        </release>
#
# 3. 编辑 Cargo.toml 更新 version = "X.Y.Z"
# 4. cargo check          # 刷新 Cargo.lock
# 5. git add Cargo.toml Cargo.lock data/com.github.samfic.szyszka.metainfo.xml
#    && git commit -m "release: vX.Y.Z" && git tag vX.Y.Z && git push && git push origin vX.Y.Z
#    → 推送 v* tag 即触发 release.yml：自动三平台构建 + 创建 GitHub Release 上传全部安装包
# 6. 等待 CI 完成，用 gh run list --workflow release.yml 跟踪，确认三个产物
#    （.flatpak / .exe / macOS 二进制）均已出现在 GitHub Release
```

> 💡 第 2 步是重点：自动生成的 commit 列表只是**草稿**，AI 必须二次润色成符合上式的流畅双语日志，再写入 metainfo。release.yml 会从该条目提取 notes，因此 metainfo 里的日志即最终对外发布文案。

```bash
# ──────────────────────────────────────
# 仅本地安装验证（快速开发测试，不进入发布）
# ──────────────────────────────────────
cargo vendor
flatpak-builder build-dir flatpak/com.github.samfic.szyszka.yml --user --install --force-clean
rm -rf vendor/
```

---

## 七、发布到 GitHub Releases（由 CI 自动完成）

> **不要手动创建 Release**：`.github/workflows/release.yml` 的 `release` job 会在 `v*` tag 推送后，自动下载三平台 artifact、从 `metainfo.xml` 提取对应版本 notes、创建（唯一的）GitHub Release 并上传全部安装包。手动 `gh release create` 会与 CI 重复，导致两个 Release 或上传冲突。

### 7.1 推送 tag 前的自检（CI 前置条件）

确保满足以下条件，否则 CI 发布会失败或 notes 为空：

- `metainfo.xml` 的 `<releases>` 顶部已存在与本次 tag 版本**完全一致**的 `<release version="X.Y.Z">` 条目（无 `v` 前缀）；
- `Cargo.toml` 的 `version` 与 tag 版本一致；
- 已 `git push origin vX.Y.Z` 推送 tag（仅 push 分支不会触发 `release.yml`，它只在 `tags: ['v*']` 时运行）。

### 7.2 验证 CI 发布结果

推送 tag 后，AI 应检查 CI 是否成功产出 Release：

```bash
# 查看 release.yml 运行状态（等待所有 job 成功）
gh run list --workflow release.yml --limit 3

# CI 完成后，确认 Release 与三平台产物
gh release view vX.Y.Z
gh release download vX.Y.Z -D /tmp/szyszka-release && ls -lh /tmp/szyszka-release
```

> 💡 若 CI 自动发布的 Release notes 为空（如 metainfo 缺该版本条目），可在补全 metainfo 后，
> 用 `gh release edit vX.Y.Z --notes-file notes.md` 修正 notes，**不要重新 `gh release create`**。

> ⚠️ 仅在 CI 异常失败、且确实需要本地补救时才手动创建/补传，此时应仅上传 CI 漏掉的产物，
> 避免与 CI 已发布的 Release 冲突。正常流程一律依赖 CI。

---

## 八、GitHub Actions 自动化

项目配置了 `.github/workflows/release.yml`，当推送 `v*` 标签时自动完成跨平台构建与发布：

1. 并行构建 3 个产物：Flatpak bundle（Linux 平台专用）、Windows 二进制、macOS 二进制
2. 从 `metainfo.xml` 提取对应版本的更新说明
3. 创建（唯一的）GitHub Release，将全部产物一并上传

### 8.1 触发方式

```bash
# 手动触发完整发布流程
git tag v4.1.0
git push origin v4.1.0
# → 自动触发 CI 构建 + 发布
```

### 8.2 CI 构建流程

发布流程中仅 Flatpak job 使用仓库内的 manifest（`flatpak/com.github.samfic.szyszka.yml`，其中 `type: dir`、`path: ..` 指向仓库根目录），无需 `type: archive` 或 tarball；三平台二进制 job 则直接 `cargo build --release`，因此：

1. 推送 `v*` 标签后，CI 自动 checkout 仓库（清单的 `path: ..` 即指向仓库根）
2. Flatpak job 自动运行 `cargo vendor` 生成 vendored 依赖，并用 `type: dir` 源码构建 bundle
3. Windows / macOS job 各自安装对应 GTK 依赖（MSYS2 / `brew`）后 `cargo build --release`；Linux 平台不产出独立原生二进制，仅由 Flatpak job 提供安装包
4. 统一的 `release` job 下载全部 artifact，从 `metainfo.xml` 提取 notes，一次性创建 GitHub Release 并上传所有产物

### 8.3 本地模拟 CI 构建

CI 使用的是 `type: dir` 清单（与前文本地构建完全一致），因此本地模拟 CI 构建最简单的方式就是**直接用同一份 manifest**，无需改成 archive：

```bash
# 1. 生成 vendored 依赖
cargo vendor

# 2. 构建（与 release.yml 中的命令一致）
flatpak-builder --repo=flatpak-repo build-dir flatpak/com.github.samfic.szyszka.yml --force-clean

# 3. 导出 bundle
flatpak build-bundle flatpak-repo szyszka-X.Y.Z.flatpak com.github.samfic.szyszka

# 4. 清理
rm -rf vendor/
```

> 说明：CI 容器内 checkout 后清单的 `path: ..` 指向仓库根，与本地执行时目录结构相同，所以本地命令和 CI 命令一致。
