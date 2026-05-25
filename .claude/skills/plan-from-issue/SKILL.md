---
name: plan-from-issue
description: 从 GitHub Issue 或用户任务生成 Plan Artifact。用于 Implementation Gate 阶段。
---

# plan-from-issue

## Purpose

在实现代码之前，从 Issue 或任务描述生成结构化的 Plan Artifact，明确文件边界、测试策略和回退方案。

## When to use

- 进入 Implementation Gate 时
- 收到 Issue 或用户任务，需要制定实现计划
- 任何需要 AI 编码的任务开始之前

## Inputs

- Issue 或任务描述
- README.md
- AGENTS.md
- AI_WORKFLOW.md
- TOOLCHAIN.md
- 相关 docs（架构、模块边界、编码规范、测试策略）

## Outputs

- Plan Artifact（参见 `.ai/artifacts/PLAN_ARTIFACT_TEMPLATE.md`）
- Allowed files / Forbidden files 清单
- Test plan
- Rollback plan

## Steps

1. 读取 Issue 或任务描述，理解目标
2. 读取 README.md、AGENTS.md、AI_WORKFLOW.md、TOOLCHAIN.md
3. 读取相关 docs：docs/04_architecture.md、docs/05_module_boundaries.md、docs/06_coding_standards.md、docs/07_testing_strategy.md
4. 判断当前任务属于哪个 Stage Gate
5. 列出本次任务需要读取的文件
6. 定义 Allowed Files 和 Forbidden Files
7. 设计 Implementation Steps
8. 设计 Test Plan
9. 设计 Rollback Plan
10. 填写 Plan Artifact
11. **暂停**，等待 Human Owner 审批 Plan

## Human review requirements

- Plan Artifact 必须由 Human Owner 审批后才能开始实现
- Allowed Files 和 Forbidden Files 必须由 Human Owner 确认
- Rollback Plan 必须由 Human Owner 确认可行
- AI 不能在 Plan 未审批前开始写代码

## Stop conditions

- Issue 目标不清晰 → 请求用户补充
- 无法确定文件边界 → 请求用户指定
- 无法设计 Rollback Plan → 请求用户提供回退思路
- 任务涉及 Forbidden Files → 暂停，报告需要修改边界
