#!/bin/bash
# Session 4 — cd home (relative) vs cd /home (orchestrator)
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

run_demo cd-home-relative-fails-demo.sh
run_demo cd-slash-home-absolute-demo.sh
