#!/bin/bash
# Session 12 — Piping, tee, xargs (orchestrator)
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/PipingTeeXargs" && pwd)"

run_demo() {
  local name="$1"
  echo ""
  echo "############################################"
  echo "# $name"
  echo "############################################"
  bash "$DIR/$name"
}

for script in "$DIR"/*-demo.sh; do
  [[ -f "$script" ]] || continue
  run_demo "$(basename "$script")"
done
