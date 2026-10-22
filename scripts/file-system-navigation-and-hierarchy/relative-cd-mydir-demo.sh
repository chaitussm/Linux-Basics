#!/bin/bash
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
