#!/bin/bash
# Session 10 — wc -w : number of words only
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-wc-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

printf 'hello world\nlinux basics\nwc command\n' > sample.txt

echo "=== wc sample.txt (full) ==="
wc sample.txt

echo ""
echo "=== wc -w sample.txt (only word count) ==="
wc -w sample.txt

echo ""
echo "Word = text separated by spaces (whitespace)"
