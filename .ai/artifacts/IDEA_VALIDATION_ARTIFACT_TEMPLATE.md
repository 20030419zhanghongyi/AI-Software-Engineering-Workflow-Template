# Idea Validation Artifact

> 判断这个想法是否值得进入 MVP。

---

## Purpose

在写代码之前，先验证问题是否真实存在。产出本 Artifact 供 Human Owner 做方向决策。

## When to create

进入 Idea Gate 时。

## Inputs

- Problem statement
- Target user
- Known alternatives
- Available evidence

---

## Problem Statement

[用一两句话说清：谁遇到了什么问题？]

## Target User

[具体是谁？不是"所有人"。]

## Existing Alternatives

| 替代方案 | 优点 | 不足 |
|---------|------|------|
| [方案 1] | | |
| [方案 2] | | |
| [方案 3] | | |

## Pain Frequency

- [ ] Low frequency, low pain — 不值得做
- [ ] Low frequency, high pain — 可能值得做，需验证
- [ ] High frequency, low pain — 可能值得做，需验证
- [ ] High frequency, high pain — 值得做

## Pain Intensity

[描述问题的严重程度：是"有点烦"还是"完全无法工作"？]

## Evidence

支持进入 MVP 的证据：

1. [证据 1]
2. [证据 2]

应该暂停的证据：

1. [证据 1]

## Risks

- [风险 1]
- [风险 2]

---

## Human Review Checklist

- [ ] 问题是否真实（有证据，不是假设）
- [ ] 目标用户是否具体
- [ ] 替代方案是否已调研
- [ ] 是否有反对证据被刻意忽略
- [ ] 能否用一句话说清"谁遇到了什么问题，我们怎么解决"

## Decision

- [ ] **build** — 问题已验证，进入 MVP Gate
- [ ] **refine** — 问题方向可能对，但需要缩小或调整
- [ ] **reject** — 问题不成立或方案无差异化，停止

## Rollback Option

- 回到 problem statement 重新定义
- 缩小目标用户范围
- 重新做替代方案分析
- 放弃该想法

## Exit Criteria

- Decision 已由 Human Owner 做出
- 如果 build：Idea Validation Artifact 已完成并存入仓库
- 如果 refine：明确了下一步需要补充什么
- 如果 reject：记录了拒绝原因到 Decision Log
