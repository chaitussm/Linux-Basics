#!/bin/bash
# Session 8 — timestamp for log file names
set -euo pipefail

echo "=== timestamp variable for log file name ==="
STAMP=$(date +%Y%m%d-%H%M%S)
LOG="${TMPDIR:-/tmp}/linux-basics-log-${STAMP}.txt"
echo "Sample log line at $(date)" > "$LOG"
echo "Created: $LOG"
ls -l "$LOG"
