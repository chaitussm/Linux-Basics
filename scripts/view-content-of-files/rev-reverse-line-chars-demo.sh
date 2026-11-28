#!/bin/bash
# Session 9 — rev: reverse characters on each line (horizontal reverse)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-view-content-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "chini" > abc.txt

echo "=== cat abc.txt ==="
cat abc.txt

echo ""
echo "=== rev abc.txt (chini -> inihc) ==="
rev abc.txt

echo ""
echo "Tip: tac = reverse line order; rev = reverse each line left-to-right."
