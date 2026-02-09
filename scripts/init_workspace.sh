#!/usr/bin/env bash
set -euo pipefail
WS="$HOME/URF_WORKSPACE"
mkdir -p "$WS"/{local_builds,temp_certs,notebooks,experiments,logs}
echo "Workspace initialized at $WS"
