#!/bin/bash
# Session 7 — pipe ls to head/tail when listing is huge (e.g. /etc)
set -euo pipefail
TARGET="${1:-/etc}"

echo "=== Total lines: ls -l $TARGET | wc -l ==="
total=$(ls -l "$TARGET" 2>/dev/null | wc -l)
echo "$total"

echo ""
echo "=== ls -l $TARGET | head (default 10 lines) ==="
ls -l "$TARGET" 2>/dev/null | head

echo ""
echo "=== ls -l $TARGET | head -3 ==="
ls -l "$TARGET" 2>/dev/null | head -3

echo ""
echo "=== ls -l $TARGET | tail (default last 10) ==="
ls -l "$TARGET" 2>/dev/null | tail

echo ""
echo "=== ls -l $TARGET | tail -3 ==="
ls -l "$TARGET" 2>/dev/null | tail -3
