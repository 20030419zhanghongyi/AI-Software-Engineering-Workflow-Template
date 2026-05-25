# 17. AI Tool Matrix

> 各 AI 工具在 Stage Gate 中的角色与职责。

---

## Purpose

明确 AI 工具在 Stage Gate 各阶段能做什么、不能做什么，防止工具错位使用。

## When to use

- 选择工具执行任务时
- 配置工具权限时
- Review 工具使用是否合规时

## Inputs

- 当前 Stage Gate 阶段
- 任务类型

## Outputs

- 工具选择决策

---

## 工具与 Stage Gate 矩阵

| Stage Gate | Antigravity | Claude Code | Codex | Cursor | GitHub Actions |
|---|---|---|---|---|---|
| Idea Gate | 不适用 | 可用 validate-idea Skill | 可用 validate-idea Skill | 编辑验证文档 | 不适用 |
| MVP Gate | 不适用 | 可用 mvp-scope-check Skill | 可用 mvp-scope-check Skill | 编辑范围文档 | 不适用 |
| Implementation Gate | 按 Plan Artifact 执行 | 按 Plan Artifact 执行 | 按 Plan Artifact 执行 | 编辑代码 | 不适用 |
| Review Gate | 生成 Review Artifact | 生成 Review Artifact | 生成 Review Artifact | 人工 diff review | 运行 CI |
| Launch Gate | 不适用 | 可用 launch-check Skill | 可用 launch-check Skill | 编辑发布文档 | 可执行发布检查 |
| Scale Gate | 不适用 | 可用 scale-automation-review Skill | 可用 scale-automation-review Skill | 编辑自动化配置 | 可配置新 CI |

---

## 权限原则

所有 AI 工具通用：

| 操作 | 权限 |
|---|---|
| 读取仓库文件 | 允许 |
| 生成 Artifact | 允许（需人工审查） |
| 写代码到分支 | 允许（需 PR） |
| 执行测试命令 | 允许（低风险） |
| 执行终端命令 | Request Review |
| 浏览器 JS 执行 | Request Review 或 Disabled |
| 修改非工作区文件 | Disabled |
| Commit / Push | 必须人工确认 |
| Merge | 禁止自动化 |
| Release | 禁止自动化 |
| 删除数据 | 禁止自动化 |
| 修改密钥/配置 | 禁止自动化 |

---

## Human checkpoint

- 工具选择是否合适
- 权限设置是否保守
- 是否有工具绕过了 Human Gate

## Rollback option

- 降低工具权限
- 回退到手动操作
- 更换工具（如从 Antigravity 切换到 Claude Code）

---

## 常见失败模式

1. 用 Antigravity 自动 merge
2. 用 Codex 自动 push
3. 让 AI 工具跳过 Plan Artifact 直接执行
4. 在 Idea Gate 就开始让 AI 写代码
5. 把 CI 结果当产品判断
