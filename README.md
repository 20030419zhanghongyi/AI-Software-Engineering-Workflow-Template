# AI Software Engineering Workflow Template for Solo Developers

> 面向个人开发者的 AI 辅助软件工程工作流模板仓库。

> 本项目的目标不是让 AI 写更多代码，而是让 AI 在明确边界和质量规则下写出更可维护的代码。

---

## What is this?

这是一个面向个人开发者的轻量级 AI 辅助软件工程工作流模板仓库。

它不是具体业务项目，不是 React/Vue/Electron 应用，不是后端服务，不是 CLI 工具，也不是全自动 Agent 平台。

它是一套轻量软件工程流程模板，帮助个人开发者在使用 Cursor、Codex、Claude Code、GitHub Copilot 等 AI coding 工具时，仍然能够保留需求管理、架构设计、模块边界、编码规范、测试门禁、代码审查、发布和复盘等基本工程控制能力。

一句话概括：

```text
仓库管状态，AI 管执行，CI 管质量，人管决策。
```

---

## Why this project exists

很多个人开发者现在可以借助 AI coding 工具快速搭建原型、实现功能、修复 bug。但是，AI coding 带来的问题也很明显：

```text
AI 很擅长快速生成代码，
但如果没有明确的需求、架构、模块边界、编码规范和测试门禁，
它会不断做局部最优修改，
最后项目很容易变成维护性极差的"史山代码"。
```

常见问题：

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

本项目要解决的不是"怎么换一个更强的 AI"，而是：

```text
个人开发者如何用轻量软件工程流程约束 AI coding，
让 AI 写出来的代码更可维护、更可审查、更可演进。
```

---

## Core philosophy

```text
1. 不是让 AI 替代软件工程流程，而是让 AI 遵守软件工程流程。
2. 不是让 AI 多写代码，而是让 AI 写可维护代码。
3. 不是追求全自动，而是追求可控。
4. 不是把人排除在外，而是让人在关键节点做决策。
5. 不是把多 Agent 当核心，而是把多 Agent 作为执行层增强能力。
6. 仓库是事实中心，聊天不是事实中心。
7. CI 是质量底线，人工审查是最终门禁。
8. 所有重要技术决策都应该能被追溯。
9. 每个 AI coding 任务都应该有边界、计划、检查和验收。
10. 项目能跑只是最低要求，项目可维护才是目标。
```

---

## Problems this template solves

本项目要把 AI coding 从：

```text
模糊想法 → AI 直接写代码 → 能跑但越来越乱 → 后期无法维护
```

转变为：

```text
需求记录 → 技术方案 → 模块边界 → Issue 任务 → AI 按规则执行
→ 测试和 CI 检查 → PR 审查 → 人工合并 → 发布和复盘
```

关注的不是 AI coding 的"生成速度"，而是 AI coding 的"工程可控性"。

---

## Who should use this

```text
1. 个人开发者 / 独立开发者
2. AI coding 工具重度用户
3. 使用 Cursor / Codex / Claude Code / GitHub Copilot 做项目的人
4. 正在做个人桌面应用、小工具、Web 应用、AI 应用的人
5. 想提升工程能力但缺少大厂软件工程经验的人
6. 想让 AI coding 更可维护、更可审查、更可演进的人
```

---

## Who should not use this

```text
1. 已经有成熟工程团队和完整 DevOps 流程的大型组织
2. 追求完全自动化无人干预的 Agent 平台
3. 只想临时生成一次性脚本的人
4. 不希望写任何文档、不希望做任何审查的人
```

---

## Repository structure

