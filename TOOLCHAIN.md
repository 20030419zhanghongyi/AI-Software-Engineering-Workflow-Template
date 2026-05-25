# TOOLCHAIN.md

> 本文件只定义职责矩阵、使用场景和权限边界。

## Tool Role Matrix

| Tool | 主要职责 | 能做什么 | 不能做什么 |
|---|---|---|---|
| GitHub Repository | 事实中心 | 管理 Issue、PR、文档、Artifact、CI 状态 | 不能替代执行工具 |
| Antigravity | 执行工作台 | 读取仓库、执行计划、运行命令、生成报告 | 不能成为事实中心，不能自动 merge / release |
| Claude Code | 执行 + Skill 载体 | 读仓库、生成 Artifact、实现修改 | 不能绕过 Human Gate |
| Codex | 执行 + Skill 载体 | 读仓库、生成 Artifact、实现修改 | 不能自动 commit / push / merge |
| Cursor | 编辑器 / 规则助手 | 编辑、审查、局部实现、加载规则 | 不能替代 CI |
| GitHub Actions | 质量门禁 | 运行测试、构建、检查 | 不能做产品判断 |
| Human Owner | 最终决策者 | 批准计划、审查风险、决定 merge / release / rollback | 不能把判断责任丢给 AI |

## Recommended Use

| 场景 | 推荐工具 |
|---|---|
| 生成 Plan Artifact | Claude Code / Codex / Antigravity |
| 小步实现 | Claude Code / Codex / Antigravity |
| 人工修改和 diff 审查 | Cursor / GitHub PR |
| 自动质量检查 | GitHub Actions |
| 任务和状态记录 | GitHub Issue / PR |

## Permission Boundary

- GitHub：事实中心
- Antigravity：执行工作台
- Claude Code / Codex：执行层工具
- Cursor：编辑环境
- GitHub Actions：自动检查
- Human Owner：最终判断

默认规则：

- merge 需要人工确认
- release 需要人工确认
- rollback 需要人工确认
- 高风险命令需要人工确认
- 不允许绕过 CI

## Antigravity Notes

如果任务涉及 Antigravity，再读：`docs/12_toolchain_and_antigravity.md`

关键边界：

- Antigravity 不是事实中心
- Antigravity 不是最终决策者
- Antigravity 不允许自动 merge
- Antigravity 不允许自动 release
