---
name: launch-check
description: 发布前检查版本是否适合给真实用户，确认指标和回退方案。用于 Launch Gate 阶段。
---

# launch-check

## Purpose

在发布给真实用户之前，确认核心指标已定义、反馈渠道已建立、回退方案已确认。

## When to use

- 进入 Launch Gate 时
- 准备发布新版本时
- 判断版本是否适合公开时

## Inputs

- Review Artifact
- Release notes
- Target users
- Metrics
- Feedback plan

## Outputs

- Launch Review Artifact（参见 `.ai/artifacts/LAUNCH_REVIEW_ARTIFACT_TEMPLATE.md`）
- Decision suggestion：release / private beta / delay / rollback

## Steps

1. 读取 AI_WORKFLOW.md、docs/14_launch_feedback_loop.md、docs/15_metrics_and_signal_framework.md
2. 读取 Review Artifact
3. 确认发布目标
4. 确认目标用户
5. 检查反馈渠道
6. 检查核心指标和阈值
7. 排除虚指标
8. 检查回退方案
9. 列出已知风险
10. 填写 Launch Review Artifact
11. **暂停**，等待 Human Owner 确认

## Required files to read

- AI_WORKFLOW.md
- docs/14_launch_feedback_loop.md
- docs/15_metrics_and_signal_framework.md
- .ai/artifacts/LAUNCH_REVIEW_ARTIFACT_TEMPLATE.md
- Review Artifact（如已创建）

## Human review requirements

- Launch Review Artifact 必须由 Human Owner 审查
- 发布决策必须由 Human Owner 做出
- 不能自行 release

## Stop conditions

- 核心指标未定义 → 建议 delay
- 反馈渠道未建立 → 建议 delay
- 回退方案不可行 → 建议 delay
- Review Artifact 未通过审查 → 先解决代码问题

**重要**：不要自动 commit、不要自动 push、不要自动 merge、不要自动 release，除非用户明确批准。
