#!/bin/bash
set -euo pipefail

BASE="${TMPDIR:-/tmp}/linux-nav-tree-demo"
rm -rf "$BASE"
mkdir -p "$BASE/Desktop/D1/D2/DR1/DR2"

echo "=== cd ~ then cd - (back to previous cwd) ==="
cd "$BASE/Desktop/D1/D2/DR1/DR2"
cd ~
echo "Home: $(pwd)"
cd -
echo "After cd -: $(pwd)"

echo ""
echo "=== compare: parent of DR2 is DR1 (cd ..), not 'previous' unless you used cd - ==="
cd "$BASE/Desktop/D1/D2/DR1/DR2"
cd ..
echo "Parent of DR2: $(pwd) (expected .../DR1)"
