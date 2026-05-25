---
name: scale-automation-review
description: 判断重复流程是否值得固化为 Skill、Script、CI 或 Docs。用于 Scale Gate 阶段。
---

# scale-automation-review

## Purpose

在项目运行一段时间后复盘，判断哪些重复流程值得固化为 Skill / Script / CI / Docs，哪些必须保持手动。防止盲目自动化。

## When to use

- 进入 Scale Gate 时（项目复盘阶段）
- 发现某些操作重复出现 3 次以上
- 考虑将手动流程自动化时

## Inputs

- Retrospective 记录（docs/10_retrospective.md）
- Repeated tasks（重复出现的任务）
- Current workflow pain points（当前工作流的痛点）
- Human judgment requirements（哪些步骤需要人判断）

## Outputs

- Scale Automation Review Artifact（参见 `.ai/artifacts/SCALE_AUTOMATION_REVIEW_TEMPLATE.md`）
- Suggested automation form：Skill / Script / CI / Docs
- Risks
- Decision suggestion：automate / keep manual / observe more

## Steps

1. 读取 AI_WORKFLOW.md、docs/16_scale_workflow_automation.md 了解自动化审查方法
2. 读取 Retrospective 记录，识别重复出现的任务
3. 对每个重复任务评估：
   - 出现次数是否 3 次以上
   - 每次是否遵循相同步骤
   - 过程中是否需要人的主观判断
4. 选择建议的固化形式：
   - 步骤固定、无需人判断 → CI
   - 步骤固定、需确认输出 → Skill
   - 少量判断可参数化 → Script
   - 大量主观判断 → Docs
5. 评估自动化风险
6. 确认回退方式（保留手动流程文档）
7. 填写 Scale Automation Review Artifact
8. 输出建议决策：automate / keep manual / observe more
9. **暂停**，等待 Human Owner 确认

## Human review requirements

- 自动化决策必须由 Human Owner 做出
- 每个自动化候选的回退方式必须由 Human Owner 确认
- AI 不能自行创建 CI、自行修改工作流

## Stop conditions

- 流程未重复 3 次以上 → 建议观察更多
- 流程中需要大量主观判断 → 建议 keep manual
- 缺少回退方式 → 建议先设计回退再考虑自动化
- 涉及删除数据、修改密钥、merge、release → 不能自动化

**注意**：本 Skill 不得自动创建 CI workflow、不得自动修改生产配置。
