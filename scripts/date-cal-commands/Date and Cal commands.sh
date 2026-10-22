#!/bin/bash
# Session 8 — runs split demos in this folder (run each *-demo.sh alone for clearer output)
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

run_demo() {
  local name="$1"
  echo ""
  echo "############################################"
  echo "# $name"
  echo "############################################"
  bash "$DIR/$name"
}

run_demo date-default-demo.sh
run_demo date-format-class-and-readable-demo.sh
run_demo date-log-timestamp-filename-demo.sh
run_demo cal-basic-month-and-options-demo.sh
run_demo cal-date-echo-group-demo.sh
