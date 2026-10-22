#!/bin/bash
# Session 4 — pwd, cd, ~, ., .., cd - (orchestrator; run split demos for clearer output)
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

run_demo pwd-and-cd-relative-demo.sh
run_demo cd-dot-and-parent-demo.sh
run_demo cd-home-and-tilde-demo.sh
run_demo cd-previous-directory-demo.sh
