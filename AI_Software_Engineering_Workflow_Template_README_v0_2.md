> **说明：本文档是项目设计过程笔记，保留了从初始想法到 README v0.2 成型过程中的完整设计脉络。正式项目说明请阅读 [README.md](./README.md)。如果你只是想使用本模板仓库，可以忽略本文档。**

# AI Software Engineering Workflow Template for Solo Developers

> 面向个人开发者的 AI 辅助软件工程工作流模板仓库。  
> 目标不是让 AI 写更多代码，而是让 AI 在明确需求、架构边界、质量门禁和人工决策机制下，写出更可维护的软件。

---

## 1. 项目定位

本项目是一个面向个人开发者的轻量级 AI 软件工程工作流模板仓库。

它不是一个具体业务项目，也不是一个复杂的自动化 Agent 平台。

它的目标是把成熟软件工业中的关键流程压缩成个人开发者可以执行的轻量版本，并与 Cursor、Codex、Claude Code、GitHub Copilot 等 AI coding 工具结合，让个人开发者在使用 AI 快速开发项目时，仍然能够保留需求管理、架构设计、模块边界、编码规范、测试门禁、代码审查、发布和复盘等基本工程控制能力。

一句话概括：

```text
仓库管状态，AI 管执行，CI 管质量，人管决策。
```

---

## 2. 项目背景

很多个人开发者现在已经可以借助 AI coding 工具快速搭建原型、实现功能、修复 bug，甚至完成完整的小工具、桌面应用、Web 应用或科研 demo。

但是，AI coding 带来的问题也非常明显：

```text
AI 很擅长快速生成代码，
但如果没有明确的需求、架构、模块边界、编码规范和测试门禁，
它会不断做局部最优修改，
最后项目很容易变成维护性极差的“史山代码”。
```

常见问题包括：

```text
1. 一开始项目能跑，但后期越来越难改。
2. 需求稍微变复杂，AI 就开始到处乱改。
3. 代码模块边界不清晰，业务逻辑、UI、数据处理混在一起。
4. 文件越来越大，函数越来越长，重复代码越来越多。
5. AI 为了完成功能，会引入不必要的依赖或复杂设计。
6. 没有测试保护，改一个功能就可能破坏另一个功能。
7. 没有技术决策记录，后面自己也忘了为什么这么设计。
8. 没有 PR 审查流程，代码是否可维护只能靠感觉。
9. 项目越往后，AI 越难准确理解上下文，修改质量越来越差。
10. 个人开发者一个人同时做产品、架构、开发、测试、发布，很容易失控。
```

因此，这个项目要解决的不是“怎么换一个更强的 AI coding 工具”，而是：

```text
个人开发者如何用轻量软件工程流程约束 AI coding，
让 AI 写出来的代码更可维护、更可审查、更可演进。
```

---

## 3. 核心矛盾

传统软件工业一般包含：

```text
需求调研
需求分析
技术调研
技术选型
架构设计
模块划分
编码规范
任务管理
编码实现
测试
Code Review
CI/CD
发布
复盘和维护
```

这些流程对大团队很重要，但对个人开发者来说，如果完整照搬，会非常重。

另一方面，如果完全没有流程，只是：

```text
我有一个模糊想法
↓
直接让 AI 写代码
↓
能跑就继续加功能
↓
项目越来越乱
↓
后期无法维护
```

也会很快失控。

因此，本项目采用折中方案：

```text
不照搬大厂重流程，
但保留软件工程中最关键的控制点。
```

这些关键控制点包括：

```text
1. 需求写清楚
2. 技术选择有记录
3. 架构边界先定义
4. 模块职责先划分
5. AI coding 有规则
6. 任务用 Issue 管理
7. 代码通过 PR 审查
8. 测试和 CI 作为质量门禁
9. 发布有版本记录
10. 项目结束后复盘
```

---

## 4. 核心理念

本项目的核心理念是：

```text
仓库管状态，AI 管执行，CI 管质量，人管决策。
```

