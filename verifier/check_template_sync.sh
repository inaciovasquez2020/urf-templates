#!/usr/bin/env bash
set -euo pipefail

# Compares target repos' copied files against urf-templates bundle versions.
# Usage: verifier/check_template_sync.sh <repo-path>...

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
B="$ROOT/bundles/metadata-pipeline"

FILES=(
  ".github/workflows/meta-pipeline.yml"
  "tools/compile_dag.py"
  "tools/verify_dag.py"
  "tools/verify_manifest.py"
  "tools/check_repo_hygiene.sh"
  "tools/check_dag_clean.sh"
  "tools/requirements.txt"
  "meta/dag.schema.json"
  "meta/lemmas.schema.yaml"
  "meta/deps.schema.yaml"
  "meta/constants.schema.yaml"
  "meta/regime.schema.yaml"
  "meta/tlg_instances.schema.yaml"
  "meta/pipeline_version.txt"
)

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <repo-path>..."
  exit 2
fi

for RP in "$@"; do
  echo "== $RP =="
  for f in "${FILES[@]}"; do
    src="$B/$f"
    dst="$RP/$f"
    if [[ ! -f "$src" ]]; then
      echo "FAIL missing template file: $f"
      exit 2
    fi
    if [[ ! -f "$dst" ]]; then
      echo "FAIL missing in repo: $f"
      exit 1
    fi
    if ! diff -q "$src" "$dst" >/dev/null; then
      echo "FAIL drift: $f"
      exit 1
    fi
  done
done

echo "OK template sync"
