# /checkpoint Command

> 生成当前任务的检查点报告。

---

## Command Template

```markdown
请按检查点报告模板输出当前进度报告。

报告应包含：

1. **Agent Name**：当前 Agent 名称
2. **Current Stage**：当前处于哪个检查点
3. **Task Understanding**：对任务的理解
4. **What I Changed**：本次做了什么
5. **Modified Files**：修改了哪些文件
6. **Boundary Check**：是否越权修改
7. **User-Facing Impact**：对用户可见的影响
8. **Test Result**：测试结果
9. **Risks**：当前风险
10. **Need Human Feedback**：是否需要人工反馈
11. **Suggested Next Step**：建议下一步

参考模板：.ai/prompts/CHECKPOINT_REPORT_TEMPLATE.md
```

---

## Usage

在 Claude Code 中，当你想让 AI 在任务执行过程中停下来汇报时，使用此命令。

适用于：

- AI 完成了一部分工作时
- 想检查 AI 的修改是否偏离目标时
- 需要做中期审查时
- 任务有多个阶段时
