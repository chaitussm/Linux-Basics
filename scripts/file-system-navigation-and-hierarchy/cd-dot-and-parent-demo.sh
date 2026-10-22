#!/bin/bash
# Session 4 — cd . and cd ..
set -euo pipefail

WORK="${TMPDIR:-/tmp}/linux-pwd-cd-demo"
rm -rf "$WORK"
mkdir -p "$WORK/nested/deep"
cd "$WORK/nested/deep"

echo "=== cd . (stay here — same directory) ==="
cd .
pwd

echo ""
echo "=== cd .. (parent) ==="
cd ..
pwd
