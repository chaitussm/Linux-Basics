#!/bin/bash
# Session 4 — cd - (previous directory)
set -euo pipefail

WORK="${TMPDIR:-/tmp}/linux-pwd-cd-demo"
rm -rf "$WORK"
mkdir -p "$WORK/nested/deep"
cd "$WORK"

cd "$WORK/nested/deep"
echo "=== cd - (previous directory) ==="
echo "Now in: $(pwd)"
cd -
echo "After cd -: $(pwd)"

echo ""
echo "=== cd .. from deep again ==="
cd "$WORK/nested/deep"
cd ..
pwd
