---
name: validate-idea
description: 在写代码前验证想法是否值得进入 MVP。用于 Idea Gate 阶段。
---

# validate-idea

## Purpose

在写任何代码之前，先验证问题是否真实存在，目标用户是否具体，方案是否有差异化。

## When to use

- 有了一个产品想法，想判断是否值得投入
- 进入 Idea Gate 时
- 用户说"我有个想法"但没有验证过问题

## Inputs

- Problem statement（问题陈述）
- Target user（目标用户）
- Existing alternatives（已有替代方案）
- Known evidence（已知证据）
- User constraints（用户约束）

## Outputs

- Idea Validation Artifact（参见 `.ai/artifacts/IDEA_VALIDATION_ARTIFACT_TEMPLATE.md`）
- Decision suggestion：build / refine / reject

## Steps

1. 读取 AI_WORKFLOW.md、docs/12_problem_validation.md 了解验证方法
2. 向用户收集：问题陈述、目标用户、替代方案、已知证据
3. 检查问题是否真实（有证据还是纯假设）
4. 检查目标用户是否具体（不是"所有人"）
5. 列出 3-5 个替代方案及各自的优缺点
6. 评估痛点的频率和强度
7. 分别列出支持进入 MVP 的证据和应该暂停的证据
8. 填写 Idea Validation Artifact
9. 输出建议决策：build / refine / reject
10. **暂停**，等待 Human Owner 确认

## Required files to read

- AI_WORKFLOW.md
- docs/12_problem_validation.md
- .ai/artifacts/IDEA_VALIDATION_ARTIFACT_TEMPLATE.md

## Human review requirements

- Idea Validation Artifact 必须由 Human Owner 审查
- 最终决策（build / refine / reject）必须由 Human Owner 做出
- 不能自行决定跳过 Idea Gate 进入实现

## Stop conditions

- 问题无法定义清楚 → 建议用户重新思考
- 没有任何支持证据 → 建议 reject
- 目标用户是"所有人" → 建议用户缩小范围

**重要**：不要自动 commit、不要自动 push、不要自动 merge，除非用户明确批准。
