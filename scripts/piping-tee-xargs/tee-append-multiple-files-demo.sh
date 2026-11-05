#!/bin/bash
# Session 12 — tee -a append; tee can write multiple files
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-tee-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "first block" | tee log1.txt log2.txt
echo "second block" | tee -a log1.txt log2.txt

echo "=== log1.txt ==="
cat log1.txt
echo "=== log2.txt ==="
cat log2.txt
