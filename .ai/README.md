# .ai/

> 本目录存放 AI 执行时按需读取的模板和协议。

## What Is In This Directory

- `artifacts/`：Stage Gate 产物模板
- `protocols/`：执行协议、反馈协议、停止条件、合并检查
- `prompts/`：Prompt 模板
- `examples/`：示例文档

## When To Read What

### `artifacts/`

在你需要生成对应 Artifact 时再读，例如：

- Plan Artifact
- Review Artifact
- Rollback Plan

### `protocols/`

在你已经明确需要执行某个流程时再读，例如：

- 如何执行 Plan 后实现
- 如何转译用户反馈
- 何时必须暂停
- 合并前检查什么

### `prompts/`

只有在这些场景再读：

- 自定义 Agent Prompt
- 搭 Supervisor / Child Agent 工作流
- 调整 Human Brief 或反馈转译模板

### `examples/`

只有在你需要参考填法时再读。

## Default Rule

普通任务不要默认读取整个 `.ai/`。

建议顺序：

1. 先读 `README.md`、`AGENTS.md`、`AI_WORKFLOW.md`
2. 再按任务需要读取一个具体 Artifact 或 Protocol
3. 不要把 `.ai/` 当成默认必读全集
