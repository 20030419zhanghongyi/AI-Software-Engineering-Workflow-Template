# MVP Scope Artifact

> 控制 MVP 范围，防止 AI 把所有想法都做出来。

---

## Purpose

定义 MVP 只验证一个核心假设，明确 In scope 和 Out of scope，防止范围 creep。

## When to create

通过 Idea Gate 后，进入 MVP Gate 时。

## Inputs

- Idea Validation Artifact
- 技术调研和选型结果
- 项目约束

---

## Core Hypothesis

我们认为 [目标用户] 在 [场景] 下 需要 [解决方案]，
如果 [验证指标] 达到 [阈值]，说明假设成立。

## In Scope（本轮做）

| 功能 | 验证哪个假设 | 能否更简单 |
|------|-------------|-----------|
| [功能 1] | | |
| [功能 2] | | |

## Out of Scope（本轮不做）

| 功能 | 为什么不做 | 何时考虑 |
|------|-----------|---------|
| [功能 1] | | |
| [功能 2] | | |

## MVP Success Signal

- 核心指标：[定义]
- 达标阈值：[具体数值或描述]
- 观察周期：[多久后复盘]

## Architecture Constraints

- 哪些模块必须保持简单：[列出]
- 哪些地方不能过早抽象：[列出]
- 可接受的技术债范围：[描述]

## Security / Privacy Minimum

- MVP 也必须满足的安全要求：[列出]
- 用户数据存储和保护方式：[描述]
- 必须有人工确认的操作：[列出]

## Testing Minimum

- 上线前必须通过的测试：[列出]
- 必须手动验证的路径：[列出]

---

## Human Review Checklist

- [ ] 核心假设是否只有一个
- [ ] Out of scope 是否真的排除了不该做的功能
- [ ] 安全底线是否已列出
- [ ] 测试最低要求是否已定义
- [ ] 是否存在"顺便加上"的功能隐藏在 In scope 中

## Decision

- [ ] **implement** — 范围清晰，进入 Implementation Gate
- [ ] **narrow** — 范围仍然太大，需要缩小
- [ ] **redesign** — 核心假设需要调整，回到 Idea Gate
- [ ] **pause** — 暂停，等待更多信息

## Rollback Option

- 缩小范围（砍功能，不加功能）
- 重新选择核心假设
- 暂停，回退到 Idea Gate

## Exit Criteria

- Decision 已由 Human Owner 做出
- 如果 implement：MVP Scope Artifact 已完成并存入仓库，In/Out scope 清晰无歧义
- 如果 narrow：明确了需要砍掉哪些功能
- 如果 redesign/pause：记录了原因到 Decision Log
