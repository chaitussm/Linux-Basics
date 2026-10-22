#!/bin/bash
set -euo pipefail

BASE="${TMPDIR:-/tmp}/linux-cd-home-demo"
rm -rf "$BASE"
mkdir -p "$BASE/desktop/d1/d2"
cd "$BASE/desktop/d1/d2"

echo "=== cwd is deep inside d2 (no 'home' folder here) ==="
pwd

echo ""
echo "=== cd home (relative) — looks for ./home under current directory ==="
if cd home 2>/dev/null; then
  pwd
else
  echo "Failed: no such file or directory (expected from d2)"
fi
