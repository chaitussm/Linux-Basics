#!/bin/bash
# Session 8 — Date and Cal commands (Durga Sir)
set -euo pipefail

echo "=== date (default) ==="
date

echo ""
echo "=== date + custom format (class style: day_month_year_hour_min_sec) ==="
date +%d_%m_%Y_%H_%M_%S

echo ""
echo "=== date + readable format ==="
date +"%d/%m/%Y %H:%M:%S"

echo ""
echo "=== timestamp variable for log file name ==="
STAMP=$(date +%Y%m%d-%H%M%S)
LOG="${TMPDIR:-/tmp}/linux-basics-log-${STAMP}.txt"
echo "Sample log line at $(date)" > "$LOG"
echo "Created: $LOG"
ls -l "$LOG"

echo ""
echo "=== cal (current month) ==="
if command -v cal >/dev/null 2>&1; then
  cal
else
  echo "cal not installed on this system"
fi

echo ""
echo "=== cal 10 2026 (month year) ==="
cal 10 2026 2>/dev/null || true

echo ""
echo "=== cal -y (full year) ==="
cal -y 2>/dev/null | head -20 || true

echo ""
echo "=== cal -3 (prev, current, next month) ==="
cal -3 2>/dev/null || true

echo ""
echo "=== cal -m (Monday as first day) — sample line ==="
cal -m 2>/dev/null | head -8 || true

echo ""
echo "=== Group like Video 2 test.sh ==="
cal 2>/dev/null || true
date
echo "Hello Friends. Welcome to Unix World."

echo ""
echo "Tip: man date && man cal"
