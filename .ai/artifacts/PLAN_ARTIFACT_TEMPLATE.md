# Plan Artifact

> 实现前必须明确计划、文件边界、测试方式和回退方式。

---

## Purpose

在 AI 工具执行代码实现之前，先生成本 Artifact，经 Human Owner 确认后才能开始。

## When to create

进入 Implementation Gate 时，从 Issue 或任务生成。

## Inputs

- Issue 或任务描述
- AGENTS.md
- AI_WORKFLOW.md
- 相关 docs

---

## Goal

[一句话说清本次任务要完成什么]

## Context

- 当前 Stage Gate：[Idea / MVP / Implementation / Review / Launch / Scale]
- 关联 Issue：[#issue-number]
- 关联 Artifact：[Idea Validation / MVP Scope / 其他]

## Files to Read

1. [文件路径 + 读取原因]
2. [文件路径 + 读取原因]

## Allowed Files

| 文件 / 目录 | 允许的操作 |
|------------|-----------|
| [路径 1] | [新增 / 修改 / 删除] |
| [路径 2] | [新增 / 修改 / 删除] |

## Forbidden Files

| 文件 / 目录 | 原因 |
|------------|------|
| [路径 1] | [核心架构 / 其他 Agent 负责 / 不在本次范围] |
| [路径 2] | [原因] |

## Implementation Steps

1. [步骤 1]
2. [步骤 2]
3. [步骤 N]

## Test Plan

| 测试 | 类型 | 通过标准 |
|------|------|---------|
| [测试 1] | [单元 / 集成 / 手动] | [标准] |
| [测试 2] | [单元 / 集成 / 手动] | [标准] |

## Rollback Plan

- 回退触发条件：[什么情况下需要回退]
- 回退方式：[git revert / git reset / 其他]
- 回退验证：[回退后如何确认系统正常]

---

## Human Approval

- [ ] Goal 清晰
- [ ] Allowed Files 合理
- [ ] Forbidden Files 无遗漏
- [ ] Implementation Steps 可执行
- [ ] Test Plan 充分
- [ ] Rollback Plan 可行

**批准人**：[Human Owner]
**批准时间**：[YYYY-MM-DD]

## Exit Criteria

- Human Approval 已签署
- 所有 Forbidden Files 已确认
- Rollback Plan 已确认可行性
