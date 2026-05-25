# .ai/ Directory

> 本目录存放 AI 工作流相关的 Prompt 模板、流程协议、Artifact 模板和示例文档。

---

## 目录结构

```text
.ai/
├── README.md                          # 本文件
├── prompts/                           # Prompt 模板
│   ├── SUPERVISOR_SYSTEM_PROMPT.md   # 监督 Agent 系统 Prompt
│   ├── CHILD_AGENT_TASK_TEMPLATE.md  # 子 Agent 任务卡模板
│   ├── CHECKPOINT_REPORT_TEMPLATE.md # 检查点报告模板
│   ├── HUMAN_BRIEF_TEMPLATE.md       # Human Brief 模板
│   └── FEEDBACK_TRANSLATION_TEMPLATE.md # 反馈转译模板
├── protocols/                         # 流程协议
│   ├── WORKFLOW_PROTOCOL.md          # 工作流协议
│   ├── FEEDBACK_PROTOCOL.md          # 反馈协议
│   ├── FILE_BOUNDARY_RULES.md        # 文件边界规则
│   ├── STOP_CONDITIONS.md            # 停止条件
│   └── MERGE_PROTOCOL.md             # 合并协议
├── artifacts/                         # v0.2 Artifact 模板
│   ├── IDEA_VALIDATION_ARTIFACT_TEMPLATE.md
│   ├── MVP_SCOPE_ARTIFACT_TEMPLATE.md
│   ├── PLAN_ARTIFACT_TEMPLATE.md
│   ├── IMPLEMENTATION_REPORT_TEMPLATE.md
│   ├── REVIEW_ARTIFACT_TEMPLATE.md
│   ├── LAUNCH_REVIEW_ARTIFACT_TEMPLATE.md
│   ├── SCALE_AUTOMATION_REVIEW_TEMPLATE.md
│   └── ROLLBACK_PLAN_TEMPLATE.md
└── examples/                          # 示例文档
    ├── example_project_brief.md
    ├── example_ai_coding_task.md
    ├── example_checkpoint_report.md
    ├── example_human_brief.md
    └── example_integration_review.md
```

---

## 子目录说明

### prompts/

存放 Prompt 模板，用于配置各类 AI Agent 的行为。

- **SUPERVISOR_SYSTEM_PROMPT.md**：监督 Agent 的完整系统 Prompt，定义其角色、状态机和行为规则。
- **CHILD_AGENT_TASK_TEMPLATE.md**：子 Agent 任务卡模板，为每次子 Agent 分配提供标准格式。
- **CHECKPOINT_REPORT_TEMPLATE.md**：检查点报告模板，子 Agent 在每个检查点提交的标准报告。
- **HUMAN_BRIEF_TEMPLATE.md**：Human Brief 模板，监督 Agent 向用户汇报的决策摘要。
- **FEEDBACK_TRANSLATION_TEMPLATE.md**：反馈转译模板，将用户自然语言反馈转为工程约束。

### protocols/

存放流程协议，定义 AI 工作流中各环节的规则。

- **WORKFLOW_PROTOCOL.md**：完整的 AI coding 工作流步骤。
- **FEEDBACK_PROTOCOL.md**：用户反馈的处理规则。
- **FILE_BOUNDARY_RULES.md**：多 Agent 场景下的文件边界规则。
- **STOP_CONDITIONS.md**：必须暂停执行的条件。
- **MERGE_PROTOCOL.md**：合并前审查流程。

### examples/

存放示例文档，展示各个模板的具体用法。

### artifacts/（v0.2 新增）

存放 Stage Gate 产出物的标准化模板。每个 Artifact 对应一个 Stage Gate：

- **IDEA_VALIDATION_ARTIFACT_TEMPLATE.md**：Idea Gate 产物
- **MVP_SCOPE_ARTIFACT_TEMPLATE.md**：MVP Gate 产物
- **PLAN_ARTIFACT_TEMPLATE.md**：Implementation Gate 计划产物
- **IMPLEMENTATION_REPORT_TEMPLATE.md**：Implementation Gate 实现报告
- **REVIEW_ARTIFACT_TEMPLATE.md**：Review Gate 产物
- **LAUNCH_REVIEW_ARTIFACT_TEMPLATE.md**：Launch Gate 产物
- **SCALE_AUTOMATION_REVIEW_TEMPLATE.md**：Scale Gate 产物
- **ROLLBACK_PLAN_TEMPLATE.md**：通用回退计划模板

Artifact 是 Stage Gate 的证据链，确保每个阶段的决策可追溯、可审查。

---

## 与 .ai-runs/ 的关系

`.ai-runs/` 目录存放每次 AI coding 过程的实际记录。

- `.ai/` 存放模板和规则（随仓库提交）
- `.ai-runs/` 存放运行时记录（日志和临时文件被 .gitignore 排除）

```text
.ai/          = 规则和模板（版本控制）
.ai-runs/     = 运行记录（过程数据）
```
