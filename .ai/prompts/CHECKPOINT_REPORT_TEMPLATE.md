# CHECKPOINT_REPORT_TEMPLATE.md

> 子 Agent 检查点报告模板。子 Agent 在每个检查点必须按此格式提交报告。

---

## 用途说明

检查点报告是监督 Agent 监控子 Agent 执行状态的核心工具。每个检查点，子 Agent 必须按此模板提交报告，监督 Agent 据此判断项目是否偏离目标。

---

## 检查点报告模板

```markdown
# Checkpoint Report

## Agent Name

[提交报告的 Agent 名称]

## Current Stage

[当前处于哪个检查点]

- [ ] Checkpoint 0：任务理解
- [ ] Checkpoint 1：执行计划
- [ ] Checkpoint 2：首轮代码改动
- [ ] Checkpoint 3：测试结果
- [ ] Checkpoint 4：UI / 交互产物
- [ ] Checkpoint 5：最终总结

## Task Understanding

[我对任务的理解。用自己的话重述目标，确认没有理解偏差。]

## What I Changed

[简要说明本次检查点区间内做了什么]

## Modified Files

| 文件路径 | 变更类型 | 说明 |
|---------|---------|------|
| [路径] | 新增/修改/删除 | [为什么改] |

## Boundary Check

- [ ] 所有修改的文件都在 Allowed Files 范围内
- [ ] 没有修改任何 Forbidden Files
- [ ] 没有扩大任务范围
- [ ] 代码符合编码规范

**如发现越权修改，请在此说明：**

[如果没有越权，写"无越权修改"]

## User-Facing Impact

[本次变更对用户可见的影响]

- [有/无] 新增用户可见功能
- [有/无] 修改了已有交互
- [有/无] 修复了用户可感知的问题

## Test Result

- 运行了哪些测试：[列出测试命令]
- 测试是否通过：[全部通过 / 部分失败 / 未运行]
- 失败的测试（如有）：[列出]

## Risks

[当前是否存在风险]

- [有/无] 可能影响其他模块
- [有/无] 引入了新依赖
- [有/无] 存在未完成的 TODO
- [有/无] 性能隐患

**风险详情：**

[列出具体风险，如无则写"当前无明显风险"]

## Need Human Feedback

- [ ] 不需要，可以继续执行
- [ ] 需要：[说明需要什么反馈]

## Suggested Next Step

[建议下一步做什么]
```

---

## 使用方式

1. 子 Agent 到达每个检查点时，按此模板提交报告。
2. 监督 Agent 审查报告，特别关注 Boundary Check 和 Risks。
3. 如果 Need Human Feedback 勾选了"需要"，监督 Agent 应生成 Human Brief。
4. 所有检查点报告应保存到 `.ai-runs/` 对应目录。
