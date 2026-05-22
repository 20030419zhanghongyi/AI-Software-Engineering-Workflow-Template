# scripts/

> 辅助脚本目录。V1 阶段的自动化占位。

---

## 当前脚本

| 脚本 | 用途 | 状态 |
|------|------|------|
| init-run.ps1 | 初始化一次 AI coding 运行 | 雏形 |
| collect-agent-state.ps1 | 收集 git 状态和 diff | 雏形 |
| create-worktrees.ps1 | 创建 git worktree | 雏形 |

---

## 未来计划

这些脚本的目标是减少手动搬运信息的重复工作，但仍然保留人工决策入口。

### init-run.ps1

- 在 `.ai-runs/` 下创建一次 AI coding 运行的目录结构
- 创建 project-brief.md、supervisor-notes.md、human-feedback.md
- 创建 agents/ 子目录
- 不执行危险操作

### collect-agent-state.ps1

- 输出 git status
- 输出 git diff --stat
- 保存到指定 run 目录下的 supervisor-context.md
- 不自动提交、不自动合并

### create-worktrees.ps1

- 提供参数创建 git worktree
- 默认不执行破坏性操作
- 给出 git worktree add 命令
- 提醒用户先确认 git 状态干净

### 未来可能的脚本

- start-agents.ps1：打开多个终端或 Agent 工位
- supervisor-context.md：自动生成给监督 Agent 的上下文
- Claude Code hooks：自动记录事件、检查越权修改
- Playwright 截图：自动 UI 截图用于审查
