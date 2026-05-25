# AI_WORKFLOW.md

> 本文件是仓库的唯一主流程入口。

## Core Idea

```text
仓库管状态，AI 管执行，CI 管质量，人管决策。
Stage Gates 管方向，Artifacts 管证据，Rollback 管风险。
AI 压缩的是执行成本，不是判断成本。
```

## Two Layers

### Stage Gates = 方向控制层

回答：

- 做不做
- 做哪个方向
- 做多少
- 何时停止或回退

详细参考：`docs/11_stage_gates.md`

### Software Engineering Workflow = 执行层

回答：

- 怎么做
- 修改哪些文件
- 怎么测试
- 怎么审查
- 怎么回退

主线保持不变：

```text
需求 → 方案 → 架构 → 模块边界 → Issue → Plan → 实现 → 测试 → Review → PR → CI → Merge → Release → Retrospective
```

## Minimal Workflow

```text
当前任务
→ 识别 Stage Gate
→ AI 读取最少必要文件
→ AI 生成 Plan Artifact
→ Human 批准计划
→ AI 小步执行
→ 测试 / CI
→ Human 审查 diff、风险、回退方案
→ merge or rework
```

适用于大多数日常 AI coding 任务。

## Full Workflow

```text
Idea Gate
→ MVP Gate
→ Implementation Gate
→ Review Gate
→ Launch Gate
→ Scale Gate
```

常见映射：

| Gate | 产物 |
|---|---|
| Idea Gate | Idea Validation Artifact |
| MVP Gate | MVP Scope Artifact |
| Implementation Gate | Plan Artifact + Implementation Report |
| Review Gate | Review Artifact |
| Launch Gate | Launch Review Artifact |
| Scale Gate | Scale Automation Review Artifact |

## Artifact Flow

Artifact 是证据链，不是装饰。

```text
Idea Gate → IDEA_VALIDATION_ARTIFACT
MVP Gate → MVP_SCOPE_ARTIFACT
Implementation Gate → PLAN_ARTIFACT + IMPLEMENTATION_REPORT
Review Gate → REVIEW_ARTIFACT
Launch Gate → LAUNCH_REVIEW_ARTIFACT
Scale Gate → SCALE_AUTOMATION_REVIEW_ARTIFACT
Any Gate → ROLLBACK_PLAN
```

模板位于 `.ai/artifacts/`。

## Human Gate

AI 可以准备 Artifact、实现代码、汇总风险，但不能替代以下决策：

- Gate 决策
- Plan 批准
- merge
- release
- rollback
- 高风险操作批准

详细规则：`docs/13_human_gate_and_rollback.md`

## Rollback

每个 Gate 都必须有回退方式。

最小要求：

- 回退触发条件
- 回退动作
- 回退后验证

没有回退方案，不进入下一步。

## Context Budget

默认不要读整个仓库。

### Small task

- `5-6` 个文件以内
- 读 `README.md`、`AGENTS.md`、`AI_WORKFLOW.md`、当前任务、当前相关文件

### Medium task

- `7-9` 个文件以内
- 可额外读 `TOOLCHAIN.md`
- 按需读 `1-2` 个 docs 或 `1` 个 Artifact 模板

### Large task

- 超过 `9` 个文件前先输出 Reading Plan
- 等 Human Owner 确认后再扩大读取范围

## Related References

- Stage Gates：`docs/11_stage_gates.md`
- Toolchain / Antigravity：`docs/12_toolchain_and_antigravity.md`
- Human Gate / Rollback：`docs/13_human_gate_and_rollback.md`
- Tool roles：`TOOLCHAIN.md`
- Agent rules：`AGENTS.md`
