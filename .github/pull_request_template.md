# Pull Request

## Summary

[本 PR 做了什么？用 1-3 句话描述]

## Related Issue

[关联的 Issue 编号，如 Closes #12]

## Changed Files

| 文件 | 变更类型 | 说明 |
|------|---------|------|
| [文件路径] | 新增/修改/删除 | [变更原因] |

## Architecture Impact

- [ ] 无架构影响
- [ ] 有架构影响：[说明影响]

## Module Boundary Check

- [ ] 所有修改都在任务允许范围内
- [ ] 没有修改任务范围外的文件
- [ ] 没有跨层调用

**越权修改说明**（如有）：

## Tests

- [ ] 运行了哪些测试：[列出测试命令]
- [ ] 测试结果：[全部通过 / 部分失败]
- [ ] 新增了测试覆盖

## Screenshots

[如果是 UI 改动，提供截图对比。无 UI 改动则删除此节。]

## Risk

- 可能的副作用：[描述]
- 已知限制：[描述]

## Rollback Plan

- [ ] `git revert` 可安全回退
- [ ] 无数据库 schema 变更
- [ ] 回滚不影响用户数据

**回滚方案详情**：[描述]

## Human Review Checklist

- [ ] 功能符合需求
- [ ] 没有越权修改
- [ ] 没有无关重构
- [ ] 没有引入不必要依赖
- [ ] 测试通过
- [ ] 文档已更新（如需要）
- [ ] CHANGELOG 已更新（如需要）

---

## v0.2 Artifact Links

- Plan Artifact: [链接或路径]
- Implementation Report: [链接或路径]
- Review Artifact: [链接或路径]
- Rollback Plan: [链接或路径]

## Human Gate Checklist

- [ ] Plan was reviewed before implementation
- [ ] File boundaries were respected
- [ ] Tests were run and results are documented
- [ ] Risks are documented
- [ ] Rollback option is documented
- [ ] Human owner reviewed this PR

## CI Result

- [ ] GitHub Actions passed
- [ ] GitHub Actions failed and the failure is explained
- [ ] CI not applicable

## Launch Gate Readiness

- [ ] Not a launch-related PR
- [ ] Launch metrics are defined
- [ ] Feedback collection plan exists
- [ ] Rollback plan exists
