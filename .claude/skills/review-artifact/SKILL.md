---
name: review-artifact
description: 在 PR 前或 PR 中生成 Review Artifact，审查代码、架构、边界和风险。用于 Review Gate 阶段。
---

# review-artifact

## Purpose

在合并前审查代码、测试、架构影响、模块边界和风险，产出 Review Artifact 支持 Review Gate 决策。

## When to use

- 进入 Review Gate 时
- PR 提交后需要审查时
- 合并前需要系统化审查时

## Inputs

- git diff
- Implementation Report
- 测试结果
- docs/04_architecture.md
- docs/05_module_boundaries.md

## Outputs

- Review Artifact（参见 `.ai/artifacts/REVIEW_ARTIFACT_TEMPLATE.md`）
- Merge recommendation
- Risk review
- Rollback option

## Steps

1. 读取 Implementation Report
2. 运行 `git diff` 查看完整变更
3. 评估架构影响（是否需要更新架构文档）
4. 检查模块边界（改动是否越过了模块边界）
5. 检查测试结果（是否通过、覆盖率是否充分）
6. 评估风险（安全、性能、兼容性等）
7. 评估产品影响（是否影响用户体验）
8. 填写 Review Artifact
9. 给出合并建议：merge / request changes / rollback / abandon
10. **暂停**，等待 Human Owner 审查并决策

## Human review requirements

- Review Artifact 必须由 Human Owner 审查
- 合并决策必须由 Human Owner 做出
- AI 不能自行 merge

## Stop conditions

- 有越权修改 → 建议 request changes 或 rollback
- 测试未通过 → 建议 request changes
- 模块边界被破坏 → 建议 request changes 或 rollback
- 架构约束被违反 → 必须暂停，让 Human Owner 决定

**注意**：本 Skill 不得自动 merge、自动 push、自动 release。
