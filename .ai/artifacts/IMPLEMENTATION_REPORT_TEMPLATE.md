# Implementation Report

> 记录 Agent 实际做了什么，方便人类审查和 PR 复盘。

---

## Purpose

在 Agent 完成代码实现后，生成本 Artifact 记录实际变更，供 Review Gate 使用。

## When to create

代码实现完成后，进入 Review Gate 之前。

## Inputs

- Plan Artifact
- git diff
- 执行过的命令
- 测试结果

---

## What Changed

[一句话总结本次改动]

## Files Modified

| 文件 | 操作 | 改动说明 |
|------|------|---------|
| [路径 1] | 新增 / 修改 / 删除 | [说明] |
| [路径 2] | 新增 / 修改 / 删除 | [说明] |

## Commands Run

| 命令 | 结果 | 备注 |
|------|------|------|
| [命令 1] | 成功 / 失败 | |
| [命令 2] | 成功 / 失败 | |

## Tests Run

| 测试 | 结果 | 备注 |
|------|------|------|
| [测试 1] | 通过 / 失败 / 跳过 | |
| [测试 2] | 通过 / 失败 / 跳过 | |

## Results

- 整体状态：[成功 / 部分成功 / 失败]
- 验收标准是否全部满足：[是 / 否，说明未满足项]

## Known Risks

- [风险 1]
- [风险 2]

## Deviation from Plan

| 计划 | 实际 | 原因 |
|------|------|------|
| [偏离 1] | | |
| [偏离 2] | | |

如果无偏离，写"无"。

## Next Action

- [ ] 提交 PR / 等待 Review
- [ ] 需要补充测试
- [ ] 需要修复失败项
- [ ] 其他：[说明]

---

## Human Review Checklist

- [ ] 修改文件是否在 Plan 的 Allowed Files 范围内
- [ ] 是否有偏离 Plan 的改动
- [ ] 测试是否通过
- [ ] 是否引入了未在 Plan 中说明的依赖
- [ ] 是否有安全风险

## Rollback Option

- 回退方式：git revert / git reset
- 回退影响：[描述回退后可能的影响]
- 回退验证：[回退后需要验证什么]

## Exit Criteria

- Implementation Report 已完成
- 所有测试已运行（无论是否通过）
- 偏离 Plan 的部分已记录
- 准备好进入 Review Gate 或需要返工
