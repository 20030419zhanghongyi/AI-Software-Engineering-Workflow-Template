# FEEDBACK_PROTOCOL.md

> 本文件只定义反馈转译协议。

## Goal

把用户或监督 Agent 的自然语言反馈，转成可执行的工程约束。

## Feedback Flow

```text
raw feedback
→ summarize
→ diagnose
→ translate into constraints
→ assign owner
→ update task / plan / artifact
```

## Translation Rules

1. 不要原样转发杂乱日志。
2. 先说明问题是什么、影响哪里、需要谁处理。
3. 把模糊反馈改成明确约束。
4. 方向性反馈要对齐到对应 Gate。

## Common Mappings

| 用户反馈 | 转译结果 |
|---|---|
| 继续 | 保持当前计划，进入下一步 |
| 小修后继续 | 列出具体修改点，更新任务边界 |
| 方向不对 | 暂停执行，回到 Idea Gate 或 MVP Gate |
| 范围太大 | 缩小范围，更新 Out of scope |
| 不要改这个文件 | 加入 Forbidden Files |
| 先别发布 | 停在 Launch Gate，补指标或反馈渠道 |

## Record Format

每次反馈至少记录：

- 原始反馈
- 转译后的工程约束
- 下发对象
- 当前状态

## Do Not

- 不要跳过用户确认
- 不要把主观猜测当成用户意思
- 不要让方向性反馈绕过 Stage Gate
