#!/bin/bash
# Session 8 — same grouping as Components test.sh (cal, date, echo)
set -euo pipefail

echo "=== Group like Video 2 test.sh ==="
cal 2>/dev/null || true
date
echo "Hello Friends. Welcome to Unix World."

echo ""
echo "Tip: man date && man cal"