```text
.
├── README.md                              # 项目入口说明（本文件）
├── AGENTS.md                              # AI coding 工具总规则
├── LICENSE                                # MIT License
├── .gitignore                             # Git 忽略规则
│
├── docs/                                  # 项目工程文档
│   ├── 00_project_brief.md               # 项目简介
│   ├── 01_requirements.md                # 需求文档
│   ├── 02_tech_research.md               # 技术调研
│   ├── 03_tech_selection.md              # 技术选型
│   ├── 04_architecture.md                # 架构设计
│   ├── 05_module_boundaries.md           # 模块边界
│   ├── 06_coding_standards.md            # 编码规范
│   ├── 07_testing_strategy.md            # 测试策略
│   ├── 08_release_process.md             # 发布流程
│   ├── 09_decision_log.md                # 技术决策记录
│   └── 10_retrospective.md               # 项目复盘
│
├── .ai/                                   # AI 工作流核心目录
│   ├── README.md                          # .ai/ 说明
│   ├── prompts/                           # Prompt 模板
│   │   ├── SUPERVISOR_SYSTEM_PROMPT.md   # 监督 Agent 系统 Prompt
│   │   ├── CHILD_AGENT_TASK_TEMPLATE.md  # 子 Agent 任务卡
│   │   ├── CHECKPOINT_REPORT_TEMPLATE.md # 检查点报告
│   │   ├── HUMAN_BRIEF_TEMPLATE.md       # Human Brief 模板
│   │   └── FEEDBACK_TRANSLATION_TEMPLATE.md # 反馈转译模板
│   ├── protocols/                         # 流程协议
│   │   ├── WORKFLOW_PROTOCOL.md          # 工作流协议
│   │   ├── FEEDBACK_PROTOCOL.md          # 反馈协议
│   │   ├── FILE_BOUNDARY_RULES.md        # 文件边界规则
│   │   ├── STOP_CONDITIONS.md            # 停止条件
│   │   └── MERGE_PROTOCOL.md             # 合并协议
│   └── examples/                          # 示例文档
│       ├── example_project_brief.md
│       ├── example_ai_coding_task.md
│       ├── example_checkpoint_report.md
│       ├── example_human_brief.md
│       └── example_integration_review.md
│
├── .ai-runs/                              # AI coding 过程记录
│   └── README.md
│
├── .github/                               # GitHub 模板
│   ├── ISSUE_TEMPLATE/                    # Issue 模板
│   │   ├── feature_request.md
│   │   ├── bug_report.md
│   │   ├── ai_coding_task.md
│   │   ├── technical_debt.md
│   │   └── research_spike.md
│   ├── pull_request_template.md           # PR 模板
│   └── workflows/
│       └── ci.yml                         # CI 质量门禁
│
├── .cursor/                               # Cursor 规则
│   └── rules/
│       ├── project-rules.mdc
│       ├── architecture-rules.mdc
│       └── ai-coding-rules.mdc
│
├── .claude/                               # Claude Code 配置
│   ├── agents/                            # Agent 定义
│   │   ├── supervisor-agent.md
│   │   ├── ui-agent.md
│   │   ├── logic-agent.md
│   │   ├── test-agent.md
│   │   └── docs-agent.md
│   └── commands/                          # 自定义命令
│       ├── plan.md
│       ├── checkpoint.md
│       ├── review.md
│       └── summarize.md
│
└── scripts/                               # 辅助脚本
    ├── README.md
    ├── init-run.ps1
    ├── collect-agent-state.ps1
    └── create-worktrees.ps1
```

---

## V0 workflow

V0 是最小可用版本，目标是建立一套手动但完整的流程。不追求自动化，而是追求流程清晰。

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

把要做的功能写成 Issue。Issue 中必须包含：目标、背景、允许修改文件、禁止修改文件、验收标准、测试要求。

### Step 4：让 AI 先读规则

要求 AI 先阅读 AGENTS.md、项目文档、当前 Issue。

### Step 5：AI 先输出计划

AI 不应直接改代码，先输出任务理解、计划修改文件、实现步骤、风险。

### Step 6：人工确认计划

用户确认后才允许 AI 修改代码。

### Step 7：AI 小步执行

每次修改应尽量小，避免一次性大改多个模块。

### Step 8：运行检查

至少运行：构建、测试、lint / typecheck。

### Step 9：创建 PR 或检查 diff

合并前必须查看：改了哪些文件、是否越权、是否无关重构、是否引入新依赖、是否破坏模块边界、测试是否通过。

### Step 10：合并或返工

用户决定：合并、小修、返工、回滚、或放弃本轮修改。

