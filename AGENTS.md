# AGENTS.md

> 本文件是给 Codex、Claude Code、Cursor Agent、GitHub Copilot 等 AI coding 工具看的总规则。

## 1. Scope

本仓库是一个面向个人开发者的 AI 辅助软件工程工作流模板仓库。

- 不是具体业务项目
- 不要引入业务应用代码
- 不要把它改造成自动化平台
- GitHub 仍然是事实中心

## 2. Default Reading Order

AI 默认先读：

1. `README.md`
2. `AGENTS.md`
3. `AI_WORKFLOW.md`
4. 当前 Issue / 当前任务
5. 当前直接相关文件

如任务涉及工具角色、权限边界、执行环境，再读：

6. `TOOLCHAIN.md`

如任务确实需要，再按需读：

- `docs/00_project_brief.md`
- `docs/04_architecture.md`
- `docs/05_module_boundaries.md`
- `docs/06_coding_standards.md`
- `docs/07_testing_strategy.md`
- `docs/11_stage_gates.md`
- `docs/12_toolchain_and_antigravity.md`
- `docs/13_human_gate_and_rollback.md`
- 对应的 Artifact 模板或 Skill

不要默认读取全部 `docs/`、全部 `.ai/`、全部 Skills。

## 3. Context Budget Rule

### Small task

- 最多读取 `5-6` 个文件
- 默认读：`README.md`、`AGENTS.md`、`AI_WORKFLOW.md`、当前 Issue/任务、当前相关文件
- 不默认读全部 `docs/`、`.ai/`、Skills

### Medium task

- 最多读取 `7-9` 个文件
- 在 Small task 基础上可增加 `TOOLCHAIN.md`
- 按需再加 `1-2` 个相关 docs 或 `1` 个 Artifact 模板

### Large task

- 超过 `9` 个文件前，必须先输出 Reading Plan
- Reading Plan 必须说明：
  - 为什么需要更多文件
  - 要读哪些文件
  - 每个文件用途
- 等 Human Owner 确认后再继续

## 4. Before Editing

在写任何代码或做结构性修改前，必须完成：

1. 理解当前任务目标、边界和验收标准
2. 判断当前任务属于哪个 Stage Gate，参见 `docs/11_stage_gates.md`
3. 明确 Allowed Files 和 Forbidden Files
4. 先生成 Plan Artifact
5. 等 Human Owner 确认计划后再实施

禁止：

- 从模糊需求直接跳到实现
- 跳过 Plan Artifact
- 跳过 Human Gate
- 默认读完整个仓库

## 5. Core Principles

1. 不要擅自扩大任务范围。
2. 不要做与当前任务无关的重构。
3. 不要擅自引入新依赖。
4. 不要绕过测试。
5. 不要修改任务范围外的文件。
6. 遇到不确定问题，暂停并询问。
7. 优先做小而可审查的修改。
8. 架构变化必须更新 `docs/09_decision_log.md`。
9. GitHub 是事实中心，聊天不是事实中心。
10. AI 压缩的是执行成本，不是判断成本。

## 6. File Boundary Rules

- 只修改任务明确允许的文件
- 不要修改 Forbidden Files
- 不确定文件是否在范围内时，暂停
- 文档任务不要顺手修改源码
- 测试任务不要顺手重构业务逻辑

详见 `.ai/protocols/FILE_BOUNDARY_RULES.md` 和 `docs/05_module_boundaries.md`。

## 7. Human Gate Rules

以下事项必须人工确认：

- Idea / MVP / Implementation / Review / Launch / Scale 的 Gate 决策
- Plan Artifact
- 高风险命令
- merge
- release
- rollback
- 任何架构方向变化

详见 `docs/13_human_gate_and_rollback.md`。

## 8. No Auto Commit / Push / Merge / Release

AI 不得自动执行以下操作，除非 Human Owner 明确批准：

- commit
- push
- merge
- release
- force push

也不得绕过：

- Human Review
- CI
- 产品判断

## 9. Dependency Rules

- 不要擅自引入新依赖
- 如确实需要，必须说明：
  - 为什么需要
  - 替代方案
  - 维护成本
- 等人工确认后再引入

## 10. Testing Rules

- 功能修改必须包含相应测试
- 合并前必须运行测试
- 测试失败时先修测试，不要继续扩展功能
- 不要跳过或注释掉现有测试

详见 `docs/07_testing_strategy.md`。

## 11. Documentation Rules

- 架构变化更新 `docs/04_architecture.md`
- 模块边界变化更新 `docs/05_module_boundaries.md`
- 技术决策变化记录到 `docs/09_decision_log.md`
- 不要让文档和实际流程脱节

## 12. Stop Conditions

出现以下情况时，立即暂停并报告：

1. 试图修改 Forbidden Files
2. 任务范围扩大
3. 会破坏核心架构
4. 需要引入新依赖但未获批准
5. 测试失败
6. UI / 交互结果明显偏离预期
7. 多个 Agent 争用同一核心文件
8. 输出不足以判断风险
9. 合并前存在冲突
10. 无法判断正确做法

详见 `.ai/protocols/STOP_CONDITIONS.md`。

## 13. Required Final Response Format

每次修改完成后，必须输出以下信息：

```text
### 修改摘要

- 改了哪些文件：[列出所有修改的文件路径]
- 为什么改：[简要说明每个文件的修改动机]
- 没改哪些相关文件：[列出可能相关但未修改的文件及原因]

### 测试结果

- 运行了哪些测试：[列出测试命令]
- 测试是否通过：[是/否/部分]
- 失败的测试（如有）：[列出失败测试和原因]

### 风险评估

- 可能的副作用：[列出可能影响的非目标功能]
- 是否有 TODO 项：[列出残留的未完成工作]
- 是否需要文档更新：[是/否，说明哪些文档]

### 后续建议

- 建议人工重点检查：[列出需要人类重点审查的文件和原因]
- 建议后续任务：[如果有相关联的后续工作，简要说明]
```
