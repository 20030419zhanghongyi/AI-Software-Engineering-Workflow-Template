---
name: launch-check
description: 发布前检查版本是否适合给真实用户，确认指标和回退方案。用于 Launch Gate 阶段。
---

# launch-check

## Purpose

在发布给真实用户之前，确认核心指标已定义、反馈渠道已建立、回退方案已确认。防止把早期热闹误判为真实需求。

## When to use

- 进入 Launch Gate 时
- 准备发布新版本时
- 判断版本是否适合公开时

## Inputs

- Review Artifact
- Release notes
- Target users（目标用户定义）
- Metrics（指标定义）
- Feedback plan（反馈收集计划）

## Outputs

- Launch Review Artifact（参见 `.ai/artifacts/LAUNCH_REVIEW_ARTIFACT_TEMPLATE.md`）
- Decision suggestion：release / private beta / delay / rollback

## Steps

1. 读取 AI_WORKFLOW.md、docs/14_launch_feedback_loop.md、docs/15_metrics_and_signal_framework.md
2. 读取 Review Artifact，确认代码已通过审查
3. 确认发布目标（一句话说清验证什么）
4. 确认目标用户（具体是谁，不是"所有人"）
5. 检查反馈渠道是否已建立
6. 检查核心指标是否已定义且有阈值
7. 排除虚指标（下载量、点赞等不算 PMF 证据）
8. 检查回退方案是否可行
9. 列出已知风险
10. 填写 Launch Review Artifact
11. 输出建议决策：release / private beta / delay / rollback
12. **暂停**，等待 Human Owner 确认

## Human review requirements

- Launch Review Artifact 必须由 Human Owner 审查
- 发布决策必须由 Human Owner 做出
- AI 不能自行 release

## Stop conditions

- 核心指标未定义 → 建议 delay，先补定义
- 反馈渠道未建立 → 建议 delay
- 回退方案不可行 → 建议 delay，先设计回退
- Review Artifact 未通过审查 → 先解决代码问题

**注意**：本 Skill 不得自动 release、自动 deploy。
