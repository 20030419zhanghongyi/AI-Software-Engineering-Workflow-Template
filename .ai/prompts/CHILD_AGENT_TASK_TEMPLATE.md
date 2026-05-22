# CHILD_AGENT_TASK_TEMPLATE.md

> 子 Agent 任务卡模板。为每次子 Agent 分配提供标准格式。

---

## 用途说明

每个子 Agent 在接到任务时，都应收到一张完整的任务卡。任务卡定义了 Agent 的角色、目标、边界和验收标准。任务卡是约束 Agent 行为的核心工具。

---

## 任务卡模板

```markdown
# 任务卡

## Agent Name

[Agent 名称，如 UI Agent / Logic Agent / Test Agent / Docs Agent]

## Role

[本 Agent 在当前任务中的角色，如"负责搜索结果页面的 UI 实现"]

## Goal

[本任务要完成什么。必须具体、可验证。]

## Context

[当前任务的上下文信息]
- 项目背景：[简要说明项目是什么]
- 需求来源：[哪个 Issue 或任务]
- 相关架构决策：[是否涉及到已记录的架构决策]
- 已有实现状态：[当前代码中已有的相关实现]

## Allowed Files

[列出本 Agent 允许修改的文件或目录]

```
src/components/search/
src/styles/search.css
```

## Forbidden Files

[列出本 Agent 禁止修改的文件或目录]

```
src/data/          ← 数据层，不属于 UI Agent
src/logic/         ← 逻辑层，不属于 UI Agent
docs/09_decision_log.md  ← 除非明确要求
```

## Required Reading

[本 Agent 执行任务前必须阅读的文件]

1. docs/00_project_brief.md
2. docs/04_architecture.md
3. docs/05_module_boundaries.md
4. docs/06_coding_standards.md
5. [其他与任务相关的文件]

## Required Checkpoints

[本 Agent 必须在哪些节点提交检查点报告]

- [ ] Checkpoint 0：任务理解确认
- [ ] Checkpoint 1：执行计划
- [ ] Checkpoint 2：首轮代码改动
- [ ] Checkpoint 3：测试结果
- [ ] Checkpoint 5：最终总结

## Execution Steps

[建议的执行步骤，Agent 可以调整但需要说明理由]

1. 阅读任务相关文档
2. 输出任务理解和执行计划
3. 等待监督 Agent 确认
4. 按小步骤实现
5. 每个检查点提交报告
6. 完成后输出变更摘要

## Acceptance Criteria

[完成标准。必须具体、可验证。]

- [ ] [验收标准 1]
- [ ] [验收标准 2]
- [ ] [验收标准 3]
- [ ] 所有测试通过
- [ ] 没有修改 forbidden files
- [ ] 代码符合编码规范

## Stop Conditions

[遇到以下情况必须暂停]

- 试图修改 forbidden files
- 任务范围扩大
- 不确定的需求或设计
- 测试失败
- 架构约束可能被违反

## Required Output

[任务完成后必须提交的内容]

1. 检查点报告（按 CHECKPOINT_REPORT_TEMPLATE.md 格式）
2. 变更摘要：修改了哪些文件、为什么改
3. 测试结果
4. 风险评估
```

---

## 使用方式

1. 监督 Agent 在 Task Decomposition 阶段生成任务卡。
2. 任务卡作为子 Agent 的 System Prompt 的一部分。
3. 子 Agent 必须严格遵守任务卡中的边界和条件。
4. 任何超出任务卡范围的修改，必须先报告监督 Agent。
