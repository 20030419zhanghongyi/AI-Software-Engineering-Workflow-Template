# init-run.ps1
#
# 初始化一次 AI coding 运行的目录结构
#
# 用法：
#   .\init-run.ps1 -RunName "2024-07-01-add-search-feature"
#
# 功能：
#   - 在 .ai-runs/ 下创建以 RunName 为名的子目录
#   - 创建 project-brief.md、supervisor-notes.md、human-feedback.md
#   - 创建 agents/ 子目录（ui-agent、logic-agent、test-agent、docs-agent）
#   - 创建 logs/ 和 tmp/ 子目录
#   - 不执行危险操作（不自动 git commit、不自动合并）

param(
    [Parameter(Mandatory=$true)]
    [string]$RunName
)

$ErrorActionPreference = "Stop"

# 验证 RunName 不包含特殊字符
if ($RunName -match '[\\/:*?"<>|]') {
    Write-Error "RunName contains invalid characters: $RunName"
    exit 1
}

$runsDir = Join-Path $PSScriptRoot ".." ".ai-runs"
$runDir = Join-Path $runsDir $RunName

# 检查目录是否已存在
if (Test-Path $runDir) {
    Write-Error "Run directory already exists: $runDir"
    Write-Host "If you want to continue an existing run, use that directory directly."
    exit 1
}

# 检查 .ai-runs 目录是否存在
if (-not (Test-Path $runsDir)) {
    Write-Error ".ai-runs directory not found: $runsDir"
    Write-Host "Make sure you are running this script from the project root or scripts/ directory."
    exit 1
}

Write-Host "Initializing AI run: $RunName"
Write-Host "Directory: $runDir"

# 创建主目录
New-Item -ItemType Directory -Path $runDir -Force | Out-Null

# 创建 project-brief.md
$projectBrief = @"
# Project Brief: $RunName

## Date

$(Get-Date -Format "yyyy-MM-dd")

## Goal

[Describe the goal of this AI coding run]

## Context

[Provide context for this run]

## Scope

- Allowed:
- Forbidden:

## Acceptance Criteria

- [ ]
"@
Set-Content -Path (Join-Path $runDir "project-brief.md") -Value $projectBrief -Encoding UTF8

# 创建 supervisor-notes.md
$supervisorNotes = @"
# Supervisor Notes: $RunName

## State

Current state: Requirement Intake

## Notes

[Supervisor agent notes go here]

## Decisions

| Decision | Reason | Date |
|----------|--------|------|
"@
Set-Content -Path (Join-Path $runDir "supervisor-notes.md") -Value $supervisorNotes -Encoding UTF8

# 创建 human-feedback.md
$humanFeedback = @"
# Human Feedback: $RunName

[Feedback entries will be added here during the run]
"@
Set-Content -Path (Join-Path $runDir "human-feedback.md") -Value $humanFeedback -Encoding UTF8

# 创建 agents 子目录
$agents = @("ui-agent", "logic-agent", "test-agent", "docs-agent")
foreach ($agent in $agents) {
    $agentDir = Join-Path $runDir "agents" $agent
    New-Item -ItemType Directory -Path $agentDir -Force | Out-Null
}

# 创建 logs 和 tmp 子目录
New-Item -ItemType Directory -Path (Join-Path $runDir "logs") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $runDir "tmp") -Force | Out-Null

Write-Host ""
Write-Host "AI run initialized successfully."
Write-Host ""
Write-Host "Directory structure:"
Write-Host "  $runDir/"
Write-Host "  ├── project-brief.md"
Write-Host "  ├── supervisor-notes.md"
Write-Host "  ├── human-feedback.md"
Write-Host "  ├── agents/"
foreach ($agent in $agents) {
    Write-Host "  │   ├── $agent/"
}
Write-Host "  ├── logs/"
Write-Host "  └── tmp/"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Fill in project-brief.md with your task details"
Write-Host "  2. Start your supervisor agent with context from .ai/prompts/SUPERVISOR_SYSTEM_PROMPT.md"
Write-Host "  3. Copy checkpoint reports to the appropriate agents/ subdirectory"
