#!/bin/bash
# Session 10 — wc -l : number of lines only
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-wc-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

seq 1 15 > numbers.txt

echo "=== wc numbers.txt (full) ==="
wc numbers.txt

echo ""
echo "=== wc -l numbers.txt (only line count) ==="
wc -l numbers.txt

echo ""
echo "Tip: when you need ONLY how many lines, use -l"
