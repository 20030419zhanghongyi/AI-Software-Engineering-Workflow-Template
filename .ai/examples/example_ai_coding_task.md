# Example: AI Coding Task

> 这是一个 AI Coding Task 的填写示例，展示如何使用 .github/ISSUE_TEMPLATE/ai_coding_task.md 创建任务。

---

# 任务卡：实现标签筛选功能

## Agent Name

Logic Agent

## Role

负责标签筛选的业务逻辑实现，包括标签与笔记的关联、按标签筛选笔记列表。

## Goal

实现标签筛选功能：用户可以点击标签，筛选出包含该标签的所有笔记。支持单标签和多标签筛选。

## Context

- 项目背景：LocalMarkdownNote 是一个本地 Markdown 笔记管理桌面应用
- 需求来源：Issue #12 - 用户希望按标签筛选笔记
- 相关架构决策：ADR-003 决定使用 SQLite 存储标签关系
- 已有实现：标签系统基础已实现（Frontmatter 解析、标签数据库表）

## Allowed Files

```
src/logic/tags.ts
src/logic/tags.test.ts
src/data/tags.ts
src/data/tags.test.ts
```

## Forbidden Files

```
src/components/        ← UI 层，不属于 Logic Agent
src/styles/            ← 样式文件
src/platform/          ← 平台适配层
docs/09_decision_log.md  ← 除非明确要求
```

## Required Reading

1. docs/00_project_brief.md
2. docs/04_architecture.md
3. docs/05_module_boundaries.md
4. docs/06_coding_standards.md
5. ADR-003（标签系统设计）

## Required Checkpoints

- [x] Checkpoint 0：任务理解确认
- [x] Checkpoint 1：执行计划
- [ ] Checkpoint 2：首轮代码改动
- [ ] Checkpoint 3：测试结果
- [ ] Checkpoint 5：最终总结

## Execution Steps

1. 阅读 ADR-003 和现有标签相关代码
2. 设计标签筛选的 API 接口
3. 在 data/tags.ts 中实现数据库查询
4. 在 logic/tags.ts 中实现筛选逻辑
5. 编写单元测试
6. 提交检查点报告

## Acceptance Criteria

- [ ] 单标签筛选返回正确结果
- [ ] 多标签筛选（AND 逻辑）返回正确结果
- [ ] 空标签列表返回所有笔记
- [ ] 查询性能