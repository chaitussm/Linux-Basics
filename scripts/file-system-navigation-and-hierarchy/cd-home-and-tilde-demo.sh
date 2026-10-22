#!/bin/bash
# Session 4 — cd with no args and cd ~
set -euo pipefail

WORK="${TMPDIR:-/tmp}/linux-pwd-cd-demo"
rm -rf "$WORK"
mkdir -p "$WORK/nested/deep"
cd "$WORK/nested/deep"

echo "=== cd (no args) -> home ==="
cd
pwd
echo "HOME=$HOME"

echo ""
echo "=== cd ~ (explicit home) ==="
cd ~
pwd
