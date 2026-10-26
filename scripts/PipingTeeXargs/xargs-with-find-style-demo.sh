#!/bin/bash
# Session 12 — xargs + pipeline (list .sh files, run wc -l on each)
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../linuxbasics" && pwd)"

echo "=== ls *.sh in linuxbasics | xargs wc -l ==="
ls "$ROOT"/*.sh | xargs wc -l
