#!/bin/bash
# Session 4 — chained cd .. (multiple parent steps in one command)
set -euo pipefail

BASE="${TMPDIR:-/tmp}/linux-multi-parent-demo"
rm -rf "$BASE"
mkdir -p "$BASE/desktop/d1/d2"
cd "$BASE/desktop/d1/d2"

echo "=== Start in d2 ==="
pwd

echo ""
echo "=== cd ..  -> parent d1 ==="
cd ..
pwd

echo ""
echo "=== cd ../.. (two parents in one path) -> desktop ==="
cd "$BASE/desktop/d1/d2"
cd ../..
pwd

echo ""
echo "=== cd ../../.. from d2 -> up three levels (d2 -> d1 -> desktop -> BASE) ==="
cd "$BASE/desktop/d1/d2"
cd ../../..
pwd

echo ""
echo "Note: 'cd .. ..' is invalid in Bash (too many arguments); use ../.. in one path."

echo ""
echo "=== cd ... (three dots) is INVALID — no such file or directory ==="
if ( cd "$BASE/desktop/d1/d2" && cd ... 2>/dev/null ); then
  pwd
else
  echo "cd ... failed (expected — only . and .. exist, not ...)"
fi
