#!/bin/bash
# Session 4 — pwd and cd into nested relative path
set -euo pipefail

WORK="${TMPDIR:-/tmp}/linux-pwd-cd-demo"
rm -rf "$WORK"
mkdir -p "$WORK/nested/deep"
cd "$WORK"

echo "=== pwd (current directory) ==="
pwd

echo ""
echo "=== cd nested/deep (relative path) ==="
cd nested/deep
pwd
