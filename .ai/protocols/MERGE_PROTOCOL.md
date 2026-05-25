# MERGE_PROTOCOL.md

> 本文件只定义合并前检查。

## Merge Checklist

- 当前任务已通过对应 Stage Gate
- Plan / Review / Rollback 信息完整
- 测试结果明确
- CI 状态明确
- 改动未越权
- 风险已说明
- 回退方式可执行

## Human Review Focus

- 是否改了不该改的文件
- 是否有无关重构
- 是否引入了未批准依赖
- 是否破坏架构或模块边界
- 是否存在发布或回退风险

## Never Merge If

- CI 失败
- 测试失败
- 越权修改未解释
- 风险无法判断
- 回退方式不清
- Human Review 未完成

## Output

合并前审查至少给出：

- 变更概述
- 测试结果
- 风险摘要
- 回退方案
- 建议：merge / request changes / rollback / abandon
