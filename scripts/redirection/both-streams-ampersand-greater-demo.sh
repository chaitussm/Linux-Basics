#!/bin/bash
# Session 11 — &> and &>> : stdout and stderr to the same file
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-redirection-s11"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== cal 2024 &> results1.txt (success output in file) ==="
cal 2024 &> results1.txt
head -5 results1.txt

echo ""
echo "=== cal 99999 &>> results1.txt (error appended to same file) ==="
set +e
cal 99999 &>> results1.txt
set -e
echo "--- tail of results1.txt ---"
tail -5 results1.txt
