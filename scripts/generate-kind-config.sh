#!/usr/bin/env bash
set -euo pipefail

# generate-kind-config.sh
# Produces `kindCluster/cluster.generated.yaml` by substituting `${HOST_ROOT}` in
# `kindCluster/cluster.yaml` with a resolved host path.

# Allow overriding HOST_ROOT; default to repo root (script's parent directory)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="${HOST_ROOT:-$(cd "${SCRIPT_DIR}/.." && pwd)}"

export HOST_ROOT="${REPO_ROOT}"

TEMPLATE_FILE="${REPO_ROOT}/kindCluster/cluster.yaml"
OUT_FILE="${REPO_ROOT}/kindCluster/cluster.generated.yaml"

if command -v envsubst >/dev/null 2>&1; then
  envsubst < "$TEMPLATE_FILE" > "$OUT_FILE"
  echo "Generated $OUT_FILE using envsubst (HOST_ROOT=$HOST_ROOT)"
else
  # Fallback to simple sed replacement (POSIX-safe)
  sed "s|\${HOST_ROOT}|${HOST_ROOT}|g" "$TEMPLATE_FILE" > "$OUT_FILE"
  echo "Generated $OUT_FILE using sed fallback (HOST_ROOT=$HOST_ROOT)"
fi

echo "Run: kind create cluster --config=$OUT_FILE"
