#!/bin/bash
# Session 11 — Redirection (streams 0/1/2, >, 2>, <, &>)
# Runs split demos under scripts/redirection/ then scripts/Redirection/ (EOF, Rama/Sita)
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

for d in "$ROOT/redirection" "$ROOT/Redirection"; do
  if [[ -d "$d" ]]; then
    while IFS= read -r -d '' script; do
      run_demo "$script"
    done < <(find "$d" -maxdepth 1 -name '*-demo.sh' -print0 | sort -z)
  fi
done
