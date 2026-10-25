#!/bin/bash
# Session 11 — stdin < ; combined cat < in > out 2> err
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-redirection-s11"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "Durga Sir sample line" > a.txt

echo "=== cat < a.txt (0< optional; same as cat a.txt for cat) ==="
cat < a.txt

echo ""
echo "=== cat < a.txt > result.txt 2> error.txt ==="
cat < a.txt > result.txt 2> error.txt
echo "--- result.txt ---"
cat result.txt
echo "--- error.txt (empty on success) ---"
wc -c error.txt

echo ""
echo "=== cat 0<a.txt >b.txt — optional 0 on stdin ==="
cat 0<a.txt >b.txt
cat b.txt