具体解释如下：

### 4.1 仓库管状态

GitHub Repository 是项目的事实中心。

项目中的关键状态不应该散落在聊天记录、临时文件或个人脑子里，而应该尽可能沉淀到仓库中。

仓库应保存：

```text
1. 项目目标
2. 需求文档
3. 技术选型
4. 架构设计
5. 模块边界
6. 编码规范
7. AI 使用规则
8. Issue 任务
9. PR 审查记录
10. CI 结果
11. 发布记录
12. 复盘文档
```

### 4.2 AI 管执行

AI coding 工具主要负责执行任务，例如：

```text
1. 根据 Issue 实现功能
2. 修复 bug
3. 补充测试
4. 重构局部代码
5. 编写文档
6. 生成脚手架
7. 辅助排查报错
```

但 AI 不应该自由发挥。

AI 必须像实习开发一样：

```text
先看需求
再看架构
遵守模块边界
按 Issue 做任务
遵守编码规范
不能擅自大改
必须通过测试
必须接受审查
```

### 4.3 CI 管质量

CI 不负责产品决策，但负责最基本的质量门禁。

例如：

```text
1. 代码能否安装依赖
2. 是否通过 lint
3. 是否通过 type check
4. 是否通过单元测试
5. 是否能够 build
6. 是否存在明显格式问题
```

CI 是防止 AI 生成“看似完成但实际不可用代码”的底线。

### 4.4 人管决策

人类开发者始终是最终 Owner。

人负责：

```text
1. 产品方向
2. 需求取舍
3. 技术取舍
4. 架构决策
5. 是否接受 AI 方案
6. 是否合并 PR
7. 是否发布版本
8. 是否回滚
```

AI 可以建议，但不能替代人做关键决策。

---

## 5. 本项目要解决的问题

本项目要把 AI coding 从：

```text
模糊想法
↓
AI 直接写代码
↓
能跑但越来越乱
↓
后期无法维护
```

转变为：

```text
需求记录
↓
技术方案
↓
模块边界
↓
Issue 任务
↓
AI 按规则执行
↓
测试和 CI 检查
↓
PR 审查
↓
人工合并
↓
发布和复盘
```

也就是说，本项目关注的不是 AI coding 的“生成速度”，而是 AI coding 的“工程可控性”。

---

## 6. 项目适合谁

本模板适合：

```text
1. 个人开发者
2. 独立开发者
3. AI 工具重度用户
4. 想用 Cursor / Codex / Claude Code 做项目的人
5. 正在做个人桌面应用、小工具、Web 应用、AI 应用的人
6. 想提升工程能力但缺少大厂软件工程经验的人
7. 想让 AI coding 更可维护、更可审查、更可演进的人
```

本模板不适合：

```text
1. 已经有成熟工程团队和完整 DevOps 流程的大型组织
2. 追求完全自动化无人干预的 Agent 平台
3. 只想临时生成一次性脚本的人
4. 不希望写任何文档、不希望做任何审查的人
```

---

## 7. V0 版本目标

V0 是最小可用版本，目标是先建立一套手动但完整的流程。

V0 不追求自动化，而是追求流程清晰。

V0 要做到：

```text
1. 新项目可以从模板仓库创建。
2. 项目一开始就有需求、架构、规范、AI 规则等文档位置。
3. AI coding 工具知道应该看哪些文件。
4. 开发任务通过 Issue 或任务卡描述。
5. 每个 AI coding 任务都有边界、输入、输出和验收标准。
6. 代码修改通过 PR 或 diff 审查。
7. 合并前至少经过基本测试或构建。
8. 人类开发者始终保留最终决策权。
```

---

## 8. V0 推荐仓库结构

建议模板仓库结构如下：

