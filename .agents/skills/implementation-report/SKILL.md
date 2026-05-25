---
name: implementation-report
description: 在 Agent 完成实现后生成 Implementation Report。用于 Review Gate 之前。
---

# implementation-report

## Purpose

在代码实现完成后，记录实际变更、执行的命令、测试结果、偏离计划的部分和已知风险。

## When to use

- 代码实现完成后
- 进入 Review Gate 之前
- 需要记录 AI 实际做了什么时

## Inputs

- Plan Artifact
- git diff
- 执行过的命令
- 测试结果
- 修改的文件列表

## Outputs

- Implementation Report（参见 `.ai/artifacts/IMPLEMENTATION_REPORT_TEMPLATE.md`）
- Known risks
- Deviation from plan
- Next action

## Steps

1. 读取 Plan Artifact，理解原始计划
2. 运行 `git diff` 查看实际变更
3. 列出所有修改的文件和改动说明
4. 记录执行过的命令和结果
5. 运行测试并记录结果
6. 对比 Plan 与实际实现，列出偏离
7. 评估已知风险
8. 填写 Implementation Report
9. 建议下一步操作
10. **暂停**，等待 Human Review

## Required files to read

- Plan Artifact（如已创建）
- .ai/artifacts/IMPLEMENTATION_REPORT_TEMPLATE.md

## Human review requirements

- Implementation Report 必须由 Human Owner 审查
- 偏离 Plan 的部分必须由 Human Owner 确认是否可接受
- 任何未在 Plan 中的改动必须由 Human Owner 审查

## Stop conditions

- 测试全部失败 → 报告失败原因，建议返工
- 有 Plan 外的越权修改 → 报告越权，建议回退该修改
- 无法判断风险 → 请求 Human Owner 审查后决定

**重要**：不要自动 commit、不要自动 push、不要自动 merge，除非用户明确批准。
