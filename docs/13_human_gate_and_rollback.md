# 13. Human Gate And Rollback

> v0.2 的 Human Gate 和 Rollback 参考文档。

## Purpose

明确哪些节点必须由人决定，哪些操作必须能回退，哪些动作绝不能自动化。

## Human Checkpoints By Gate

| Gate | 必须人工确认 | 典型决策 |
|---|---|---|
| Idea Gate | 问题验证结论 | build / refine / reject |
| MVP Gate | 范围边界与排除项 | implement / narrow / redesign / pause |
| Implementation Gate | Plan Artifact | approve / revise / reject |
| Review Gate | 代码、测试、风险、回退 | merge / request changes / rollback / abandon |
| Launch Gate | 发布准备度 | release / private beta / delay / rollback |
| Scale Gate | 自动化边界 | automate / keep manual / observe more |

## Rollback Options By Gate

| Gate | 回退方式 |
|---|---|
| Idea Gate | 回到问题定义、缩小用户范围、放弃方向 |
| MVP Gate | 缩小范围、换假设、暂停进入实现 |
| Implementation Gate | 修改计划、缩小改动、撤回实现 |
| Review Gate | request changes、rollback PR、放弃本轮修改 |
| Launch Gate | delay、缩小发布范围、rollback |
| Scale Gate | 回到手动流程、暂停自动化 |

## Actions That Always Require Human Confirmation

- Plan 批准
- Gate 决策
- merge
- release
- rollback
- 高风险命令
- 架构方向变化
- 范围扩大
- 新依赖引入

## Actions That Must Never Be Automated

- 删除数据
- 修改密钥
- 修改生产配置
- 自动 merge
- 自动 release
- force push
- 绕过 CI
- 绕过 Human Review
- 跳过产品判断

## Rollback Plan Minimum Fields

每个 Rollback Plan 至少包含：

- Trigger：什么情况下回退
- Action：怎么回退
- Scope：影响哪些文件 / 功能 / 用户
- Validation：回退后如何确认系统正常
- Owner：谁批准、谁执行

## Merge / Release Safety Rules

### Merge

- 必须有测试结果
- 必须有风险说明
- 必须有回退方案
- CI 不通过不能 merge
- Human Review 未完成不能 merge

### Release

- 指标未定义不能 release
- 反馈渠道未建立不能 release
- 回退方式不清不能 release
- Human Owner 未批准不能 release

## Summary

规则很简单：

- AI 可以执行
- CI 可以检查
- GitHub 可以记录
- 人必须负责关键判断和不可逆操作