```text
project-root/
├── README.md
├── AGENTS.md
│
├── docs/
│   ├── 00_project_brief.md
│   ├── 01_requirements.md
│   ├── 02_tech_research.md
│   ├── 03_tech_selection.md
│   ├── 04_architecture.md
│   ├── 05_module_boundaries.md
│   ├── 06_coding_standards.md
│   ├── 07_testing_strategy.md
│   ├── 08_release_process.md
│   └── 09_decision_log.md
│
├── .ai/
│   ├── prompts/
│   │   ├── SUPERVISOR_SYSTEM_PROMPT.md
│   │   ├── CHILD_AGENT_TASK_TEMPLATE.md
│   │   ├── CHECKPOINT_REPORT_TEMPLATE.md
│   │   ├── HUMAN_BRIEF_TEMPLATE.md
│   │   └── FEEDBACK_TRANSLATION_TEMPLATE.md
│   │
│   ├── protocols/
│   │   ├── WORKFLOW_PROTOCOL.md
│   │   ├── FEEDBACK_PROTOCOL.md
│   │   ├── FILE_BOUNDARY_RULES.md
│   │   ├── STOP_CONDITIONS.md
│   │   └── MERGE_PROTOCOL.md
│   │
│   └── examples/
│       ├── example-project-brief.md
│       ├── example-agent-task.md
│       ├── example-checkpoint-report.md
│       └── example-human-brief.md
│
├── .ai-runs/
│   └── README.md
│
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── feature_request.md
│   │   ├── bug_report.md
│   │   ├── ai_coding_task.md
│   │   └── technical_debt.md
│   │
│   ├── pull_request_template.md
│   │
│   └── workflows/
│       └── ci.yml
│
├── .cursor/
│   └── rules/
│       ├── project-rules.mdc
│       ├── architecture-rules.mdc
│       └── ai-coding-rules.mdc
│
├── scripts/
│   └── README.md
│
└── src/
```

说明：

```text
README.md                项目入口说明
AGENTS.md                给 AI coding 工具看的总规则
docs/                    项目工程文档
.ai/                     AI 工作流模板和协议
.ai-runs/                每次 AI 开发任务的过程记录
.github/                 Issue、PR、CI 模板
.cursor/rules/           Cursor 规则
scripts/                 后续自动化脚本
src/                     业务代码
```

---

## 9. 文档体系

### 9.1 Project Brief

`docs/00_project_brief.md`

用于说明：

```text
1. 项目是什么
2. 目标用户是谁
3. 要解决什么问题
4. 核心功能是什么
5. 不做什么
6. 当前阶段目标
```

### 9.2 Requirements

`docs/01_requirements.md`

用于记录：

```text
1. 功能需求
2. 非功能需求
3. 用户场景
4. 约束条件
5. 验收标准
```

### 9.3 Tech Research

`docs/02_tech_research.md`

用于记录：

```text
1. 可选技术方案
2. 每种方案优缺点
3. 学习成本
4. 维护成本
5. 风险
```

### 9.4 Tech Selection

`docs/03_tech_selection.md`

用于记录最终技术选择。

例如：

```text
为什么选择 Electron 而不是 Tauri？
为什么选择 SQLite 而不是 JSON 文件？
为什么选择 React 而不是 Vue？
为什么暂时不引入某个依赖？
```

### 9.5 Architecture

`docs/04_architecture.md`

用于说明：

```text
1. 整体架构
2. 数据流
3. 模块关系
4. 关键技术决策
5. 不允许破坏的架构约束
```

### 9.6 Module Boundaries

`docs/05_module_boundaries.md`

用于规定：

```text
1. 每个模块负责什么
2. 每个模块不负责什么
3. 哪些文件属于 UI
4. 哪些文件属于业务逻辑
5. 哪些文件属于数据层
6. 哪些文件属于平台适配层
```

这是约束 AI coding 最重要的文档之一。

### 9.7 Coding Standards

`docs/06_coding_standards.md`

用于规定：

```text
1. 命名规范
2. 文件组织规范
3. 函数长度建议
4. 注释规范
5. 错误处理规范
6. 依赖引入规则
7. 禁止事项
```

