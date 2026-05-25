# Review Artifact

> 服务于 PR 审查，避免只看代码是否能跑，而忽略架构、边界和风险。

---

## Purpose

在合并前审查代码、测试、风险和产品体验，产出本 Artifact 支持 Review Gate 决策。

## When to create

进入 Review Gate 时，PR 提交后。

## Inputs

- git diff
- Implementation Report
- 测试结果
- 架构文档
- 模块边界文档

---

## Diff Summary

- 变更文件数：[N]
- 新增行数：[N]
- 删除行数：[N]
- 一句话概括：[描述主要改动]

## Architecture Impact

- [ ] 无架构影响
- [ ] 有架构影响：[描述]
- 是否需要更新 docs/04_architecture.md：[是 / 否]

## Module Boundary Check

- [ ] 改动未越过模块边界
- [ ] 改动越过了模块边界：[描述哪个文件改了哪个模块的内容]

## Test Result

| 测试类型 | 结果 |
|---------|------|
| 单元测试 | 通过 / 失败 / 跳过 |
| 集成测试 | 通过 / 失败 / 跳过 |
| 手动验证 | 通过 / 失败 / 未执行 |
| CI | 通过 / 失败 / 等待中 |

## Risk Review

| 风险 | 严重性 | 缓解方式 |
|------|--------|---------|
| [风险 1] | 高 / 中 / 低 | |
| [风险 2] | 高 / 中 / 低 | |

## Product Impact

- [ ] 无产品体验变化
- [ ] 有产品体验变化：[描述]
- 是否需要更新用户文档：[是 / 否]

---

## Human Review Checklist

- [ ] 代码逻辑可读、可维护
- [ ] 无越权修改
- [ ] 无无关重构
- [ ] 无不必要的依赖引入
- [ ] 模块边界未被破坏
- [ ] 测试覆盖了关键路径
- [ ] 安全无明显风险
- [ ] 文档已更新（如需要）

## Merge Recommendation

- [ ] **merge** — 所有条件满足，建议合并
- [ ] **request changes** — 有问题需要修改后再审
- [ ] **rollback** — 有严重问题，建议回退
- [ ] **abandon** — 方向不对，建议放弃本轮修改

## Rollback Option

- 回退方式：[git revert / 其他]
- 回退风险：[描述]
- 回退后验证：[需要确认什么]

## Exit Criteria

- Review Artifact 已完成
- Human Owner 已审查并做出决策
- 如果 merge：准备好进入 Launch Gate（如果涉及发布）
- 如果 request changes：明确列出需要修改的内容
- 如果 rollback / abandon：回退方案已执行或正在执行
