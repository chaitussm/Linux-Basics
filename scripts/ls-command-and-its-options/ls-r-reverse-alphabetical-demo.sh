#!/bin/bash
# Session 7 — ls -r reverse alphabetical order
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-r-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"
for n in desktop documents downloads music public scripts templates videos; do
  mkdir -p "$n"
done

echo "=== ls (default alphabetical) ==="
ls

echo ""
echo "=== ls -r (reverse alphabetical) — videos first, desktop last ==="
ls -r
