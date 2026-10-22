#!/bin/bash
# Session 8 — cal current month, month/year, options
set -euo pipefail

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
