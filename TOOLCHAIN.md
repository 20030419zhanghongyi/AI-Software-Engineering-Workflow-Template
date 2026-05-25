# TOOLCHAIN.md

> v0.2 工具链角色矩阵。明确每个工具的职责边界。

---

## 角色定义

### GitHub Repository — 事实中心

- 项目状态的唯一来源
- Issue 管理任务，PR 管理代码变更，CI 管理质量门禁
- 所有 Artifact、决策记录、文档最终沉淀在仓库中
- 聊天记录、AI 会话、临时文件不是事实中心

### Antigravity — 执行工作台

- 读取仓库文档和 Issue 后，按 Plan Artifact 执行代码实现
- 生成 Plan Artifact、Implementation Report、Review Artifact
- 提供 Terminal 执行和 Browser 验证环境
- **不能**：成为事实中心、自动 merge、自动 release、绕过人工审查

推荐权限策略：

| 权限 | 建议设置 |
|---|---|
| Terminal Execution | Request Review |
| Artifact Review | Request Review |
| Browser JS Execution | Request Review 或 Disabled |
| Non-workspace File Access | Disabled |

详细用法参见 `docs/18_antigravity_workflow.md`。

### Claude Code — 执行 + Skills 载体

- 按 Issue 和 AGENTS.md 执行编码任务
- 通过 `.claude/skills/` 调用标准化流程（如 validate-idea、plan-from-issue）
- 通过 `.claude/commands/` 使用简单命令模板
- **不能**：绕过 Human Gate、自动 merge/push/release

Skills 和 Commands 的关系：

```text
.claude/commands/  — 简单命令模板（legacy，仍可用）
.claude/skills/    — 完整技能模板（v0.2 主推，含 Inputs/Outputs/Steps/Human Review）
```

### Codex — 执行 + Skills 载体

- 按 Issue 和 AGENTS.md 执行编码任务
- 通过 `.agents/skills/` 调用标准化流程
- **不能**：自动 commit、自动 push、自动 merge（除非用户明确批准）

### Cursor — 编辑与规则辅助

- 通过 `.cursor/rules/` 加载项目规则
- 人工审查和修改代码的主要编辑环境
- 辅助编码和调试
- **不能**：替代 CI 或绕过审查流程

### GitHub Actions — 质量门禁

- 自动检查代码质量（lint、type check、test、build）
- CI 是防止"看似完成但实际不可用代码"的底线
- 检查结果回写到 PR
- **不能**：做产品判断或替代人工审查

### Human Owner — 最终决策者

- 产品方向、需求取舍、技术取舍、架构决策
- 是否批准 Plan Artifact
- 是否 merge PR
- 是否 release 版本
- 是否执行 rollback
- 是否允许自动化
- AI 可以建议，不能替代

---

## 工具选择指引

| 场景 | 推荐工具 | 原因 |
|---|---|---|
| 生成 Plan Artifact | Claude Code / Antigravity | 需要读仓库文档后输出结构化计划 |
| 执行代码实现 | Antigravity / Claude Code / Codex | 按工具可用性和偏好选择 |
| 运行终端命令验证 | Antigravity（Request Review） | 有 Terminal 环境，但必须人工确认高风险命令 |
| 浏览器验证 UI | Antigravity（Request Review 或 Disabled） | 有 Browser 环境，但 JS 执行需谨慎 |
| 生成 Artifact | Claude Code Skills / Codex Skills | Skills 是标准化流程按钮 |
| 人工审查代码 | Cursor / GitHub PR Review | 人工操作环境 |
| 质量门禁 | GitHub Actions | 自动化检查 |
| 管理任务和状态 | GitHub Issues + PR | 事实中心 |

---

## 禁止事项

以下操作禁止由任何工具自动执行，必须 Human Owner 明确批准：

- 删除数据
- 修改密钥或凭证
- 修改生产环境配置
- 自动 merge 到主分支
- 自动 release
- 绕过 CI
- 跳过人工产品判断
- 执行高风险终端命令（rm -rf、DROP TABLE、force push 等）
