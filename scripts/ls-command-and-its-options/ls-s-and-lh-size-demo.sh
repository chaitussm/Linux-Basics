#!/bin/bash
# Session 7 — ls -s blocks; ls -lh human-readable sizes with -l
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-size-demo"
rm -rf "$WORK"
mkdir -p "$WORK/adir"
cd "$WORK"
echo "hello friends" > demo.txt

echo "=== ls -s (size in 1K blocks, GNU ls) ==="
ls -s

echo ""
echo "=== ls -ls (long + block counts; dirs often show 4096 = 4 blocks) ==="
ls -ls

echo ""
echo "=== ls -lh (human-readable: K, M, G) ==="
ls -lh

echo ""
echo "=== ls -l (5th column = bytes for files) ==="
ls -l demo.txt
