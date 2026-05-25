# WORKFLOW_PROTOCOL.md

> 完整的 AI coding 工作流协议。v0.2 新增 Stage Gate 方向控制层。

---

## 两层流程

v0.2 的工作流分为两层：

### 方向控制层：Stage Gates

```text
Idea Gate → MVP Gate → Implementation Gate → Review Gate → Launch Gate → Scale Gate
```

每个 Gate 由 Human Owner 决策，AI 提供 Artifact 和建议。详见 `docs/11_founder_stage_gates.md`。

### 执行层：软件工程流程

```text
需求分析 → 技术调研 → 技术选型 → 架构设计 → 模块边界 → 编码规范
→ Issue → Plan → Implementation → Test → Review → PR → CI → Merge → Release → Retrospective
```

两层并行，不互相替代。Stage Gate 管方向，执行层管质量。

---

## Stage Gate 与执行层映射

| Stage Gate | 执行层关键步骤 | 产出 Artifact |
|---|---|---|
| Idea Gate | 需求分析、技术调研 | IDEA_VALIDATION_ARTIFACT |
| MVP Gate | 技术选型、架构设计、模块边界 | MVP_SCOPE_ARTIFACT |
| Implementation Gate | Issue、Plan、Implementation、Test | PLAN_ARTIFACT + IMPLEMENTATION_REPORT |
| Review Gate | Review、PR、CI | REVIEW_ARTIFACT |
| Launch Gate | Merge、Release | LAUNCH_REVIEW_ARTIFACT |
| Scale Gate | Retrospective | SCALE_AUTOMATION_REVIEW_ARTIFACT |

---

## 工作流概览（v0.2 增强版）

```text
Idea Gate：验证问题
↓ [Human: build / refine / reject]
MVP Gate：控制范围
↓ [Human: implement / narrow / redesign / pause]
Implementation Gate：生成 Plan Artifact → 人工确认 → 执行
↓ [Human: approve / revise / reject plan]
多 Agent 或单 Agent 执行（检查点 + Human Brief + 反馈循环）
↓
Review Gate：审查代码、测试、风险
↓ [Human: merge / request changes / rollback / abandon]
Launch Gate：判断是否发布
↓ [Human: release / beta / delay / rollback]
Scale Gate：决定什么值得固化
↓ [Human: automate / keep manual / observe more]
```

---

## 详细步骤

### Step 1：Idea Gate

1. 识别当前任务是否需要先验证问题。
2. 如果是新功能/新方向，先用 validate-idea Skill 生成 IDEA_VALIDATION_ARTIFACT。
3. Human Owner 决策：build / refine / reject。
4. 如果 refine，回到问题陈述。
5. 如果 reject，停止。

详见 `docs/12_problem_validation.md`。

### Step 2：MVP Gate

1. 用 mvp-scope-check Skill 生成 MVP_SCOPE_ARTIFACT。
2. 列出 In scope 和 Out of scope。
3. Human Owner 决策：implement / narrow / redesign / pause。
4. 如果 narrow，缩小范围后重新确认。

详见 `docs/13_mvp_scope_control.md`。

### Step 3：用户提出需求（或 Issue 已创建）

用户以自然语言提出需求，可以是 GitHub Issue、聊天消息或任何形式。

### Step 4：监督 Agent 分析

监督 Agent 接收需求后：

1. 分析需求是否清晰、完整。
2. 不清晰的部分，向用户提问。
3. 清晰后，总结为结构化需求描述。
4. 判断需求是否适合多 Agent 执行。
5. 简单任务可以单 Agent 完成。

### Step 5：用户确认

监督 Agent 输出结构化需求描述，用户确认。

如果用户有修改，回到 Step 4。

### Step 6：Implementation Gate — 生成 Plan Artifact

1. 用 plan-from-issue Skill 生成 PLAN_ARTIFACT。
2. Plan 必须包含：目标、允许文件、禁止文件、实现步骤、测试策略、回退方案。
3. Human Owner 审查并确认 Plan。
4. 未确认前，不能开始执行。

### Step 7：任务拆解

监督 Agent 将需求拆分为子任务：

1. 为每个子任务指定 Agent 类型。
2. 为每个子任务定义文件边界（Allowed / Forbidden）。
3. 为每个子任务定义验收标准。
4. 生成子 Agent 任务卡。

### Step 8：子 Agent 计划

每个子 Agent 收到任务卡后：

1. 阅读任务相关文档。
2. 输出任务理解和执行计划。
3. 提交 Checkpoint 0（任务理解）和 Checkpoint 1（执行计划）。

### Step 9：监督 Agent 审查

监督 Agent 审查子 Agent 的计划：

1. 是否越权修改？
2. 是否扩大任务范围？
3. 是否违反架构约束？
4. 通过 → 进入执行。不通过 → 要求子 Agent 修改计划。

### Step 10：子 Agent 小步执行

子 Agent 按计划小步执行：

1. 每次修改尽量小。
2. 到达检查点时暂停，提交报告。
3. 遇到不确定问题暂停并请求决策。

### Step 11：检查点

子 Agent 在每个检查点按 CHECKPOINT_REPORT_TEMPLATE 提交报告。

监督 Agent 审查报告，关注：

