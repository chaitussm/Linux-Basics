#!/bin/bash
# Session 4 — pwd, cd, ~, ., .., cd -
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

echo ""
echo "=== cd . (stay here — same directory) ==="
cd .
pwd

echo ""
echo "=== cd .. (parent) ==="
cd ..
pwd

echo ""
echo "=== cd (no args) -> home ==="
cd
pwd
echo "HOME=$HOME"

echo ""
echo "=== cd ~ (explicit home) ==="
cd ~
pwd

echo ""
echo "=== cd - (previous directory) ==="
cd "$WORK/nested/deep"
echo "Now in: $(pwd)"
cd -
echo "After cd -: $(pwd)"

echo ""
echo "=== cd .. from deep again ==="
cd "$WORK/nested/deep"
cd ..
pwd