### 9.8 Testing Strategy

`docs/07_testing_strategy.md`

用于说明：

```text
1. 需要哪些测试
2. 哪些部分必须测试
3. 哪些部分可以手动检查
4. 如何运行测试
5. 合并前最低测试要求
```

### 9.9 Release Process

`docs/08_release_process.md`

用于说明：

```text
1. 如何打版本
2. 如何写 CHANGELOG
3. 如何打 tag
4. 如何发布 release
5. 如何回滚
```

### 9.10 Decision Log

`docs/09_decision_log.md`

用于记录重要决策。

格式示例：

```text
日期：
决策：
背景：
备选方案：
选择理由：
风险：
后续观察：
```

这个文件可以避免未来忘记为什么这么设计。

---

## 10. AGENTS.md 的作用

`AGENTS.md` 是给 AI coding 工具看的总规则。

它应该告诉 AI：

```text
1. 项目目标是什么
2. 开发前必须先阅读哪些文档
3. 哪些文件不能随便改
4. 修改代码前要先说明计划
5. 不允许擅自引入依赖
6. 不允许大范围重构
7. 不允许绕过测试
8. 每次修改后要说明改了什么
9. 遇到不确定问题要先问
10. 合并前要通过检查
```

示例：

```markdown
# AGENTS.md

## Required Reading

Before editing code, read:

1. docs/00_project_brief.md
2. docs/04_architecture.md
3. docs/05_module_boundaries.md
4. docs/06_coding_standards.md
5. docs/07_testing_strategy.md

## Core Rules

- Do not make broad refactors unless explicitly requested.
- Do not introduce new dependencies without explaining why.
- Do not modify files outside the task scope.
- Do not change architecture without updating docs/09_decision_log.md.
- Prefer small, reviewable changes.
- Always explain modified files and test results.
- If requirements are unclear, stop and ask.
```

---

## 11. AI coding 任务流程

每个 AI coding 任务都应该遵循：

```text
1. 创建 Issue 或任务卡
2. 明确任务目标
3. 明确允许修改的文件
4. 明确禁止修改的文件
5. 明确验收标准
6. AI 先输出执行计划
7. 人类确认或修改计划
8. AI 小步执行
9. AI 输出变更说明
10. 运行测试或构建
11. 人类审查 diff
12. 合并或返工
```

这套流程的重点是：

```text
AI 不能直接从模糊需求跳到代码。
```

---

## 12. Issue 模板

建议至少包含以下 Issue 类型：

```text
Feature Request
Bug Report
AI Coding Task
Technical Debt
Research / Spike
```

### AI Coding Task 示例字段

```markdown
# AI Coding Task

## Goal

本任务要完成什么？

## Background

为什么要做这个任务？

## Allowed Files

AI 允许修改哪些文件？

## Forbidden Files

AI 不允许修改哪些文件？

## Acceptance Criteria

完成标准是什么？

## Required Checks

合并前必须运行哪些命令？

## Notes for AI

需要特别提醒 AI 的事项。
```

---

## 13. PR 模板

PR 模板用于防止 AI 或人类开发者把代码直接合并。

推荐字段：

```markdown
# Pull Request

## Summary

本 PR 做了什么？

## Related Issue

关联哪个 Issue？

## Changed Files

主要修改了哪些文件？

## Architecture Impact

是否影响架构？

## Module Boundary Check

是否修改了任务范围外的文件？

## Tests

运行了哪些测试？

## Screenshots

如果是 UI 改动，提供截图。

## Risk

可能有什么风险？

## Rollback Plan

如果出问题如何回滚？

## Human Review Checklist

- [ ] 功能符合需求
- [ ] 没有越权修改
- [ ] 没有无关重构
- [ ] 没有引入不必要依赖
- [ ] 测试通过
- [ ] 文档已更新
```

---

## 14. CI 质量门禁

V0 推荐最基础的 CI。

根据项目类型不同，CI 可以包括：