- Boundary Check 是否通过
- 测试是否通过
- 是否有风险

### Step 12：Human Brief

当出现以下情况时，监督 Agent 生成 Human Brief：

- 子 Agent 修改涉及架构
- 子 Agent 之间有冲突
- 方向偏离
- 测试失败
- 需要用户做产品决策

### Step 13：用户反馈

用户收到 Human Brief 后给出反馈。

反馈可以是：继续、小修后继续、方向调整、紧急停止等。

### Step 14：修正

监督 Agent 将用户反馈转译为工程约束，生成修正 Prompt 下发给子 Agent。

子 Agent 按修正 Prompt 调整，提交新的检查点报告。

### Step 15：Review Gate

1. 生成 IMPLEMENTATION_REPORT。
2. 生成 REVIEW_ARTIFACT。
3. 提交 PR，等待 CI。
4. Human Owner 审查 diff 和 Review Artifact。
5. 决策：merge / request changes / rollback / abandon。

### Step 16：Launch Gate（发布时）

1. 用 launch-check Skill 生成 LAUNCH_REVIEW_ARTIFACT。
2. 确认指标已定义、反馈渠道已建立、回退方案已确认。
3. Human Owner 决策：release / private beta / delay / rollback。

详见 `docs/14_launch_feedback_loop.md`。

### Step 17：Scale Gate（复盘时）

1. 用 scale-automation-review Skill 生成 SCALE_AUTOMATION_REVIEW_ARTIFACT。
2. 识别重复流程，判断是否值得固化。
3. Human Owner 决策：automate / keep manual / observe more。

详见 `docs/16_scale_workflow_automation.md`。

---

## 详细步骤

### Step 1：用户提出需求

用户以自然语言提出需求，可以是 GitHub Issue、聊天消息或任何形式。

需求可能是模糊的，这是正常的。

### Step 2：监督 Agent 分析

监督 Agent 接收需求后：

1. 分析需求是否清晰、完整。
2. 不清晰的部分，向用户提问。
3. 清晰后，总结为结构化需求描述。
4. 判断需求是否适合多 Agent 执行。
5. 简单任务可以单 Agent 完成。

### Step 3：用户确认

监督 Agent 输出结构化需求描述，用户确认。

如果用户有修改，回到 Step 2。

### Step 4：任务拆解

监督 Agent 将需求拆分为子任务：

1. 为每个子任务指定 Agent 类型。
2. 为每个子任务定义文件边界（Allowed / Forbidden）。
3. 为每个子任务定义验收标准。
4. 生成子 Agent 任务卡。

### Step 5：子 Agent 计划

每个子 Agent 收到任务卡后：

1. 阅读任务相关文档。
2. 输出任务理解和执行计划。
3. 提交 Checkpoint 0（任务理解）和 Checkpoint 1（执行计划）。

### Step 6：监督 Agent 审查

监督 Agent 审查子 Agent 的计划：

1. 是否越权修改？
2. 是否扩大任务范围？
3. 是否违反架构约束？
4. 通过 → 进入执行。不通过 → 要求子 Agent 修改计划。

### Step 7：用户反馈入口

在审查阶段，监督 Agent 可以选择将计划摘要提交给用户确认。

这一步不是必须的，但涉及重大架构变更时应执行。

### Step 8：子 Agent 小步执行

子 Agent 按计划小步执行：

1. 每次修改尽量小。
2. 到达检查点时暂停，提交报告。
3. 遇到不确定问题暂停并请求决策。

### Step 9：检查点

子 Agent 在每个检查点按 CHECKPOINT_REPORT_TEMPLATE 提交报告。

监督 Agent 审查报告，关注：

- Boundary Check 是否通过
- 测试是否通过
- 是否有风险

### Step 10：Human Brief

当出现以下情况时，监督 Agent 生成 Human Brief：

- 子 Agent 修改涉及架构
- 子 Agent 之间有冲突
- 方向偏离
- 测试失败
- 需要用户做产品决策

### Step 11：用户反馈

用户收到 Human Brief 后给出反馈。

反馈可以是：继续、小修后继续、方向调整、紧急停止等。

### Step 12：修正

监督 Agent 将用户反馈转译为工程约束，生成修正 Prompt 下发给子 Agent。

子 Agent 按修正 Prompt 调整，提交新的检查点报告。

### Step 13：合并前审查

所有子 Agent 完成后，监督 Agent 执行合并前审查：

1. 审查所有修改。
2. 检查模块边界。
3. 检查是否有冲突。
4. 运行所有测试。
5. 生成审查报告（见 MERGE_PROTOCOL.md）。

### Step 14：人工合并

用户根据审查报告决定：

- 合并
- 小修后合并
- 回滚

人工合并是最终门禁。

---

## 简化版（单 Agent 场景）

如果是简单任务，不需要多 Agent，可以简化为：

```text
判断 Stage Gate（Idea / MVP / Implementation）
↓
AI 阅读规则和文档
↓
AI 生成 Plan Artifact
↓
用户确认 Plan
↓
AI 小步执行
↓
AI 输出 Implementation Report
↓
运行测试
↓
Review Gate：用户审查 diff + Review Artifact
↓
合并或返工
```

核心原则不变：AI 不能直接从模糊需求跳到代码，不能跳过 Human Gate。
