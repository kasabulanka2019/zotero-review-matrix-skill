$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$source = Join-Path $repoRoot "zotero-review-matrix"
$targetRoot = Join-Path $env:USERPROFILE ".codex\skills"
$target = Join-Path $targetRoot "zotero-review-matrix"

if (!(Test-Path -LiteralPath $source)) {
  throw "Skill folder not found: $source"
}

New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null
Copy-Item -Recurse -Force -Path $source -Destination $target

Write-Host "Installed zotero-review-matrix to $target"
Write-Host "Restart Codex or open a new conversation to refresh the skill list."
