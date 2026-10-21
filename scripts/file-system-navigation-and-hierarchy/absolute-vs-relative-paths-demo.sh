#!/bin/bash
# Session 4 — absolute paths from / vs relative paths from cwd
set -euo pipefail

WORK="${TMPDIR:-/tmp}/linux-path-demo"
rm -rf "$WORK"
mkdir -p "$WORK/mydir"
cd "$WORK"

echo "=== cwd ==="
pwd

echo ""
echo "=== Relative: cd mydir ==="
cd mydir
pwd

echo ""
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
echo "=== From /, relative cd home -> /home (child directory named home) ==="
( cd / && cd home && pwd )

echo ""
echo "=== From /tmp, cd home usually fails (no home/ under /tmp) ==="
if ( cd /tmp && cd home 2>/dev/null ); then
  pwd
else
  echo "cd home from /tmp: failed (expected)"
fi

echo ""
echo "=== Absolute path works from any cwd ==="
ls -ld /home 2>/dev/null | head -1 || true
