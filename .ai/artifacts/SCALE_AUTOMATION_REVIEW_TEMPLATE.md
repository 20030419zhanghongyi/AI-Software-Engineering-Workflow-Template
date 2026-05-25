# Scale Automation Review Artifact

> 防止盲目自动化。只有重复出现且经过验证的流程，才考虑固化。

---

## Purpose

判断哪些重复流程值得固化为 Skill / Script / CI / Docs，哪些必须保持手动。

## When to create

进入 Scale Gate 时（项目运行一段时间后复盘）。

## Inputs

- Retrospective 记录
- 操作频率数据
- 已有 Skills / Scripts / CI 列表

---

## Repeated Workflow

[描述重复出现的流程]

## Frequency

- 出现次数：[N 次以上]
- 每次是否遵循相同步骤：[是 / 否 / 大致相同]
- 过程中是否需要人的主观判断：[是 / 否 / 部分]

## Human Judgment Required

- [ ] 流程中不需要人判断，可完全自动化
- [ ] 流程中需要少量判断，可参数化
- [ ] 流程中需要大量主观判断，不适合自动化

## Automation Candidate

| 流程步骤 | 可自动化 | 需人判断 | 建议 |
|---------|---------|---------|------|
| [步骤 1] | 是 / 否 | 是 / 否 | |
| [步骤 2] | 是 / 否 | 是 / 否 | |

## Suggested Form

| 条件 | 推荐形式 |
|------|---------|
| 步骤固定、无需人判断 | CI（GitHub Actions） |
| 步骤固定、需要人确认输出 | Skill（Claude / Codex） |
| 步骤含少量判断、可参数化 | Script（PowerShell / Bash） |
| 步骤含大量主观判断 | Docs（文档化流程，人执行） |

本流程建议：[Skill / Script / CI / Docs]，原因：[说明]

## Risks

- [风险 1]
- [风险 2]

---

## Human Review Checklist

- [ ] 流程确实重复出现 3 次以上
- [ ] 每次结果一致，不是"看起来像但其实不同"
- [ ] 自动化不会跳过需要人判断的步骤
- [ ] 回退方式已定义（保留手动流程文档）
- [ ] 不属于禁止自动化的操作（删除数据、修改密钥、merge、release）

## Decision

- [ ] **automate** — 按建议形式固化
- [ ] **keep manual** — 继续手动执行
- [ ] **observe more** — 继续观察，暂不决定

## Rollback Option

- 回退到手动流程（保留手动操作文档）
- 暂停自动化，继续观察
- 给自动化增加人工审查点

## Exit Criteria

- Decision 已由 Human Owner 做出
- 如果 automate：明确了固化形式、回退方式、人工审查点
- 如果 keep manual / observe more：记录了原因