```text
Node / Web / Electron 项目：
- npm install
- npm run lint
- npm run typecheck
- npm run test
- npm run build

Python 项目：
- pip install
- ruff / flake8
- mypy
- pytest

通用项目：
- 检查 Markdown 链接
- 检查格式
- 检查是否有敏感文件
```

V0 不要求 CI 很复杂，但至少要有：

```text
能否安装
能否构建
能否通过基本测试
```

---

## 15. 多 Agent 工作流在本项目中的位置

多 Agent 不是本项目的本体，而是本项目在执行层的一种增强模式。

基础模式是：

```text
一个 AI coding 工具
↓
按照 Issue 和 AGENTS.md 执行
↓
通过测试和 PR 审查
```

增强模式是：

```text
顶层监督 Agent
↓
拆分任务
↓
UI Agent / Logic Agent / Test Agent / Docs Agent 各自执行
↓
检查点暂停
↓
Human Brief
↓
用户反馈
↓
修正
↓
合并前审查
```

也就是说：

```text
软件工程流程是地基，
多 Agent 是执行方式。
```

不能反过来。

---

## 16. 顶层监督 Agent

顶层监督 Agent 的职责是：

```text
1. 理解用户需求
2. 判断任务是否适合多 Agent
3. 拆分子任务
4. 定义每个子 Agent 的边界
5. 审查子 Agent 的执行计划
6. 审查子 Agent 的检查点报告
7. 识别风险、越权、范围扩大和合并冲突
8. 把复杂反馈整理成 Human Brief
9. 提醒用户需要重点关注的地方
10. 接收用户反馈
11. 把用户反馈转成新的工程约束
12. 给子 Agent 下发修正 Prompt
13. 合并前给出审查建议
```

它不是编码 Agent。

它的核心职责是：

```text
让整个 AI coding 过程可控、可检查、可归因、可回滚。
```

---

## 17. 子 Agent

常见子 Agent 包括：

```text
UI Agent       负责界面、布局、样式、交互
Logic Agent    负责状态管理、业务逻辑、数据流
Backend Agent  负责接口、数据库、服务层
Test Agent     负责测试、构建、lint、回归检查
Docs Agent     负责 README、CHANGELOG、使用文档
Review Agent   负责局部代码审查和风险提示
```

子 Agent 必须遵守：

```text
1. 只做被分配的任务
2. 只修改允许文件
3. 不擅自扩大任务范围
4. 不做无关重构
5. 先提交计划，再修改代码
6. 到达检查点必须暂停
7. 遇到不确定问题必须请求决策
8. 完成后必须输出变更摘要和测试结果
```

---

## 18. 检查点机制

检查点是防止多 Agent 工作流失控的核心机制。

推荐检查点：

```text
Checkpoint 0：任务理解
Checkpoint 1：执行计划
Checkpoint 2：首轮代码改动
Checkpoint 3：测试或构建结果
Checkpoint 4：UI / 交互产物
Checkpoint 5：最终总结
```

检查点的意义是：

```text
不要让 AI 一口气干到底。
让 AI 小步执行，每一步都可以被检查、纠偏和回滚。
```

---

## 19. Human Brief 机制

子 Agent 的输出不应该原样丢给用户。

顶层监督 Agent 必须把子 Agent 的复杂反馈整理成 Human Brief。

Human Brief 应回答：

```text
1. 当前发生了什么？
2. 有没有偏离目标？
3. 有没有风险？
4. 是哪个 Agent 的问题？
5. 用户需要重点看哪里？
6. 用户现在有哪些选择？
7. 监督 Agent 的建议是什么？
8. 如果用户同意，下一步会发什么指令？
```

Human Brief 是面向人的决策卡片，不是日志。

---

## 20. 用户反馈入口

每个检查点必须保留用户反馈入口。

用户可以随时说：

```text
继续
小修后继续
这个方向不对
这个交互不对
不要修改这个文件
缩小任务范围
让某个 Agent 停止
让某个 Agent 返工
重新设计方案
```

