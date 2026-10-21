#!/bin/bash
# Session 7 — ls -lt (newest first) vs ls -ltr (oldest first)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-time-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

touch old.txt
sleep 1
touch middle.txt
sleep 1
touch newest.txt

echo "=== ls -l (alphabetical by name, not time) ==="
ls -l

echo ""
echo "=== ls -lt (long + sort by time, newest at TOP) ==="
ls -lt

echo ""
echo "=== ls -ltr (long + time + reverse → oldest at TOP) ==="
ls -ltr

echo ""
echo "Option order does not matter: ls -rtl same as ls -ltr"
