#!/bin/bash
# Session 12 — xargs: turn stdin into command-line arguments
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-xargs-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== echo names | xargs touch (create three files) ==="
echo "apple banana cherry" | xargs touch
ls -1 apple banana cherry

echo ""
echo "=== printf lines | xargs -n 2 echo (two words per echo) ==="
printf 'one two three four\n' | xargs -n 2 echo
