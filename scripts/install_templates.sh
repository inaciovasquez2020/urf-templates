#!/usr/bin/env bash
set -euo pipefail
TEMPLATE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPOS=(urf-core chronos-urf-rr flagship-lean urf-axioms urf-verifier urf-spine final-wall-fo-k-locality)
ROOT="$HOME/github-audit"
for r in "${REPOS[@]}"; do
  if [[ -d "$ROOT/$r" ]]; then
    echo "Installing templates into $r"
    cp "$TEMPLATE_ROOT/templates/"* "$ROOT/$r/" 2>/dev/null || true
  fi
done
echo "Templates installed."
