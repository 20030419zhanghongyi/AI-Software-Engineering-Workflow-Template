# 11. Stage Gates

> v0.2 的唯一 Stage Gate 参考文档。

## Purpose

定义从想法到规模化的方向门禁，防止 AI 直接把模糊想法一路推进到实现、发布和自动化。

## When To Use

- 新方向、新功能、新发布、新自动化决策
- 判断当前任务是否应该继续时
- 进入 Plan、Review、Launch、Scale 前

## Idea Gate

| Item | 内容 |
|---|---|
| Goal | 判断问题是否真实、值得投入 |
| Inputs | 问题陈述、目标用户、替代方案、已有证据 |
| Output Artifact | Idea Validation Artifact |
| Human checkpoint | build / refine / reject |
| Continue condition | 问题真实、目标用户具体、至少有基本证据 |
| Rollback option | 回到问题陈述、缩小用户范围、放弃方向 |
| Common failure | 没验证问题就开始写代码 |

## MVP Gate

| Item | 内容 |
|---|---|
| Goal | 控制范围，只验证一个核心假设 |
| Inputs | Idea Validation Artifact、约束、初步技术判断 |
| Output Artifact | MVP Scope Artifact |
| Human checkpoint | implement / narrow / redesign / pause |
| Continue condition | In scope / Out of scope 清晰，排除项明确 |
| Rollback option | 缩小范围、换假设、回到 Idea Gate |
| Common failure | 范围不断扩大，什么都想做 |

## Implementation Gate

| Item | 内容 |
|---|---|
| Goal | 在明确边界下进入实现 |
| Inputs | MVP Scope Artifact、Issue、架构和边界文档 |
| Output Artifact | Plan Artifact + Implementation Report |
| Human checkpoint | approve plan / revise plan / reject plan |
| Continue condition | Allowed Files、测试策略、回退方案明确 |
| Rollback option | 修改计划、缩小范围、回到 MVP Gate |
| Common failure | 跳过 Plan Artifact 直接开始实现 |

## Review Gate

| Item | 内容 |
|---|---|
| Goal | 合并前审查代码、测试、边界和风险 |
| Inputs | PR、git diff、测试结果、Implementation Report |
| Output Artifact | Review Artifact |
| Human checkpoint | merge / request changes / rollback / abandon |
| Continue condition | 测试通过、无越权修改、风险可解释、可回退 |
| Rollback option | request changes、rollback、放弃本轮修改 |
| Common failure | CI 失败仍想 merge，或只看“能跑” |

## Launch Gate

| Item | 内容 |
|---|---|
| Goal | 判断是否适合给真实用户 |
| Inputs | Review Artifact、发布目标、指标、反馈渠道 |
| Output Artifact | Launch Review Artifact |
| Human checkpoint | release / private beta / delay / rollback |
| Continue condition | 指标已定义、反馈渠道已建立、回退方案明确 |
| Rollback option | 延迟发布、缩小范围、执行回退 |
| Common failure | 指标未定义就发布，把热闹当需求 |

## Scale Gate

| Item | 内容 |
|---|---|
| Goal | 决定哪些重复流程值得固化为 Skill / Script / CI / Docs |
| Inputs | 复盘记录、重复操作、当前痛点 |
| Output Artifact | Scale Automation Review Artifact |
| Human checkpoint | automate / keep manual / observe more |
| Continue condition | 流程已重复验证，风险可控，回退方式存在 |
| Rollback option | 回到手动流程、暂停自动化、增加人工审查点 |
| Common failure | 盲目自动化需要人判断的步骤 |

## Minimal Checklist

- 当前任务属于哪个 Gate
- 当前 Gate 的输出 Artifact 是什么
- 人工决策点是什么
- 继续条件是否满足
- 回退方案是否存在

## Common Stop Conditions

- 问题还没验证，却想直接实现
- MVP 范围不断膨胀
- Plan 未批准，却想写代码
- 测试失败，却想继续推进
- CI 未通过，却想 merge
- 指标未定义，却想 release
- 流程未验证，却想自动化

## Rollback Summary

- Idea Gate：回到问题定义
- MVP Gate：缩小范围或换假设
- Implementation Gate：改计划、缩小改动、撤回实现
- Review Gate：request changes 或 rollback
- Launch Gate：delay、beta、rollback
- Scale Gate：回退到手动流程
