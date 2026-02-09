#!/usr/bin/env bash
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: bootstrap_urf_repo.sh <repo-name>"
  exit 1
fi
REPO="$1"
ROOT="$HOME/github-audit"
TPL="$ROOT/urf-templates"
mkdir -p "$ROOT/$REPO"
cd "$ROOT/$REPO"
git init
git branch -M main
mkdir -p meta atlas tools .github/workflows
if [[ -f "$TPL/templates/urf_global_gitignore" ]]; then
  cp "$TPL/templates/urf_global_gitignore" .gitignore
fi
echo "# $REPO" > README.md
echo "URF repo $REPO bootstrapped."
