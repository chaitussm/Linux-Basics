#!/bin/bash
# Session 4 — /bin, /sbin, /etc (orchestrator)
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

run_demo which-command-paths-demo.sh
run_demo bin-and-sbin-ls-sample-demo.sh
run_demo etc-config-files-head-demo.sh
