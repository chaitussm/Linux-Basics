#!/bin/bash
# Session 4 — FHS: list / and brief notes on common top-level dirs (orchestrator)
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

run_demo fhs-root-ls-slash-demo.sh
run_demo fhs-directories-tour-part1-demo.sh
run_demo fhs-directories-tour-part2-demo.sh
