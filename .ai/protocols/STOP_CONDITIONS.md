# STOP_CONDITIONS.md

> 本文件只列必须暂停的情况。

## Stop Immediately If

1. 试图修改 Forbidden Files
2. 任务范围扩大
3. 会破坏核心架构或模块边界
4. 需要引入新依赖但未获批准
5. 测试失败却还想继续扩展功能
6. UI / 交互明显偏离预期
7. 多个 Agent 争用同一核心文件
8. 无法判断风险
9. 合并前存在冲突
10. 不确定正确做法

## v0.2 Additional Stops

11. Idea Gate 未通过却开始实现
12. MVP 范围失控
13. Plan Artifact 未批准却开始写代码
14. Human Review 未完成却想进入下一阶段
15. CI 失败却想 merge
16. Launch 指标未定义却想 release
17. 想自动化需要人判断的流程
18. 高风险操作未获批准

## After Stopping

暂停后至少报告：

- 为什么停
- 影响范围
- 建议的下一步
- 是否需要 Human Owner 决策
