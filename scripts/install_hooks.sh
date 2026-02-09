#!/usr/bin/env bash
set -euo pipefail
HOOK_DIR="$HOME/.git-hooks"
mkdir -p "$HOOK_DIR"
cat > "$HOOK_DIR/pre-push" <<'HOOK'
#!/usr/bin/env bash
set -e
branch="$(git rev-parse --abbrev-ref HEAD)"
git fetch origin
git rebase origin/"$branch"
HOOK
chmod +x "$HOOK_DIR/pre-push"
git config --global core.hooksPath "$HOOK_DIR"
echo "Global hooks installed."
