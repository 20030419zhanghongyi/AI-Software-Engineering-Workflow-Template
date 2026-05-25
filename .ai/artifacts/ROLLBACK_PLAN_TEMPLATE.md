# Rollback Plan Template

> 让每个关键阶段都有明确回退方式。

---

## Purpose

在进入任何 Stage Gate 或执行关键操作前，定义回退方案，确保所有操作可逆。

## When to create

- 进入 Implementation Gate 时（作为 Plan Artifact 的一部分）
- 进入 Launch Gate 时
- 任何可能出现不可逆操作的场景

## Inputs

- 当前 Stage Gate
- 涉及的文件和 commit
- 数据影响评估

---

## Rollback Trigger

[什么情况下需要执行回退？]

## Files / Commits Involved

| 文件 / Commit | 操作类型 | 影响范围 |
|--------------|---------|---------|
| [路径 或 commit hash] | 新增 / 修改 / 删除 | [描述] |

## How to Revert

1. [回退步骤 1，如 git revert hash]
2. [回退步骤 2]
3. [回退步骤 N]

## Data Risk

- [ ] 无数据风险（纯代码变更）
- [ ] 有数据风险：[描述]
  - 数据库变更：[是 / 否]
  - 用户数据影响：[是 / 否]
  - 不可逆操作：[是 / 否]

## User Impact

- 回退后用户是否受影响：[是 / 否]
- 如果是，影响是什么：[描述]
- 是否需要通知用户：[是 / 否]

## Verification After Rollback

- [ ] 构建/编译通过
- [ ] 测试通过
- [ ] 手动验证核心路径可用
- [ ] 数据完整性确认（如涉及数据变更）

## Owner Decision

- 回退是否已获 Human Owner 批准：[是 / 否]
- 批准人：[名字]
- 批准时间：[YYYY-MM-DD]

---

## Exit Criteria

- Rollback Plan 已完成
- Human Owner 已确认回退方案可行
- 回退步骤经过验证（至少在逻辑层面可行）
