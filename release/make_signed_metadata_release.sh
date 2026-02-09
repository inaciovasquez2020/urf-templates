#!/usr/bin/env bash
set -euo pipefail

# Usage: ./release/make_signed_metadata_release.sh <tag>
# Produces dist/<tag>/metadata.tar.gz, metadata.tar.gz.sha256, optional metadata.tar.gz.asc

TAG="${1:-}"
if [[ -z "$TAG" ]]; then
  echo "Usage: $0 <tag>"
  exit 1
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIST="$ROOT/dist/$TAG"
mkdir -p "$DIST"

# Ensure deterministic artifacts are current (best effort)
if [[ -x "$ROOT/tools/compile_dag.py" ]]; then
  "$ROOT/tools/compile_dag.py" >/dev/null || true
fi

tar -czf "$DIST/metadata.tar.gz" meta atlas tools .github/workflows 2>/dev/null || tar -czf "$DIST/metadata.tar.gz" meta atlas tools
shasum -a 256 "$DIST/metadata.tar.gz" > "$DIST/metadata.tar.gz.sha256"

# Optional signing if gpg exists + configured
if command -v gpg >/dev/null 2>&1; then
  gpg --armor --detach-sign "$DIST/metadata.tar.gz" 2>/dev/null || true
fi

echo "Wrote $DIST/metadata.tar.gz (+ .sha256 and optional .asc)"
