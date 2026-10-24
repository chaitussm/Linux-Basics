#!/bin/bash
# Session 9 — tail: bottom of file (default 10 lines)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-view-content-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

seq 1 20 > abc.txt

echo "=== tail abc.txt (default: last 10 lines) ==="
tail abc.txt

echo ""
echo "=== tail -n 5 abc.txt (last 5 lines) ==="
tail -n 5 abc.txt

echo ""
echo "=== tail -5 abc.txt (same idea: last 5) ==="
tail -5 abc.txt
