#!/bin/bash
# Session 7 — ls -R recursive (capital R); -r is reverse sort only
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-R-demo"
rm -rf "$WORK"
mkdir -p "$WORK/scripts/jj"
cd "$WORK"
echo "a" > scripts/a.txt
echo "b" > scripts/b.txt
touch scripts/jj/.keep

echo "=== ls scripts — does NOT show files inside jj/ by default ==="
ls scripts

echo ""
echo "=== ls -R — recursive: show subdirectory contents ==="
ls -R

echo ""
echo "Remember: -r = reverse alphabetical; -R = recursive"
