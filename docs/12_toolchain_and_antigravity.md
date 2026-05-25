# 12. Toolchain And Antigravity

> v0.2 的工具链和 Antigravity 参考文档。

## Purpose

明确工具角色、权限边界和 Antigravity 的保守使用方式。

## Tool Role Matrix

| Tool | 角色 | 重点边界 |
|---|---|---|
| GitHub Repository | Source of truth | Issue、PR、Artifact、文档、CI 状态最终都回写到仓库 |
| Antigravity | Execution workspace | 负责执行，不负责最终决策 |
| Claude Code Skills | Workflow buttons | 触发标准流程，不替代 Human Gate |
| Codex Skills | Workflow buttons | 触发标准流程，不替代 Human Gate |
| Cursor | Editor / rules assistant | 负责编码和人工审查辅助，不替代 CI |
| GitHub Actions | Quality gate | 自动检查，不做产品判断 |
| Human Owner | Final decision maker | 批准计划、决定 merge / release / rollback |

## GitHub = Source Of Truth

GitHub 是事实中心：

- Issue 记录任务
- PR 记录变更
- CI 记录质量状态
- 文档和 Artifact 留在仓库

聊天记录、执行日志、临时上下文都不是事实中心。

## Antigravity = Execution Workspace

Antigravity 的定位：

- 读取仓库和任务
- 按 Plan Artifact 执行
- 生成实现报告或审查报告
- 提供 Terminal / Browser 验证环境

它不是：

- 事实中心
- 最终决策者
- 自动 merge 工具
- 自动 release 工具

## Claude Code Skills = Workflow Buttons

Claude Code Skills 用来快速调用标准流程，例如：

- validate-idea
- mvp-scope-check
- plan-from-issue
- review-artifact

它们是流程按钮，不是自动化魔法。

## Codex Skills = Workflow Buttons

Codex Skills 与 Claude Code Skills 对应，职责相同：

- 触发标准流程
- 产出标准 Artifact
- 保留 Human Gate

## Cursor = Editor / Rules Assistant

Cursor 适合：

- 人工编辑
- 审查 diff
- 辅助局部实现
- 加载项目规则

不适合：

- 代替 CI
- 代替 GitHub 事实中心

## GitHub Actions = Quality Gate

GitHub Actions 负责：

- 测试
- 构建
- 质量检查

它不负责：

- 产品方向判断
- 发布判断
- Human Review 替代

## Human Owner = Final Decision Maker

Human Owner 负责：

- Gate 决策
- Plan 审批
- merge
- release
- rollback
- 自动化边界

## Antigravity Recommended Workflow

```text
Read task and minimal docs
→ identify Stage Gate
→ generate Plan Artifact
→ wait for human approval
→ execute in small steps
→ run checks
→ generate report
→ hand back to GitHub PR / human review
```

## Antigravity Conservative Permission Settings

建议保守设置：

| Capability | Default |
|---|---|
| Terminal execution | Request Review |
| Browser actions | Request Review 或 Disabled |
| Browser JavaScript | Request Review 或 Disabled |
| High-risk actions | Request Review |
| Non-workspace file access | Disabled |

高风险操作包括：

- 删除文件或数据
- 修改配置
- 网络请求到外部服务
- 安装全局依赖
- 生产相关命令

## What Antigravity Must Not Do

- 不得成为事实中心
- 不得代替 Human Owner
- 不得自动 merge
- 不得自动 release
- 不得绕过 CI
- 不得绕过 Human Review
- 不得默认执行高风险操作
