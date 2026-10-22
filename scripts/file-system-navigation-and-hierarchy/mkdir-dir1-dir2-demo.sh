#!/bin/bash
set -euo pipefail

BASE="${TMPDIR:-/tmp}/linux-mkdir-ls-demo"
rm -rf "$BASE"
mkdir -p "$BASE/desktop"
cd "$BASE/desktop"

echo "=== mkdir dir1 (create directory) ==="
mkdir dir1
echo "=== cd dir1; mkdir dir2 inside ==="
cd dir1
mkdir dir2
cd dir2

echo ""
echo "=== pwd (full path to current working directory) ==="
pwd
