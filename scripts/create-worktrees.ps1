# create-worktrees.ps1
#
# 辅助创建 git worktree，用于多 Agent 并行开发隔离
#
# 用法：
#   .\create-worktrees.ps1 -BranchName "feature/tag-filter" -WorktreeName "tag-filter"
#
# 功能：
#   - 检查 git 状态是否干净
#   - 生成 git worktree add 命令
#   - 默认不执行破坏性操作（需要 -Execute 参数才会真正执行）
#   - 提醒用户先确认 git 状态

param(
    [Parameter(Mandatory=$true)]
    [string]$BranchName,

    [Parameter(Mandatory=$false)]
    [string]$WorktreeName = "",

    [switch]$Execute
)

$ErrorActionPreference = "Stop"

$projectRoot = Join-Path $PSScriptRoot ".."

# 如果未指定 WorktreeName，使用 BranchName 中的最后一段
if ([string]::IsNullOrWhiteSpace($WorktreeName)) {
    $WorktreeName = $BranchName -split "/" | Select-Object -Last 1
}

$worktreePath = Join-Path $projectRoot ".worktrees" $WorktreeName

Write-Host "Git Worktree Setup"
Write-Host "==================="
Write-Host ""

# 检查 git 状态
Write-Host "Checking git status..."
$gitStatus = git -C $projectRoot status --short 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Error "git status check failed. Make sure you are in a git repository."
    exit 1
}

if (-not [string]::IsNullOrWhiteSpace($gitStatus)) {
    Write-Warning "Git working directory is NOT clean!"
    Write-Warning "Uncommitted changes detected:"
    Write-Host $gitStatus
    Write-Host ""
    Write-Warning "Please commit or stash your changes before creating a worktree."
    Write-Host "  Stash: git stash"
    Write-Host "  Unstash later: git stash pop"
    exit 1
}

Write-Host "  Git status: clean"

# 检查 worktree 目录是否已存在
if (Test-Path $worktreePath) {
    Write-Error "Worktree directory already exists: $worktreePath"
    Write-Host "If you want to remove it, run:"
    Write-Host "  git worktree remove $worktreePath"
    exit 1
}

# 生成命令
$newBranchName = "$BranchName"
$command = "git worktree add `"$worktreePath`" -b $newBranchName"

Write-Host ""
Write-Host "Worktree Configuration:"
Write-Host "  Branch name: $newBranchName"
Write-Host "  Worktree path: $worktreePath"
Write-Host ""
Write-Host "Command to execute:"
Write-Host "  $command"
Write-Host ""

if ($Execute) {
    Write-Host "Executing command..."
    Invoke-Expression "git -C `"$projectRoot`" worktree add `"$worktreePath`" -b $newBranchName"

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "Worktree created successfully."
        Write-Host ""
        Write-Host "Next steps:"
        Write-Host "  1. Open a new terminal in: $worktreePath"
        Write-Host "  2. Start your AI coding agent in that directory"
        Write-Host "  3. When done, merge the branch and remove the worktree:"
        Write-Host "     git merge $newBranchName"
        Write-Host "     git worktree remove `"$worktreePath`""
    } else {
        Write-Error "Failed to create worktree. Check the error message above."
        exit 1
    }
} else {
    Write-Host "DRY RUN - No changes were made."
    Write-Host ""
    Write-Host "To execute for real, run:"
    Write-Host "  .\create-worktrees.ps1 -BranchName `"$BranchName`" -Execute"
    Write-Host ""
    Write-Host "IMPORTANT: Before executing, make sure you have committed all changes."
    Write-Host "Worktrees require a clean working tree."
}
