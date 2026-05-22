# Example: Integration Review

> 这是一个合并前审查报告的示例。

---

## 合并前审查报告

### 概要

标签筛选功能的完整实现，包括 Logic 层筛选逻辑、Data 层查询函数、和 UI 层筛选界面。

### 修改文件汇总

| Agent | 修改文件 | 测试状态 |
|-------|---------|---------|
| Logic Agent | src/logic/tags.ts, src/logic/tags.test.ts | ✅ 通过 |
| Data Agent | src/data/tags.ts, src/data/tags.test.ts | ✅ 通过 |
| UI Agent | src/components/TagFilter.tsx, src/styles/tag-filter.css | ✅ 通过 |
| Test Agent | e2e/tag-filter.spec.ts | ✅ 通过 |
| Docs Agent | CHANGELOG.md | ✅ 更新 |

### 审查结论

- [x] ✅ 建议合并：所有条件满足
- [ ] ⚠️ 小修后合并
- [ ] ❌ 不建议合并
- [ ] 🔄 需要返工

### 需要人工重点检查

1. `src/data/tags.ts` 中 `getNotesByTags`：使用了 INTERSECT 查询，目前性能可接受，但建议关注
2. `src/components/TagFilter.tsx`：新增的标签筛选组件，请确认交互体验
3. `src/logic/tags.ts`：筛选逻辑的公开 API，请确认接口命名是否满意

### 风险评估

- 副作用：标签筛选不影响已有笔记浏览和搜索功能
- 性能观察：多标签筛选在笔记数 >10000 时可能需要优化，已记录到 Decision Log
- 级联删除：标签删除时的关联清理暂未处理，已创建 Technical Debt Issue #15

### 回滚方案

- 所有修改在独立分支 `feature/tag-filter` 上
- `git revert` 可安全回退
- 数据库 schema 无变更，回滚不影响数据

### 建议的合并顺序

1. Data 层修改（src/data/tags.ts）
2. Logic 层修改（src/logic/tags.ts）
3. UI 层修改（src/components/, src/styles/）
4. E2E 测试
5. CHANGELOG 更新

每层合并后运行对应测试确认无问题。
