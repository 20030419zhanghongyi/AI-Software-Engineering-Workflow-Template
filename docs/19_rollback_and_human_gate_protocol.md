# 19. Rollback and Human Gate Protocol

> 回退协议与人工门禁协议。

---

## Purpose

确保每个阶段都有人工检查点和回退方式。明确哪些操作禁止自动化。

## When to use

- 进入任何 Stage Gate 时
- 执行任何高风险操作前
- 审查流程合规性时

## Inputs

- 当前 Stage Gate 阶段
- 当前操作类型

## Outputs

- 人工确认记录
- Rollback Plan（如果需要）

---

## 人工门禁清单

每个 Gate 的人工检查点：

| Gate | 必须人工确认 | 人工决策选项 |
|---|---|---|
| Idea Gate | 问题验证结论 | build / refine / reject |
| MVP Gate | 范围边界和排除项 | implement / narrow / redesign / pause |
| Implementation Gate | Plan Artifact | approve / revise / reject |
| Review Gate | 代码和风险审查 | merge / request changes / rollback / abandon |
| Launch Gate | 发布决策 | release / beta / delay / rollback |
| Scale Gate | 自动化决策 | automate / keep manual / observe more |

### 额外人工确认场景

- Antigravity 执行高风险终端命令
- Codex 或 Claude Code 请求 commit / push
- 任何涉及数据删除的操作
- 回退操作本身

---

## 回退协议

### 回退原则

1. 每个 Gate 都必须有回退方式
2. 回退决策必须由 Human Owner 做出
3. 回退方案必须在进入 Gate 前就定义
4. 回退后必须验证系统状态正常
5. 回退操作必须记录在 Artifact 中

### 各 Gate 回退方式

| Gate | 回退方式 |
|---|---|
| Idea Gate | 回到 problem statement / 缩小目标 / 重新做竞品分析 / 放弃 |
| MVP Gate | 缩小范围 / 重新选假设 / 暂停 |
| Implementation Gate | 修改 Plan / 缩小实现范围 / git revert / 回到 MVP Gate |
| Review Gate | request changes / rollback PR / abandon PR |
| Launch Gate | 延迟发布 / 缩小范围 / 执行 rollback |
| Scale Gate | 回退到手动流程 / 暂停自动化 / 增加人工审查点 |

### 代码级回退

```text
1. git revert [commit-hash]
2. 验证 revert 后构建和测试通过
3. 检查是否影响后续 commit
4. 更新 Issue 状态
5. 在 .ai-runs 中记录回退原因
```

如果涉及数据库变更：
- 确认有回滚脚本
- 确认 revert 不会丢失用户数据
- 先在测试环境验证

---

## 禁止自动化的操作

以下操作禁止由任何工具自动执行：

| 操作 | 原因 |
|---|---|
| 删除数据 | 不可逆 |
| 修改密钥 / 凭证 | 安全风险 |
| 修改生产环境配置 | 影响线上用户 |
| 自动 merge 到主分支 | 必须人工审查 |
| 自动 release | 必须人工确认发布就绪 |
| 绕过 CI | CI 是质量底线 |
| 跳过人工产品判断 | AI 压缩执行，不压缩判断 |
| 强制 push | 不可逆，破坏历史 |

---

## Human checkpoint

- 确认每个 Gate 都有人工入口
- 确认每个操作都有回退方式
- 确认禁止自动化列表被遵守

## Rollback option

- 如果发现 Gate 缺少人工检查点，立即暂停流程补充
- 如果发现自动化操作绕过人工，立即停止并审计
- 如果回退方案不可行，优先保护数据安全

---

## 常见失败模式

1. Gate 没有人工检查点，AI 直接跳到下一阶段
2. 回退方案只写了"git revert"但没验证是否可行
3. 把 merge 权限给了 AI 工具
4. CI 失败后仍然继续 merge
5. 回退操作本身没有记录
