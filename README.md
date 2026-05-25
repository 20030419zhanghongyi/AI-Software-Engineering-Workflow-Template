# AI Software Engineering Workflow Template for Solo Developers

> 面向个人开发者的 AI 辅助软件工程工作流模板仓库。

```text
仓库管状态，AI 管执行，CI 管质量，人管决策。
Stage Gates 管方向，Artifacts 管证据，Rollback 管风险。
AI 压缩的是执行成本，不是判断成本。
```

## What Is This?

这是一个给个人开发者使用的 AI vibecoding 基础设施模板。

它不是业务应用，也不是自动化 Agent 平台。它提供的是：

- GitHub 事实中心
- v0.1 软件工程主流程
- v0.2 Stage Gates、Artifacts、Human Gate、Rollback
- 给 Claude Code、Codex、Cursor、Antigravity 使用的轻量规则和模板

## Who Is This For?

适合这些人：

- 个人开发者 / 独立开发者
- 高频使用 AI coding 工具的人
- 想保留最基本工程控制能力的人
- 想让项目更可维护，而不只是“先跑起来”的人

不适合这些人：

- 追求全自动无人值守 Agent 平台的人
- 不愿意保留 Human Review 和 CI 的人
- 只想临时生成一次性脚本的人

## Quick Start In 5 Minutes

1. 用这个模板创建你的仓库。
2. 先读 `README.md`、`AGENTS.md`、`AI_WORKFLOW.md`。
3. 填写 `docs/00_project_brief.md`。
4. 开一个 GitHub Issue，说明目标、边界、验收标准、Allowed Files、Forbidden Files。
5. 让 AI 先生成 Plan Artifact。
6. 人工确认计划后，再让 AI 实现、测试、提交 PR、过 CI、人工决定 merge。

## Read These Files First

普通用户和普通 AI 任务默认先读：

1. `README.md`
2. `AGENTS.md`
3. `AI_WORKFLOW.md`
4. 当前 Issue / 当前任务
5. 当前直接相关文件

如涉及工具角色或权限边界，再读：

6. `TOOLCHAIN.md`

## Ignore These Files At First

第一天通常不用默认读：

- 整个 `docs/`
- 整个 `.ai/`
- 全部 Skills
- 全部 Artifact 模板
- `docs/11-13` 之外的高级参考文档

按需再读：

- `docs/00-10`：当你开始沉淀项目需求、架构、边界、测试策略时
- `docs/11-13`：当任务涉及 Stage Gate、工具边界、Human Gate、Rollback 时
- `.ai/artifacts/`：当需要生成对应 Artifact 时
- `.claude/skills/`、`.agents/skills/`：当你明确要调用某个 Skill 时

## Minimal Workflow

```text
Issue / task
→ AI reads README.md + AGENTS.md + AI_WORKFLOW.md + current task
→ AI outputs Plan Artifact
→ Human approves plan
→ AI implements in small steps
→ Tests / CI
→ Human reviews diff and risk
→ merge or rework
```

这是默认工作流。没有通过 Plan 和 Human Review，不进入实现。

## Full Workflow

```text
Idea Gate
→ MVP Gate
→ Implementation Gate
→ Review Gate
→ Launch Gate
→ Scale Gate

并行执行层：
需求 → 方案 → 架构 → 模块边界 → Issue → Plan → 实现 → 测试 → PR → CI → Review → Merge → Release → Retrospective
```

说明：

- Stage Gates 管方向
- 软件工程流程管执行质量
- GitHub 是事实中心
- 人负责最终判断

## Daily AI Coding Workflow

日常任务建议这样跑：

1. 在 Issue 里写清目标、边界、验收标准、测试要求。
2. 让 AI 只读取最少必要文件。
3. 让 AI 先给 Plan Artifact，不要直接写代码。
4. 人工确认后再进入实现。
5. AI 修改完成后输出变更摘要、测试结果、风险和回退方案。
6. 在 PR 和 CI 基础上做最终人工决策。

## How To Use This For A New Vibecoding Project

1. 用 GitHub Template 创建新仓库。
2. 填 `docs/00_project_brief.md`，先说明做什么和不做什么。
3. 随项目推进再逐步填 `docs/01-10`。
4. 根据你的技术栈调整 `AGENTS.md`、`TOOLCHAIN.md`、CI、Cursor 规则。
5. 用 Issue 驱动任务，不要靠聊天记录当事实中心。
6. 用 Artifact 记录关键阶段证据，而不是只留在会话里。

## Repository Structure

```text
.
├── README.md
├── AGENTS.md
├── AI_WORKFLOW.md
├── TOOLCHAIN.md
├── docs/
│   ├── 00-10              # v0.1 软件工程主流程
│   ├── 11_stage_gates.md
│   ├── 12_toolchain_and_antigravity.md
│   └── 13_human_gate_and_rollback.md
├── .ai/
│   ├── artifacts/         # Artifact 模板
│   ├── protocols/         # 执行协议
│   ├── prompts/           # Prompt 模板
│   └── examples/          # 示例
├── .claude/skills/        # Claude Code Skills
├── .agents/skills/        # Codex Skills
└── .github/               # Issue / PR / CI
```

## Where To Go Next

- 想看默认执行规则：`AGENTS.md`
- 想看主流程：`AI_WORKFLOW.md`
- 想看工具职责：`TOOLCHAIN.md`
- 想看 Stage Gates：`docs/11_stage_gates.md`
- 想看工具与 Antigravity 边界：`docs/12_toolchain_and_antigravity.md`
- 想看 Human Gate 与 Rollback：`docs/13_human_gate_and_rollback.md`

## License

MIT License. See `LICENSE`.
