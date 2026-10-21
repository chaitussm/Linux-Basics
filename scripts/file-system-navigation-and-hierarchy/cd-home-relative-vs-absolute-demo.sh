#!/bin/bash
# Session 4 — cd home (relative) fails from nested dir; cd /home works
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

echo ""
echo "=== cd /home (absolute from /) — always the users' home parent dir ==="
if [[ -d /home ]]; then
  cd /home
  pwd
  ls -la /home | head -8
else
  echo "/home not on this system"
fi

echo ""
echo "Remember: /home exists only under root /, not as a relative name from random cwd."
