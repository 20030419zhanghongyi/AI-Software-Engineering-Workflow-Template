# WORKFLOW_PROTOCOL.md

> 本文件只补充执行协议，不重复主流程总览。

## Use With

- `AI_WORKFLOW.md`
- `AGENTS.md`
- 当前 Issue / 当前任务

## Execution Protocol

1. 识别当前任务属于哪个 Stage Gate。
2. 按 Context Budget 读取最少必要文件。
3. 先生成 Plan Artifact。
4. 等 Human Owner 批准后再开始实现。
5. 小步修改，避免范围扩大。
6. 记录测试、风险、偏离计划的部分。
7. 完成后生成 Implementation Report 或 Review Artifact。
8. 把结果回写到 GitHub PR / Issue / 仓库文档。

## Required Checks During Execution

- Allowed Files / Forbidden Files 是否明确
- 是否需要补读 `docs/04`、`docs/05`、`docs/07`
- 是否已有回退方式
- 是否触发暂停条件

## Single-Agent Short Path

```text
task
→ minimal reading
→ plan
→ human approval
→ implementation
→ tests
→ review artifact
→ human review
```

## Multi-Agent Short Path

```text
supervisor identifies gate and boundaries
→ child agents receive scoped tasks
→ checkpoint review
→ human brief if needed
→ integration review
```

## Do Not

- 不要跳过 Plan Artifact
- 不要跳过 Human Gate
- 不要默认读完整个仓库
- 不要在 CI 失败时继续推进 merge
