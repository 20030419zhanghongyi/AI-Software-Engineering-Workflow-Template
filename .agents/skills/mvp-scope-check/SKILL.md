---
name: mvp-scope-check
description: 在实现前控制 MVP 范围，定义 In scope 和 Out of scope。用于 MVP Gate 阶段。
---

# mvp-scope-check

## Purpose

控制 MVP 范围，列出 In scope 和 Out of scope，确保只验证一个核心假设。

## When to use

- 通过 Idea Gate 后，准备定义 MVP 范围
- 进入 MVP Gate 时
- 用户想开始实现但范围尚未定义

## Inputs

- Idea Validation Artifact
- Requirements（需求描述）
- Current docs（项目文档）
- Project constraints（项目约束）

## Outputs

- MVP Scope Artifact（参见 `.ai/artifacts/MVP_SCOPE_ARTIFACT_TEMPLATE.md`）
- In scope / Out of scope 清单
- Implementation readiness assessment

## Steps

1. 读取 AI_WORKFLOW.md、docs/13_mvp_scope_control.md 了解范围控制方法
2. 读取 Idea Validation Artifact，理解已验证的问题
3. 帮助用户明确本轮 MVP 只验证一个核心假设
4. 列出 In scope 功能，每个说明验证哪个假设、能否更简单
5. 列出 Out of scope 功能，每个说明为什么不做、何时考虑
6. 定义 MVP 成功信号（核心指标 + 阈值）
7. 列出架构约束和安全/隐私底线
8. 填写 MVP Scope Artifact
9. **暂停**，等待 Human Owner 确认

## Required files to read

- AI_WORKFLOW.md
- docs/13_mvp_scope_control.md
- .ai/artifacts/MVP_SCOPE_ARTIFACT_TEMPLATE.md
- Idea Validation Artifact（如已创建）

## Human review requirements

- MVP Scope Artifact 必须由 Human Owner 审查
- In scope 和 Out of scope 必须由 Human Owner 确认
- 最终决策必须由 Human Owner 做出
- 不能自行扩展 MVP 范围

## Stop conditions

- 核心假设多于一个 → 建议用户缩小到只验证一个
- 没有 Out of scope 列表 → 要求用户明确排除项
- 安全底线未定义 → 要求用户补充

**重要**：不要自动 commit、不要自动 push、不要自动 merge，除非用户明确批准。
