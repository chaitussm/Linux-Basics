#!/bin/bash
# Session 9 — cat file1 file2 (concatenate and print)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-view-content-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "part-A" > file1.txt
echo "part-B" > file2.txt

echo "=== cat file1.txt file2.txt ==="
cat file1.txt file2.txt

echo ""
echo "Tip: cat concatenates and displays; cp copies files (different purpose)."
