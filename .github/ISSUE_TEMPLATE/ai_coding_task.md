---
name: AI Coding Task
about: 创建一个给 AI coding 工具执行的任务
title: '[AI Task] '
labels: ai-coding-task
---

## Goal

[本任务要完成什么？必须具体、可验证。]

## Background

[为什么要做这个任务？上下文是什么？]

## Required Reading

AI 执行本任务前必须阅读以下文档：

1. AI_WORKFLOW.md
2. AGENTS.md
3. docs/00_project_brief.md
4. docs/04_architecture.md
5. docs/05_module_boundaries.md
6. docs/06_coding_standards.md
7. docs/07_testing_strategy.md
8. [其他与任务相关的文件]

## Allowed Files

AI 允许修改的文件或目录：

```
[列出文件或目录]
```

## Forbidden Files

AI 禁止修改的文件或目录：

```
[列出文件或目录]
```

## Acceptance Criteria

- [ ] [验收标准 1]
- [ ] [验收标准 2]
- [ ] [验收标准 3]
- [ ] 所有测试通过
- [ ] 没有越权修改

## Required Checks

合并前必须运行的命令：

- [ ] `[测试命令]`
- [ ] `[构建命令]`
- [ ] `[lint 命令]`

## Stop Conditions

遇到以下情况 AI 必须暂停：

- 试图修改 Forbidden Files
- 任务范围扩大
- 测试失败
- 不确定的需求或设计
- 架构约束可能被违反

## Notes for AI

[需要特别提醒 AI 的事项，如架构约束、性能要求、兼容性考虑等]

---

## Stage Gate

- [ ] Idea Gate
- [ ] MVP Gate
- [ ] Implementation Gate
- [ ] Review Gate
- [ ] Launch Gate
- [ ] Scale Gate

当前任务属于哪个 Stage Gate？请勾选。如有疑问参见 `docs/11_founder_stage_gates.md`。

## Required Artifact

- [ ] Idea Validation Artifact
- [ ] MVP Scope Artifact
- [ ] Plan Artifact
- [ ] Implementation Report
- [ ] Review Artifact
- [ ] Launch Review Artifact
- [ ] Scale Automation Review Artifact
- [ ] Rollback Plan

本任务需要生成哪些 Artifact？请勾选。模板参见 `.ai/artifacts/`。

## Rollback Plan

[如果本任务失败或需要撤回，如何回退？至少说明回退方式和回退后验证步骤。]

## Human Approval Required

- [ ] Plan approved before implementation
- [ ] Review approved before merge
- [ ] Launch approved before release

## Antigravity / Skills Notes

[是否使用 Antigravity 执行？是否调用 Claude Code Skills 或 Codex Skills？如有，说明哪个 Skill。]
