#!/bin/bash
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
