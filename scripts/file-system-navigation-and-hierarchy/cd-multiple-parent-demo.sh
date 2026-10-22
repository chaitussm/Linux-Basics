#!/bin/bash
# Session 4 — chained cd .. (orchestrator)
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

run_demo() {
  local name="$1"
  echo ""
  echo "############################################"
  echo "# $name"
  echo "############################################"
  bash "$HERE/$name"
}

run_demo cd-chained-parent-paths-demo.sh
run_demo cd-three-dots-invalid-demo.sh
