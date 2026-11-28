#!/bin/bash
# Session 11 — Redirection (streams 0/1/2, >, 2>, <, &>)
# Runs all split demos in scripts/redirection/ (streams, >, 2>, <, &>, EOF/heredoc)
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

run_demo() {
  local path="$1"
  echo ""
  echo "############################################"
  echo "# $(basename "$path")"
  echo "############################################"
  bash "$path"
}

while IFS= read -r -d '' script; do
  run_demo "$script"
done < <(find "$ROOT" -maxdepth 1 -name '*-demo.sh' -print0 | sort -z)
