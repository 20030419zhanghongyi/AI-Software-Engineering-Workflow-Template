# Launch Review Artifact

> 防止把点赞、围观、早期热闹误判为真实需求。

---

## Purpose

在发布给真实用户之前，确认指标、反馈渠道和回退方案已就绪。

## When to create

进入 Launch Gate 时。

## Inputs

- Review Artifact
- Release notes
- 目标用户定义
- 指标定义
- 反馈收集计划

---

## Release Goal

[一句话说清本轮发布验证什么]

## Target Users

[具体发布给谁？不是"所有人"。]

## Feedback Channels

| 渠道 | 用途 |
|------|------|
| [GitHub Issues] | Bug 和功能请求 |
| [渠道 2] | [用途] |

## Metrics

### Core Metric (Level 1)

| 指标 | 定义 | 数据来源 | 达标阈值 |
|------|------|---------|---------|
| [指标 1] | [怎么算] | [哪里看] | [具体数值] |

### Auxiliary Metrics (Level 2)

| 指标 | 定义 | 数据来源 |
|------|------|---------|
| [指标 2] | | |
| [指标 3] | | |

### Excluded Vanity Metrics

| 指标 | 为什么不算 |
|------|-----------|
| 下载量 / 安装量 | 不代表使用 |
| 点赞 / 关注 | 不代表付费或留存 |

## Known Risks

- [风险 1]
- [风险 2]

## Rollback Plan

- 回退触发条件：[什么情况下需要撤回发布]
- 回退方式：[版本回退 / 功能开关 / 其他]
- 回退后用户影响：[描述]
- 回退后验证：[需要确认什么]

---

## Human Review Checklist

- [ ] 核心指标已定义且可度量
- [ ] 达标阈值已定义
- [ ] 反馈渠道已建立
- [ ] 回退方案可行
- [ ] 虚指标已排除（不会用下载量/点赞判断成功）
- [ ] 发布目标清晰（一句话能说清验证什么）

## Decision

- [ ] **release** — 条件满足，发布给目标用户
- [ ] **private beta** — 先缩小范围发布
- [ ] **delay** — 延迟发布，补充缺失条件
- [ ] **rollback** — 发现问题，执行回退

## Exit Criteria

- Decision 已由 Human Owner 做出
- 如果 release：发布已完成，进入反馈收集期
- 如果 private beta：beta 范围已定义
- 如果 delay：明确了需要补充什么
- 如果 rollback：回退方案已执行