顶层监督 Agent 必须把这些自然语言反馈转成工程约束。

例如，用户说：

```text
这个按钮不要放主界面，太打扰了。
```

应被转成：

```text
1. 移除主界面按钮。
2. 将入口移动到设置页。
3. 主界面只保留状态提示。
4. 不要修改状态管理逻辑。
5. 只允许修改指定 UI 文件。
6. 完成后输出截图和交互路径说明。
```

---

## 21. 文件边界原则

文件边界是 AI coding 的核心安全机制。

推荐原则：

```text
1. 一个 Agent 不应拥有整个项目的自由修改权。
2. UI Agent 不应随意改状态管理。
3. Logic Agent 不应随意改 UI 样式。
4. Test Agent 不应重构业务代码。
5. Docs Agent 不应修改源码。
6. 任何 Agent 想修改 forbidden files，必须暂停。
7. 多个 Agent 不应同时修改同一核心文件。
```

---

## 22. 停止条件

出现以下情况时，必须暂停：

```text
1. AI 试图修改禁止文件。
2. AI 擅自扩大任务范围。
3. AI 修改核心架构。
4. AI 引入新依赖但未说明理由。
5. 测试失败但 AI 想继续扩展功能。
6. UI / 交互结果偏离用户预期。
7. 多个 Agent 修改同一核心文件。
8. 输出不完整，无法判断风险。
9. 合并前存在未解决冲突。
10. 发布前未通过基本构建或测试。
```

暂停不是失败，而是为了防止错误继续扩大。

---

## 23. 推荐工具栈

V0 推荐工具：

```text
GitHub Template Repository：模板仓库
GitHub Issues：任务管理
GitHub Pull Requests：代码审查入口
GitHub Actions：质量门禁
AGENTS.md：AI coding 总规则
.cursor/rules/：Cursor 规则
ChatGPT：顶层监督 Agent
Codex / Claude Code / Cursor：执行层 AI coding 工具
Cursor / VS Code：人工审查与修改
Git branch / Git worktree：隔离开发
Markdown：文档和过程记录
```

V0 不强制自动化。

V1 可以进一步加入：

```text
PowerShell 脚本
Windows Terminal 多 pane
自动创建 worktree
自动收集 diff / logs
Claude Code hooks
Playwright 截图测试
本地 Dashboard
```

---

## 24. V0 实际使用流程

### Step 1：从模板仓库创建新项目

使用 GitHub Template Repository 创建新仓库。

### Step 2：填写项目基础文档

至少填写：

```text
docs/00_project_brief.md
docs/01_requirements.md
docs/03_tech_selection.md
docs/04_architecture.md
docs/05_module_boundaries.md
docs/06_coding_standards.md
docs/07_testing_strategy.md
AGENTS.md
```

### Step 3：创建 Issue

把要做的功能写成 Issue。

Issue 中必须包含：

```text
目标
背景
允许修改文件
禁止修改文件
验收标准
测试要求
```

### Step 4：让 AI 先读规则

在 Codex / Claude Code / Cursor 中要求 AI 先阅读：

```text
AGENTS.md
docs/00_project_brief.md
docs/04_architecture.md
docs/05_module_boundaries.md
docs/06_coding_standards.md
docs/07_testing_strategy.md
当前 Issue
```

### Step 5：AI 先输出计划

AI 不应直接改代码。

它应先输出：

```text
任务理解
计划修改文件
实现步骤
风险
是否需要确认
```

### Step 6：人工确认计划

用户确认后再允许 AI 修改代码。

### Step 7：AI 小步执行

每次修改应尽量小。

避免一次性大改多个模块。

### Step 8：运行检查

至少运行：

```text
构建
测试
lint / typecheck
```

根据项目实际情况调整。

### Step 9：创建 PR 或检查 diff

合并前必须查看：

```text
改了哪些文件
是否越权
是否无关重构
是否引入新依赖
是否破坏模块边界
测试是否通过
```

