#!/bin/bash
# Session 7 — ls = list; cwd vs ls <directory>
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-basic-demo"
rm -rf "$WORK"
mkdir -p "$WORK/scripts/jj"
cd "$WORK"
echo "sample" > scripts/a.txt
echo "sample" > scripts/b.txt
echo "demo" > scripts/test.sh
chmod +x scripts/test.sh

echo "=== ls (no args) — current working directory, alphabetical order ==="
ls

echo ""
echo "=== ls scripts — list inside given directory ==="
ls scripts

echo ""
echo "=== Durga Sir: without directory arg → cwd; with arg → that folder ==="
