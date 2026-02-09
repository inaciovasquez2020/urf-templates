#!/usr/bin/env bash
set -euo pipefail

# Usage: scripts/install_metadata_pipeline_into_repo.sh /path/to/repo
REPO="${1:-}"
if [[ -z "$REPO" ]]; then
  echo "Usage: $0 </path/to/repo>"
  exit 2
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
B="$ROOT/bundles/metadata-pipeline"

mkdir -p "$REPO/.github/workflows" "$REPO/meta" "$REPO/atlas" "$REPO/tools"

cp "$B/.github/workflows/meta-pipeline.yml" "$REPO/.github/workflows/meta-pipeline.yml"
cp -R "$B/meta/." "$REPO/meta/"
cp -R "$B/atlas/." "$REPO/atlas/"
cp -R "$B/tools/." "$REPO/tools/"

# Do not leave placeholder manifest: force rebuild list (repo-specific)
if [[ -x "$REPO/tools/compile_dag.py" ]]; then
  (cd "$REPO" && python3 -m pip install -r tools/requirements.txt >/dev/null 2>&1 || true)
  (cd "$REPO" && ./tools/compile_dag.py >/dev/null 2>&1 || true)
fi

echo "Installed metadata pipeline into $REPO"
echo "Next: in repo, regenerate meta/MANIFEST.sha256 with your canonical file list, then commit."