### Step 10：合并或返工

用户决定：

```text
合并
小修
返工
回滚
放弃本轮修改
```

---

## 25. V0 成功标准

V0 成功不等于自动化程度高。

V0 成功的标准是：

```text
1. 新项目有清晰工程文档入口。
2. AI coding 前必须先读规则。
3. 每个任务都有明确边界。
4. AI 不再从模糊需求直接写代码。
5. 合并前有人类审查。
6. 基本测试和构建成为门禁。
7. 技术决策可以追溯。
8. 文件边界能约束 AI 行为。
9. 多 Agent 任务可以被检查点控制。
10. 项目后期仍然可维护。
```

---

## 26. V0 的局限

V0 仍然是手动流程。

局限包括：

```text
1. 需要手动复制 Prompt。
2. 需要手动收集 AI 输出。
3. 需要手动维护文档。
4. 检查点依赖 AI 自觉暂停。
5. 监督 Agent 不能实时读取终端状态。
6. CI 只能检查基础质量，不能判断产品体验。
```

因此 V0 不追求完美。

它的目标是：

```text
先建立正确的软件工程习惯，
再逐步自动化重复步骤。
```

---

## 27. V1 升级方向

当 V0 跑通后，可以考虑 V1。

V1 可以加入：

```text
1. init-run.ps1：初始化一次 AI coding 任务
2. create-worktrees.ps1：自动创建多个 worktree
3. start-agents.ps1：打开多个终端或 Agent 工位
4. collect-agent-state.ps1：自动收集 git diff、测试日志、Agent 报告
5. supervisor-context.md：自动生成给监督 Agent 的上下文
6. Claude Code hooks：自动记录事件、检查越权修改
7. Playwright：自动截图，用于 UI Review
8. GitHub Actions：更完整的 CI
```

V1 的目标是：

```text
减少手动搬运信息，
但仍然保留人工决策入口。
```

---

## 28. 最重要的原则

本项目最重要的原则：

```text
1. 不是让 AI 替代软件工程流程，而是让 AI 遵守软件工程流程。
2. 不是让 AI 多写代码，而是让 AI 写可维护代码。
3. 不是追求全自动，而是追求可控。
4. 不是把人排除在外，而是让人在关键节点做决策。
5. 不是把多 Agent 当核心，而是把多 Agent 作为执行层能力。
6. 仓库是事实中心，聊天不是事实中心。
7. CI 是质量底线，人工审查是最终门禁。
8. 所有重要技术决策都应该能被追溯。
9. 每个 AI 任务都应该有边界、计划、检查和验收。
10. 项目能跑只是最低要求，项目可维护才是目标。
```

---

## 29. README 摘要

可以将以下内容作为 README 开头摘要：

```text
AI Software Engineering Workflow Template for Solo Developers 是一个面向个人开发者的 AI 辅助软件工程工作流模板仓库。它不是一个具体业务项目，也不是一个全自动 Agent 平台，而是尝试把成熟软件工业中的需求分析、技术选型、架构设计、模块划分、编码规范、Issue、PR、测试、CI、发布和复盘等关键流程，压缩成个人开发者可以执行的轻量版本。

本项目的核心理念是：仓库管状态，AI 管执行，CI 管质量，人管决策。它希望解决的问题不是“怎么让 AI 写更多代码”，而是“怎么让 AI 在明确边界和质量规则下写出更可维护的代码”。
```

---

## 30. 下一步

建议下一步准备：

```text
1. 给 Codex / Claude Code 的建库 Prompt
2. AGENTS.md 模板
3. docs/ 文档模板
4. Issue 模板
5. PR 模板
6. GitHub Actions 基础 CI 模板
7. Cursor rules 模板
8. Supervisor Agent Prompt
9. Child Agent Task Template
10. 一个示例项目任务流程
```

V0 的第一目标不是炫酷，而是建立一套个人开发者真正能坚持使用的轻量工程流程。
