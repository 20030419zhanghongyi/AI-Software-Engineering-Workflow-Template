# Release Process

> 本文档用于记录项目的发布流程，包括版本号、CHANGELOG、tag、GitHub Release 和回滚。

---

## 用途说明

Release Process 文档确保每次发布都有据可查、可回滚。即使是个人项目，也应该有基本的版本管理习惯。

## 填写指南

- 版本号规则要事先定义好，不要临时决定。
- CHANGELOG 不需要很详细，但要记录用户可见的变化。
- 回滚流程提前想好，不要等出问题了再想。
- 根据项目实际情况调整，不需要过度复杂。

---

## 推荐模板

```markdown
# Release Process

## 版本号规则

采用语义化版本（SemVer）：`MAJOR.MINOR.PATCH`

- MAJOR：不兼容的 API 变更
- MINOR：向后兼容的功能新增
- PATCH：向后兼容的问题修复

预发布版本：`MAJOR.MINOR.PATCH-alpha.1` / `beta.1` / `rc.1`

---

## CHANGELOG 格式

每次发布前更新 CHANGELOG.md：

```markdown
## [版本号] - YYYY-MM-DD

### Added
- 新增功能描述

### Changed
- 变更描述

### Fixed
- 修复描述

### Removed
- 移除描述
```

---

## 发布步骤

1. 确认所有待发布功能已合并到主分支
2. 运行全部测试和构建
3. 更新 CHANGELOG.md
4. 更新版本号（package.json / Cargo.toml / ...）
5. 提交版本变更：`git commit -m "chore: bump version to x.y.z"`
6. 创建 tag：`git tag vx.y.z`
7. 推送：`git push && git push --tags`
8. 在 GitHub 上创建 Release，附上 CHANGELOG 内容
9. 触发发布构建（如有 CI 发布流程）

---

## GitHub Release

- Tag 名称：`vx.y.z`
- Release 标题：`版本号`
- Release 内容：复制 CHANGELOG 对应版本的内容
- 勾选 "Set as the latest release"（如果是最新版本）
- 如有构建产物，上传到 Release Assets

---

## 回滚流程

1. 确认需要回滚的版本
2. 在 GitHub 上查看该版本的 Release，确认回滚范围
3. 方式一（推荐）：创建新版本修复问题，发布新版本
4. 方式二（紧急回滚）：`git revert` 对应提交，创建 hotfix 版本
5. 更新 CHANGELOG 记录回滚操作
6. 通知相关方（如有）

> 注意：个人项目中，回滚通常意味着快速修一个 hotfix 版本，
> 而不是真的删除历史版本。
```

---

## 示例片段

```markdown
## 版本号规则

采用 SemVer。当前版本：0.1.0

0.x.x 阶段表示 API 尚未稳定，MINOR 版本也可能包含破坏性变更。

## CHANGELOG 示例

## [0.2.0] - 2024-07-01

### Added
- 全文搜索功能
- 标签筛选功能

### Fixed
- 修复首次启动时索引未创建的问题

## 回滚流程

个人项目回滚 = 新建 hotfix 版本
不删除已发布的 Release，避免版本号混乱
```

---

## 与 AI coding 的关系

AI coding 工具应：

- 不要擅自修改版本号。
- 不要跳过测试直接建议发布。
- 修复 bug 后应提醒是否需要发 hotfix 版本。
- 功能变更后应提醒更新 CHANGELOG。
