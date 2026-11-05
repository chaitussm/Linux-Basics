#!/bin/bash
# Session 9 — head: top of file (default 10 lines)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-view-content-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

seq 1 20 > abc.txt

echo "=== head abc.txt (default: first 10 lines) ==="
head abc.txt

echo ""
echo "=== head -15 abc.txt (first 15 lines) ==="
head -15 abc.txt

echo ""
echo "=== head -n 5 abc.txt (first 5 lines) ==="
head -n 5 abc.txt

echo ""
echo "=== head -n -5 abc.txt (ALL lines EXCEPT last 5) ==="
head -n -5 abc.txt
