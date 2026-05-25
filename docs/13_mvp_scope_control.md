# 13. MVP Scope Control

> MVP Gate 的范围控制方法。

---

## Purpose

控制 MVP 范围，防止 AI 把所有想法都做出来。MVP 只验证一个核心假设。

## When to use

- 通过 Idea Gate 后，准备进入实现前
- 定义 MVP 边界时

## Inputs

- Idea Validation Artifact
- 技术调研和选型结果

## Outputs

- MVP_SCOPE_ARTIFACT（参见 `.ai/artifacts/MVP_SCOPE_ARTIFACT_TEMPLATE.md`）

---

## 范围控制清单

### 1. 核心假设

本轮 MVP 只验证一个核心假设。用一句话写出来：

```text
我们认为 [目标用户] 在 [场景] 下 需要 [解决方案]，
如果 [验证指标] 达到 [阈值]，说明假设成立。
```

### 2. In scope（本轮做）

列出本轮 MVP 包含的功能，每个功能必须回答：
- 验证哪个假设？
- 是否可以更简单？

### 3. Out of scope（本轮不做）

列出明确不做的功能。这个列表和 In scope 一样重要。

### 4. 架构约束

- 哪些模块必须保持简单？
- 哪些地方不能过早抽象？
- 初期技术债的可接受范围

### 5. 安全 / 数据 / 隐私底线

- 哪些安全要求即使 MVP 也必须满足？
- 用户数据如何存储和保护？
- 哪些操作必须有人工确认？

### 6. 测试最低要求

- 上线前必须通过哪些测试？
- 哪些路径必须手动验证？

---

## Human checkpoint

- 决策：implement / narrow / redesign / pause
- 重点检查：Out of scope 列表是否真的排除了不该做的功能
- 如果发现"顺便加上"的想法，放回 Out of scope

## Rollback option

- 缩小范围（砍功能，不加功能）
- 重新选择核心假设
- 暂停，回退到 Idea Gate

---

## 常见失败模式

1. 没有排除项，什么都想做
2. 核心假设不止一个，导致无法判断 MVP 是否成功
3. 过早抽象，花时间在"未来可能需要"的架构上
4. 安全底线缺失，MVP 就引入数据风险
5. 测试要求为零，上线后无法判断是否正常工作
6. 范围 creep：实现过程中"顺便加上"新功能
