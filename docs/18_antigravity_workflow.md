# 18. Antigravity Workflow

> Antigravity 在本仓库中的推荐用法、权限边界和工作流。

---

## Purpose

说明 Antigravity 作为执行工作台的推荐使用方式，明确它不能做什么。

## When to use

- 使用 Antigravity 执行编码任务时
- 配置 Antigravity 权限时

## Inputs

- 当前 Stage Gate 阶段
- Plan Artifact（已通过人工确认）

## Outputs

- Implementation Report
- Review Artifact
- 结果回写到 GitHub Issue / PR / .ai-runs

---

## 定位

```text
Antigravity 是执行工作台，不是事实中心。
```

它能：
1. 按 Plan Artifact 执行代码实现
2. 生成 Plan Artifact、Implementation Report、Review Artifact
3. 提供 Terminal 和 Browser 验证环境
4. 辅助代码实现、调试、测试

它不能：
1. 替代 GitHub 作为事实中心
2. 自动 merge / release
3. 绕过人工审查
4. 修改非工作区文件

---

## 推荐工作流

### Step 1：准备

使用 Antigravity 前，确认：
- [ ] 已阅读 README.md、AGENTS.md、AI_WORKFLOW.md、TOOLCHAIN.md
- [ ] 已识别当前 Stage Gate
- [ ] 已有 Issue 或任务描述

### Step 2：生成 Plan Artifact

- 让 Antigravity 读取相关文档和 Issue
- 生成 Plan Artifact（参见 `.ai/artifacts/PLAN_ARTIFACT_TEMPLATE.md`）
- **暂停**，等 Human Owner 确认

### Step 3：人工确认 Plan

Human Owner 审查 Plan Artifact：
- 文件边界是否合理
- 测试策略是否明确
- 回退方案是否可行
- 是否有越权修改风险

### Step 4：执行实现

Plan 通过后，Antigravity 按步骤执行。

### Step 5：生成 Implementation Report

执行完成后，生成 Implementation Report（参见 `.ai/artifacts/IMPLEMENTATION_REPORT_TEMPLATE.md`）。

### Step 6：验证与 Review

- 运行测试
- 生成 Review Artifact（参见 `.ai/artifacts/REVIEW_ARTIFACT_TEMPLATE.md`）
- 结果回写到 GitHub Issue / PR / .ai-runs

---

## 推荐权限策略

| 权限 | 建议设置 |
|---|---|
| Terminal Execution Policy | Request Review |
| Artifact Review Policy | Request Review |
| Browser JavaScript Execution Policy | Request Review 或 Disabled |
| Non-workspace File Access | Disabled |

高风险命令必须人工确认，包括但不限于：
- 删除文件或目录
- 修改环境变量
- 安装全局包
- 网络请求到外部服务
- 数据库操作

---

## Human checkpoint

- Plan Artifact 必须人工确认后才执行
- Implementation Report 必须人工审查
- 高风险终端命令必须人工批准
- 合并和发布禁止由 Antigravity 执行

## Rollback option

- Plan 未通过 → 修改 Plan 或拒绝
- 实现偏离 → git revert 或 git reset
- 命令执行错误 → 人工干预终端
- 结果不满意 → 回退到 Step 2 重新生成 Plan

---

## 常见失败模式

1. 不生成 Plan Artifact 就直接执行
2. 设为自动执行终端命令，跳过人工审查
3. 在 Antigravity 中做产品决策
4. 结果不同步到 GitHub，导致事实中心分裂
5. 允许 Antigravity 访问非工作区文件
