#!/bin/bash
# Session 4 — Durga Sir style nested Desktop/D1/D2/... navigation (orchestrator)
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

run_demo nav-tree-create-and-descend-demo.sh
run_demo nav-tree-parent-vs-cd-dash-demo.sh
