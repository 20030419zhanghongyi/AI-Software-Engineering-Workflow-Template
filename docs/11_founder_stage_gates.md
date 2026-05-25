# 11. Founder Stage Gates

> v0.2 方向控制层：6 个 Stage Gate 的完整定义。

---

## Purpose

定义项目从想法到规模化的 6 个阶段门禁。每个 Gate 回答"要不要继续往这个方向走"。

## 与执行层的关系

Stage Gate 是方向控制层，软件工程流程（需求→架构→编码→测试→Review→PR→CI→Merge→Release→Retrospective）是执行层。两层并行，不互相替代。

---

## Idea Gate

| 项目 | 内容 |
|---|---|
| 目标 | 判断想法是否值得进入 MVP |
| 输入 | 问题陈述、用户假设、竞品/替代方案 |
| 输出 Artifact | IDEA_VALIDATION_ARTIFACT |
| 人工决策 | build / refine / reject |
| 继续条件 | 问题真实、有明确目标用户、方案有差异化 |
| 回退方式 | 回到 problem statement / 缩小目标用户 / 重新做竞品分析 / 放弃 |
| 常见失败 | 没验证问题就开始写代码 / 把自己需求当普遍需求 / 忽略已有替代方案 |

详细方法参见 `docs/12_problem_validation.md`。

## MVP Gate

| 项目 | 内容 |
|---|---|
| 目标 | 控制 MVP 范围，不让 AI 把所有想法都做出来 |
| 输入 | Idea Validation Artifact、技术调研结果 |
| 输出 Artifact | MVP_SCOPE_ARTIFACT |
| 人工决策 | implement / narrow / redesign / pause |
| 继续条件 | 核心假设明确、范围边界清晰、排除项已列出 |
| 回退方式 | 缩小范围 / 重新选假设 / 暂停进入实现 |
| 常见失败 | 范围不断扩大 / 没有排除项 / 过早抽象 / 安全底线缺失 |

详细方法参见 `docs/13_mvp_scope_control.md`。

## Implementation Gate

| 项目 | 内容 |
|---|---|
| 目标 | 让 AI 工具在明确边界下执行 |
| 输入 | MVP Scope Artifact、Issue、架构文档 |
| 输出 Artifact | PLAN_ARTIFACT + IMPLEMENTATION_REPORT |
| 人工决策 | approve plan / revise plan / reject plan |
| 继续条件 | Plan Artifact 通过确认、文件边界明确、测试策略明确、回退方案明确 |
| 回退方式 | 修改 Plan / 缩小实现范围 / 回到 MVP Gate 重新定范围 |
| 常见失败 | 跳过 Plan Artifact 直接写代码 / 文件边界不清 / 无回退方案 |

## Review Gate

| 项目 | 内容 |
|---|---|
| 目标 | 合并前审查代码、测试、风险和产品体验 |
| 输入 | PR、CI result、Implementation Report |
| 输出 Artifact | REVIEW_ARTIFACT |
| 人工决策 | merge / request changes / rollback / abandon |
| 继续条件 | 测试通过、无越权修改、Review Artifact 完成、回退方案确认 |
| 回退方式 | request changes / rollback / abandon PR |
| 常见失败 | 跳过 diff review / CI 失败仍想 merge / 忽略架构影响 |

## Launch Gate

| 项目 | 内容 |
|---|---|
| 目标 | 判断版本是否适合发布给真实用户 |
| 输入 | Review Artifact、Release Checklist |
| 输出 Artifact | LAUNCH_REVIEW_ARTIFACT |
| 人工决策 | release / private beta / delay / rollback |
| 继续条件 | 指标已定义、反馈渠道已建立、回退方案已确认 |
| 回退方式 | 延迟发布 / 缩小发布范围 / 执行 rollback |
| 常见失败 | 把早期热闹当 PMF / 指标未定义就发布 / 没有反馈收集机制 |

详细方法参见 `docs/14_launch_feedback_loop.md` 和 `docs/15_metrics_and_signal_framework.md`。

## Scale Gate

| 项目 | 内容 |
|---|---|
| 目标 | 决定哪些重复流程值得固化为 Skill / Script / CI / Docs |
| 输入 | Retrospective 记录、操作频率数据 |
| 输出 Artifact | SCALE_AUTOMATION_REVIEW_ARTIFACT |
| 人工决策 | automate / keep manual / observe more |
| 继续条件 | 流程已重复出现且被验证有效、自动化风险可控 |
| 回退方式 | 回退到手动流程 / 暂停自动化 / 增加人工审查点 |
| 常见失败 | 盲目自动化未验证流程 / 自动化了需要人判断的步骤 / 忘记保留回退 |

详细方法参见 `docs/16_scale_workflow_automation.md`。

---

## 跨 Gate 原则

1. 不能跳过 Gate。即使已有 MVP 正在运行，新功能也必须从 Idea Gate 进入。
2. 每个 Gate 的决策必须由 Human Owner 做出。
3. 每个 Gate 的产出必须记录为 Artifact。
4. 回退方案必须在进入 Gate 前就定义。
5. AI 可以准备 Artifact 和建议，不能做 Gate 决策。
