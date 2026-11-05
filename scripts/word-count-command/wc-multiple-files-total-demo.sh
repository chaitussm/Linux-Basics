#!/bin/bash
# Session 10 — wc on multiple files + total line
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-wc-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "alpha" > a.txt
echo "beta gamma" > b.txt

echo "=== wc a.txt b.txt (per file + total) ==="
wc a.txt b.txt
