# AGENTS.md

> 本文件是给 Codex、Claude Code、Cursor Agent、GitHub Copilot 等 AI coding 工具看的总规则。
> AI 在修改本仓库任何代码之前，必须先阅读并遵守本文件。

---

## 1. Scope

本仓库是一个面向个人开发者的 AI 辅助软件工程工作流模板仓库。

它不是具体业务项目，不要创建 React / Vue / Electron / 后端服务 / CLI 工具等业务应用。

本仓库的目标是提供轻量软件工程流程模板，让个人开发者在使用 AI coding 工具时，能够写可维护的代码。

---

## 2. Required Reading Order

在修改代码之前，必须按顺序阅读以下文件：

```text
1. README.md
2. AI_WORKFLOW.md
3. TOOLCHAIN.md
4. docs/00_project_brief.md
5. docs/04_architecture.md
6. docs/05_module_boundaries.md
7. docs/06_coding_standards.md
8. docs/07_testing_strategy.md
9. docs/11_founder_stage_gates.md
10. docs/19_rollback_and_human_gate_protocol.md
11. 当前 Issue 或任务说明
```

如果以上任何文件不存在，先报告缺失文件，不要自行跳过。

---

## 3. Project Purpose

```text
仓库管状态，AI 管执行，CI 管质量，人管决策。
Stage Gates 管方向，Artifacts 管证据，Rollback 管风险。
AI 压缩的是执行成本，不是判断成本。

本项目的目标不是让 AI 写更多代码，
而是让 AI 在明确边界和质量规则下写出更可维护的代码。
```

---

## 4. Core Principles

1. 不要从模糊需求直接写代码，先输出计划。
2. 不要擅自扩大任务范围。
3. 不要做与当前任务无关的重构。
4. 不要擅自引入新依赖。
5. 不要绕过测试。
6. 不要修改任务范围外的文件。
7. 遇到不确定问题，停止并询问。
8. 修改完成后，必须说明改了哪些文件、为什么改、测试结果、风险。
9. 技术架构变化必须更新 docs/09_decision_log.md。
10. 优先做小而可审查的修改，不要一口气大改。
11. 必须先判断当前任务属于哪个 Stage Gate，参见 `docs/11_founder_stage_gates.md`。
12. 实现前必须生成 Plan Artifact，参见 `.ai/artifacts/PLAN_ARTIFACT_TEMPLATE.md`。
13. 关键点必须等待人工确认，不能自行跳过 Human Gate。
14. 必须保留回退方案，参见 `docs/19_rollback_and_human_gate_protocol.md`。
15. Antigravity / Claude Code / Codex 都不能绕过 GitHub 事实中心。

---

## 5. Before Editing Code

在写任何代码之前，必须完成：

1. 阅读本文件（AGENTS.md）。
2. 阅读 Required Reading Order 中列出的文档。
3. 理解当前 Issue 或任务的目标、边界和验收标准。
4. 判断当前任务属于哪个 Stage Gate。
5. 生成 Plan Artifact，包括：任务理解、计划修改的文件、实现步骤、风险、回退方案。
6. 等待人类确认 Plan Artifact 后，再开始修改代码。

```text
禁止：直接从模糊需求跳到代码。
禁止：跳过 Plan Artifact 直接执行。
禁止：跳过 Human Gate 进入下一阶段。
```

---

## 6. File Boundary Rules

1. 只修改任务明确允许的文件。
2. 不要修改 Forbidden Files 中列出的任何文件。
3. 如果不确定某个文件是否在范围内，暂停并询问。
4. UI 相关文件不能随意改状态管理。
5. 业务逻辑文件不能随意改 UI。
6. 测试文件不能重构业务代码。
7. 文档文件不能修改源码。
8. 如果需要修改范围外的文件，必须先说明理由并请求确认。

详见 `.ai/protocols/FILE_BOUNDARY_RULES.md`。

---

## 7. Dependency Rules

1. 不要擅自引入新依赖。
2. 如果确实需要引入新依赖，必须：
   - 说明为什么需要。
   - 说明考虑过哪些替代方案。
   - 说明引入后的维护成本。
   - 等待人类确认后再引入。
3. 不要为了完成功能而引入不必要的依赖。

---

## 8. Testing Rules

1. 功能修改必须包含相应的测试。
2. 合并前必须运行测试，且所有测试通过。
3. 如果测试失败，不要继续扩展功能，先修复测试。
4. 不要跳过或注释掉现有测试来让构建通过。
5. 不要只写 happy path 测试，要考虑边界情况。
6. 测试代码本身也要遵守编码规范。

详见 `docs/07_testing_strategy.md`。

---

## 9. Documentation Rules

1. 重构或架构变化必须更新 docs/ 下的相关文档。
2. 技术架构决策必须记录到 `docs/09_decision_log.md`。
3. 公共 API 变化必须更新对应文档。
4. 修改了模块边界必须更新 `docs/05_module_boundaries.md`。
5. 不要修改文档时遗漏关键信息。

---

## 10. Stop Conditions

出现以下情况时，必须立即暂停并报告：

1. 试图修改任务禁止文件。
2. 擅自扩大任务范围。
3. 试图修改核心架构。
4. 引入新依赖但未说明理由。
5. 测试失败。
6. UI / 交互结果偏离预期。
7. 多个 Agent 修改同一核心文件。
8. 输出不完整，无法判断风险。
9. 合并前存在未解决冲突。
10. 遇到不确定问题，无法判断正确做法。

暂停不是失败，是为了防止错误继续扩大。

详见 `.ai/protocols/STOP_CONDITIONS.md`。

---

## 11. Required Final Response Format

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
