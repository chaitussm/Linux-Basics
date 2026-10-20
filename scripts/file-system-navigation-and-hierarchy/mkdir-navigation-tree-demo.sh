#!/bin/bash
# Session 4 — Durga Sir style nested Desktop/D1/D2/... navigation
set -euo pipefail

BASE="${TMPDIR:-/tmp}/linux-nav-tree-demo"
rm -rf "$BASE"
mkdir -p "$BASE/Desktop/D1/D2/DR1/DR2"
cd "$BASE/Desktop"

echo "=== Tree created under $BASE ==="
find "$BASE" -type d | sort

echo ""
echo "=== pwd on 'Desktop' ==="
pwd

echo ""
echo "=== cd D1/D2/DR1/DR2 (relative) ==="
cd D1/D2/DR1/DR2
pwd

echo ""
echo "=== cd .. (parent -> DR1) ==="
cd ..
pwd

echo ""
echo "=== cd .. (parent -> D2) ==="
cd ..
pwd

echo ""
echo "=== cd ~ then cd - (back to previous cwd) ==="
cd ~
echo "Home: $(pwd)"
cd -
echo "After cd -: $(pwd)"

echo ""
echo "=== compare: parent of DR2 is DR1 (cd ..), not 'previous' unless you used cd - ==="
cd "$BASE/Desktop/D1/D2/DR1/DR2"
cd ..
echo "Parent of DR2: $(pwd) (expected .../DR1)"