---

## AI coding workflow

每个 AI coding 任务都应遵循：

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

核心原则：

```text
AI 不能直接从模糊需求跳到代码。
```

---

## Human-in-the-loop principle

子 Agent 的输出不应该原样丢给用户。监督 Agent 必须把复杂反馈整理成 Human Brief。

Human Brief 应回答：

1. 当前发生了什么？
2. 有没有偏离目标？
3. 有没有风险？
4. 是哪个 Agent 的问题？
5. 用户需要重点看哪里？
6. 用户现在有哪些选择？
7. 监督 Agent 的建议是什么？
8. 如果用户同意，下一步会发什么指令？

Human Brief 是面向人的决策卡片，不是日志。

用户可以随时说：继续、小修后继续、方向不对、交互不对、不要修改这个文件、缩小范围、让某个 Agent 停止/返工、重新设计方案。

监督 Agent 必须把这些自然语言反馈转成工程约束。

---

## Multi-agent workflow as an optional execution layer

多 Agent 不是本项目本体，而是执行层的一种增强模式。

基础模式：

```text
一个 AI coding 工具 → 按 Issue 和 AGENTS.md 执行 → 通过测试和 PR 审查
```

增强模式：

```text
顶层监督 Agent → 拆分任务 → 子 Agent 各自执行
→ 检查点暂停 → Human Brief → 用户反馈 → 修正 → 合并前审查
```

软件工程流程是地基，多 Agent 是执行方式。不能反过来。

---

## Recommended tools

```text
GitHub Template Repository    # 模板仓库
GitHub Issues                 # 任务管理
GitHub Pull Requests          # 代码审查入口
GitHub Actions                # 质量门禁
AGENTS.md                     # AI coding 总规则
.cursor/rules/                # Cursor 规则
.claude/                      # Claude Code 配置
ChatGPT                       # 顶层监督 Agent
Codex / Claude Code / Cursor  # 执行层 AI coding 工具
Cursor / VS Code              # 人工审查与修改
Git branch / Git worktree     # 隔离开发
Markdown                      # 文档和过程记录
```

---

## Quick start

1. 点击仓库页面的 **Use this template** 按钮，创建你自己的仓库。
2. Clone 到本地。
3. 填写 `docs/00_project_brief.md`，描述你要做的项目。
4. 按需填写 `docs/01_requirements.md` 到 `docs/08_release_process.md`。
5. 根据项目实际情况调整 `docs/05_module_boundaries.md` 和 `docs/06_coding_standards.md`。
6. 确认 `AGENTS.md` 内容符合你的项目规则。
7. 开始创建 Issue，让 AI coding 工具按规则执行。

---

## How to use this template for a new project

1. **Use this template** 创建新仓库。
2. 用你自己的项目信息替换 `docs/00_project_brief.md` 中的模板内容。
3. 依次完成 `docs/01_requirements.md` 到 `docs/08_release_process.md` 的填写。
4. 在 `docs/05_module_boundaries.md` 中明确定义你的项目模块边界。
5. 在 `docs/06_coding_standards.md` 中定义编码规范。
6. 根据技术栈修改 `AGENTS.md` 中的规则。
7. 根据技术栈调整 `.github/workflows/ci.yml` 中的 CI 命令。
8. 删除 `docs/10_retrospective.md` 中的模板示例（等项目阶段结束后再复盘填写）。
9. 开始用 Issue + AI coding 流程开发。

---

## Roadmap

### V0 — 当前版本

手动但完整的流程。文档、模板、规则全部就位，流程靠人执行。

### V1 — 脚本辅助

- init-run.ps1：初始化一次 AI coding 任务
- create-worktrees.ps1：创建多个 worktree
- collect-agent-state.ps1：自动收集 git diff、测试日志
- supervisor-context.md：自动生成给监督 Agent 的上下文
- Claude Code hooks：自动记录事件、检查越权修改

### V2 — 更强自动化

- Playwright 截图测试
- 更完整的 CI
- 本地 Dashboard
- 自动 Human Brief 生成

---

## License

MIT License. See [LICENSE](./LICENSE).
