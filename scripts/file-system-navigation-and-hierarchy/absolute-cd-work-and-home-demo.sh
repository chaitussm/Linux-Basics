#!/bin/bash
set -euo pipefail

WORK="${TMPDIR:-/tmp}/linux-path-demo"
rm -rf "$WORK"
mkdir -p "$WORK/mydir"
cd "$WORK/mydir"

echo "=== Absolute: cd $WORK (from anywhere under tree) ==="
cd "$WORK"
pwd

echo ""
echo "=== /home is absolute (exists on typical Linux) ==="
if [[ -d /home ]]; then
  ls -ld /home
else
  echo "/home not present on this system (unusual)"
fi

echo ""
echo "=== Absolute path works from any cwd ==="
ls -ld /home 2>/dev/null | head -1 || true
