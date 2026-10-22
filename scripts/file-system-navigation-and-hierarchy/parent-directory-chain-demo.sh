#!/bin/bash
# Session 4 — current directory vs parent chain (orchestrator)
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

run_demo parent-chain-walk-up-demo.sh
run_demo parent-chain-at-root-demo.sh
