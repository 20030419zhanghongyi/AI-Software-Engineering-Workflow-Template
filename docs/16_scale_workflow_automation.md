# 16. Scale Workflow Automation

> Scale Gate 的自动化审查方法。

---

## Purpose

决定哪些重复流程值得固化为 Skill / Script / CI / Docs。不是盲目自动化，而是把已验证有效的流程提炼成可复用资产。

## When to use

- 项目运行一段时间后，发现某些操作反复出现
- 进入 Scale Gate 时

## Inputs

- Retrospective 记录
- 操作频率数据
- 已有 Skills / Scripts / CI 列表

## Outputs

- SCALE_AUTOMATION_REVIEW_ARTIFACT（参见 `.ai/artifacts/SCALE_AUTOMATION_REVIEW_TEMPLATE.md`）

---

## 自动化判断框架

### 第一步：识别重复

| 问题 | 答案 |
|---|---|
| 哪些操作已经重复出现 3 次以上？ | [列出] |
| 每次操作是否遵循相同步骤？ | 是 / 否 |
| 过程中是否需要人的主观判断？ | 是 / 否 |

### 第二步：选择形式

| 条件 | 推荐形式 |
|---|---|
| 步骤固定、无需人判断 | CI（GitHub Actions） |
| 步骤固定、需要人确认输出 | Skill（Claude / Codex） |
| 步骤含少量判断、可参数化 | Script（PowerShell / Bash） |
| 步骤含大量主观判断 | Docs（文档化流程，人执行） |

### 第三步：验证后再固化

不要直接自动化。先：

1. 用文档记录流程，手动执行 2-3 次
2. 确认每次结果一致
3. 再封装成 Skill / Script / CI

---

## 固化清单

对每个自动化候选，填写：

```text
流程名称：
重复次数：
是否需要人判断：
建议形式：Skill / Script / CI / Docs
风险：
回退方式：如果自动化失败，如何回到手动
```

---

## Human checkpoint

- 决策：automate / keep manual / observe more
- 绝不能自动化的操作：删除数据、修改密钥、修改生产配置、merge、release
- 每个自动化决策都必须确认回退方式

## Rollback option

- 回退到手动流程（保留手动操作文档）
- 暂停自动化，继续观察
- 给自动化增加人工审查点

---

## 常见失败模式

1. 自动化了未验证的流程
2. 自动化需要人判断的步骤
3. 自动化后删除了手动流程文档，出问题时无法回退
4. 为了自动化而自动化，实际节省的时间很少
5. 忘记给自动化加上人工审查点
