#!/usr/bin/env bash
set -euo pipefail

ROOT="$HOME/github-audit"
TPL="$ROOT/urf-templates"

mkdir -p "$ROOT"

# Workspace
if [[ -x "$TPL/scripts/init_workspace.sh" ]]; then
  "$TPL/scripts/init_workspace.sh"
fi

# Global hooks
if [[ -x "$TPL/scripts/install_hooks.sh" ]]; then
  "$TPL/scripts/install_hooks.sh"
fi

# Global git alias
git config --global alias.syncd '!git fetch origin && git rebase origin/main && git push origin main'

# Global excludes (local-only)
touch ~/.gitignore_global
grep -q '^templates/$' ~/.gitignore_global || echo "templates/" >> ~/.gitignore_global
grep -q '^workspace/$' ~/.gitignore_global || echo "workspace/" >> ~/.gitignore_global
grep -q '^scratch/$' ~/.gitignore_global || echo "scratch/" >> ~/.gitignore_global
grep -q '^ip/$' ~/.gitignore_global || echo "ip/" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

echo "OK URF dev environment installed (workspace + hooks + aliases + global ignore)."
