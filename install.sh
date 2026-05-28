#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_dir="$repo_root/zotero-review-matrix"
target_root="$HOME/.codex/skills"
target_dir="$target_root/zotero-review-matrix"

if [[ ! -d "$source_dir" ]]; then
  echo "Skill folder not found: $source_dir" >&2
  exit 1
fi

mkdir -p "$target_root"
rm -rf "$target_dir"
cp -R "$source_dir" "$target_dir"

echo "Installed zotero-review-matrix to $target_dir"
echo "Restart Codex or open a new conversation to refresh the skill list."
