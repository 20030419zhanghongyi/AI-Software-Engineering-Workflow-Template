# AI_WORKFLOW.md

> v0.2 AI 工作流总览。本文档串联 Stage Gate、软件工程流程、工具链、Artifact 和 Human Gate。

---

## 核心理念

```text
仓库管状态，AI 管执行，CI 管质量，人管决策。
Stage Gates 管方向，Artifacts 管证据，Rollback 管风险。
AI 压缩的是执行成本，不是判断成本。
```

---

## 两层流程模型

v0.2 的流程分为两层：方向控制层和执行层。

### 方向控制层：Stage Gates

```text
Idea Gate → MVP Gate → Implementation Gate → Review Gate → Launch Gate → Scale Gate
```

每一层回答"要不要继续往这个方向走"，由 Human Owner 决策。

### 执行层：软件工程流程

```text
需求分析 → 技术调研 → 技术选型 → 架构设计 → 模块边界 → 编码规范
→ Issue → Plan → Implementation → Test → Review → PR → CI → Merge → Release → Retrospective
```

这一层回答"怎么把事情做对"，由 AI 执行、人审查。

### 两层关系

| | 方向控制层 | 执行层 |
|---|---|---|
| 回答的问题 | 做不做？做哪个？做多少？ | 怎么做？做到什么标准？ |
| 决策者 | Human Owner | Human Owner + AI 建议 |
| 产物 | Gate 决策 + Artifact | 代码 + 文档 + 测试 |
| 回退 | 回到上一个 Gate | git revert / 返工 |

两层不能互相替代。没有方向控制的执行是盲目写代码；没有执行的方向控制是空谈。

---

## Stage Gate 与软件工程流程的映射

| Stage Gate | 主要涉及的软件工程步骤 | 产出 Artifact |
|---|---|---|
| Idea Gate | 需求分析、技术调研 | Idea Validation Artifact |
| MVP Gate | 技术选型、架构设计、模块边界 | MVP Scope Artifact |
| Implementation Gate | Issue、Plan、Implementation、Test | Plan Artifact + Implementation Report |
| Review Gate | Review、PR、CI | Review Artifact |
| Launch Gate | Merge、Release | Launch Review Artifact |
| Scale Gate | Retrospective | Scale Automation Review Artifact |

---

## Stage Gate 概要

### Idea Gate

- **目标**：判断想法是否值得进入 MVP
- **人工决策**：build / refine / reject
- **关键问题**：问题是否真实？谁有这个问题？现有替代方案是什么？
- **详细定义**：参见 `docs/11_founder_stage_gates.md` 和 `docs/12_problem_validation.md`

### MVP Gate

- **目标**：控制 MVP 范围，防止 AI 把所有想法都做出来
- **人工决策**：implement / narrow / redesign / pause
- **关键问题**：本轮只验证哪个假设？哪些功能明确不做？
- **详细定义**：参见 `docs/11_founder_stage_gates.md` 和 `docs/13_mvp_scope_control.md`

### Implementation Gate

- **目标**：让 Antigravity / Claude Code / Codex 在明确边界下执行
- **人工决策**：approve plan / revise plan / reject plan
- **前提**：Plan Artifact 通过人工确认、文件边界明确、测试策略明确、回退方案明确
- **详细定义**：参见 `docs/11_founder_stage_gates.md`

### Review Gate

- **目标**：合并前审查代码、测试、风险和产品体验
- **人工决策**：merge / request changes / rollback / abandon
- **必须包含**：Review Artifact、PR、CI result、Manual diff review、Risk list、Rollback plan
- **详细定义**：参见 `docs/11_founder_stage_gates.md`

### Launch Gate

- **目标**：判断版本是否适合发布给真实用户
- **人工决策**：release / private beta / delay / rollback
- **必须避免**：把早期热闹误判为真实需求
- **详细定义**：参见 `docs/11_founder_stage_gates.md`、`docs/14_launch_feedback_loop.md`、`docs/15_metrics_and_signal_framework.md`

### Scale Gate

- **目标**：决定哪些重复流程值得固化为 Skill / Script / CI / Docs
- **人工决策**：automate / keep manual / observe more
- **关键问题**：哪些操作已经重复出现？哪些仍然需要人判断？
- **详细定义**：参见 `docs/11_founder_stage_gates.md` 和 `docs/16_scale_workflow_automation.md`

---

## Artifact 系统

每个 Gate 的产出必须记录为 Artifact，作为证据链沉淀在仓库中。

```text
Idea Gate         → IDEA_VALIDATION_ARTIFACT
MVP Gate          → MVP_SCOPE_ARTIFACT
Implementation Gate → PLAN_ARTIFACT + IMPLEMENTATION_REPORT
Review Gate       → REVIEW_ARTIFACT
Launch Gate       → LAUNCH_REVIEW_ARTIFACT
Scale Gate        → SCALE_AUTOMATION_REVIEW_ARTIFACT
任何 Gate         → ROLLBACK_PLAN（如果需要回退）
```

Artifact 模板位于 `.ai/artifacts/`。

每个 Artifact 必须包含：
- Purpose
- When to create
- Inputs
- Required sections
- Human review checklist
- Rollback option
- Exit criteria

---

## Human Gate 机制

每个 Gate 都有人工检查点。AI 不能跳过任何 Human Gate。

| 场景 | 必须人工确认 |
|---|---|
| Idea Gate 决策 | build / refine / reject |
| MVP Scope 确认 | 范围边界和排除项 |
| Plan Artifact 审查 | 批准实现计划 |
| 高风险终端命令 | Antigravity 执行前确认 |
| Review 结论 | merge / request changes / rollback |
| 发布决策 | release / beta / delay |
| 自动化决策 | 是否允许固化为 Skill / CI |
| 回退决策 | 是否执行 rollback |

详细协议参见 `docs/19_rollback_and_human_gate_protocol.md`。

---

## 工具链角色

详细说明参见 `TOOLCHAIN.md`。

| 工具 | 角色 | 不能做什么 |
|---|---|---|
| GitHub Repository | 事实中心 | — |
| Antigravity | 执行工作台 | 不能替代事实中心、不能自动 merge/release |
| Claude Code | 执行 + Skills 载体 | 不能绕过 Human Gate |
| Codex | 执行 + Skills 载体 | 不能自动 commit/push/merge |
| Cursor | 编辑与规则辅助 | 不能替代 CI |
| GitHub Actions | 质量门禁 | 不能做产品判断 |
| Human Owner | 最终决策者 | — |

---

## 回退原则

1. 每个 Gate 都必须有回退方式
2. 回退决策必须由 Human Owner 做出
3. 回退方案必须在进入 Gate 前就定义
4. 以下操作禁止自动化：删除数据、修改密钥、修改生产配置、自动 merge、自动 release、绕过 CI、跳过人工产品判断

详细协议参见 `docs/19_rollback_and_human_gate_protocol.md`。

---

## 读取顺序

新用户或 AI Agent 建议按以下顺序阅读：

```text
1. README.md          — 项目入口
2. AI_WORKFLOW.md     — 工作流总览（本文档）
3. TOOLCHAIN.md       — 工具链角色
4. AGENTS.md          — AI 总规则
5. docs/11_founder_stage_gates.md — Stage Gate 完整定义
6. docs/19_rollback_and_human_gate_protocol.md — 回退与人工门禁
7. docs/              — 按需阅读其余文档
8. .ai/artifacts/     — 按需使用 Artifact 模板
9. .claude/skills/ 或 .agents/skills/ — 按需调用 Skills
```
