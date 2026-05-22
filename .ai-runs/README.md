# .ai-runs/ Directory

> 本目录存放每次 AI coding 任务的过程记录。

---

## 用途说明

每次 AI coding 任务（无论是单 Agent 还是多 Agent），都应在 `.ai-runs/` 下创建一个子目录，记录过程文件。这些记录帮助复盘和追溯。

---

## 目录结构

每次 AI run 建议的子目录结构：

```text
.ai-runs/
└── [run-name]/
    ├── project-brief.md        # 本次 run 的任务简介
    ├── supervisor-notes.md     # 监督 Agent 的笔记
    ├── human-feedback.md       # 用户的反馈记录
    ├── agents/                 # 各 Agent 的检查点报告
    │   ├── ui-agent/
    │   ├── logic-agent/
    │   ├── test-agent/
    │   └── docs-agent/
    ├── logs/                   # 终端日志（被 .gitignore 排除）
    └── tmp/                    # 临时文件（被 .gitignore 排除）
```

---

## 命名建议

Run 名称建议格式：`YYYY-MM-DD-short-description`

例如：`2024-07-01-add-search-feature`

---

## 注意事项

- `logs/` 和 `tmp/` 子目录被 `.gitignore` 排除，不会提交到仓库。
- `project-brief.md`、`supervisor-notes.md`、`human-feedback.md` 等文本文件会提交到仓库。
- 不要在 `.ai-runs/` 中存放敏感信息（API key、密码等）。
- 定期清理过时的 run 记录。
