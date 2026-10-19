#!/bin/bash
# Bash Built-in Commands.md — cat: display file contents (Durga Sir Session 3)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-cat-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "hello friends" > sunny.durga
echo "=== cat sunny.durga ==="
cat sunny.durga

echo ""
echo "=== cat with line numbers (optional) ==="
cat -n sunny.durga
