#!/bin/bash
# Session 4 — mkdir, cd, pwd, plain ls vs empty directory (orchestrator)
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

run_demo mkdir-dir1-dir2-demo.sh
run_demo ls-empty-vs-dot-parent-demo.sh
