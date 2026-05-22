# collect-agent-state.ps1
#
# 收集当前 git 状态和 diff，保存到指定 run 目录
#
# 用法：
#   .\collect-agent-state.ps1 -RunName "2024-07-01-add-search-feature"
#
# 功能：
#   - 输出 git status
#   - 输出 git diff --stat
#   - 保存到 .ai-runs/{RunName}/supervisor-context.md
#   - 不自动提交
#   - 不自动合并

param(
    [Parameter(Mandatory=$true)]
    [string]$RunName
)

$ErrorActionPreference = "Stop"

$runsDir = Join-Path $PSScriptRoot ".." ".ai-runs"
$runDir = Join-Path $runsDir $RunName

# 检查 run 目录是否存在
if (-not (Test-Path $runDir)) {
    Write-Error "Run directory not found: $runDir"
    Write-Host "Run init-run.ps1 first to create the run directory."
    exit 1
}

$projectRoot = Join-Path $PSScriptRoot ".."

Write-Host "Collecting agent state for run: $RunName"

# 收集 git status
Write-Host "  Collecting git status..."
$gitStatus = git -C $projectRoot status --short 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Warning "git status failed: $gitStatus"
    $gitStatus = "[git status unavailable]"
}

# 收集 git diff --stat
Write-Host "  Collecting git diff --stat..."
$gitDiffStat = git -C $projectRoot diff --stat 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Warning "git diff --stat failed: $gitDiffStat"
    $gitDiffStat = "[git diff --stat unavailable]"
}

# 收集 git log (最近 10 条)
Write-Host "  Collecting recent git log..."
$gitLog = git -C $projectRoot log --oneline -10 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Warning "git log failed: $gitLog"
    $gitLog = "[git log unavailable]"
}

# 收集当前分支
$currentBranch = git -C $projectRoot branch --show-current 2>&1
if ($LASTEXITCODE -ne 0) {
    $currentBranch = "[unknown]"
}

# 生成 supervisor-context.md
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$context = @"
# Supervisor Context: $RunName

Generated at: $timestamp

## Current Branch

$currentBranch

## Git Status

``````
$gitStatus
``````

## Git Diff Stat

``````
$gitDiffStat
``````

## Recent Commits

``````
$gitLog
``````

## Notes

[Supervisor agent: Add your analysis here]
"@

$contextPath = Join-Path $runDir "supervisor-context.md"
Set-Content -Path $contextPath -Value $context -Encoding UTF8

Write-Host ""
Write-Host "Agent state collected and saved to: $contextPath"
Write-Host ""
Write-Host "NOTE: This script does NOT auto-commit or auto-merge."
Write-Host "Review the generated context before sharing with the supervisor agent."
