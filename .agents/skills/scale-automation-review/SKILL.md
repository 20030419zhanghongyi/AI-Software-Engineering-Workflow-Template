---
name: scale-automation-review
description: 判断重复流程是否值得固化为 Skill、Script、CI 或 Docs。用于 Scale Gate 阶段。
---

# scale-automation-review

## Purpose

在项目运行一段时间后复盘，判断哪些重复流程值得固化为 Skill / Script / CI / Docs。防止盲目自动化。

## When to use

- 进入 Scale Gate 时
- 发现某些操作重复出现 3 次以上
- 考虑将手动流程自动化时

## Inputs

- Retrospective 记录
- Repeated tasks
- Current workflow pain points
- Human judgment requirements

## Outputs

- Scale Automation Review Artifact（参见 `.ai/artifacts/SCALE_AUTOMATION_REVIEW_TEMPLATE.md`）
- Suggested automation form
- Risks
- Decision suggestion：automate / keep manual / observe more

## Steps

1. 读取 AI_WORKFLOW.md、docs/16_scale_workflow_automation.md
2. 读取 Retrospective 记录，识别重复任务
3. 对每个重复任务评估频率、步骤一致性、判断需求
4. 选择建议的固化形式
5. 评估自动化风险
6. 确认回退方式
7. 填写 Scale Automation Review Artifact
8. **暂停**，等待 Human Owner 确认

## Required files to read

- AI_WORKFLOW.md
- docs/16_scale_workflow_automation.md
- docs/10_retrospective.md
- .ai/artifacts/SCALE_AUTOMATION_REVIEW_TEMPLATE.md

## Human review requirements

- 自动化决策必须由 Human Owner 做出
- 回退方式必须由 Human Owner 确认
- 不能自行创建 CI workflow

## Stop conditions

- 流程未重复 3 次以上 → 建议观察更多
- 流程中需要大量主观判断 → 建议 keep manual
- 缺少回退方式 → 先设计回退再考虑自动化
- 涉及删除数据、修改密钥、merge、release → 不能自动化

**重要**：不要自动 commit、不要自动 push、不要自动 merge、不要自动 release，除非用户明确批准。不要自行创建或修改 GitHub Actions workflow。
