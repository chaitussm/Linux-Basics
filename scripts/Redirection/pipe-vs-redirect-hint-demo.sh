#!/bin/bash
# Redirection — | is not > (see pipeCommands.md)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-redirection-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
OUT="$WORK/out.txt"

echo "=== Pipe: ls | head -3 (program to program) ==="
ls /bin | head -3

echo ""
echo "=== Redirect: echo hello > out.txt (program to file) ==="
echo hello > "$OUT"
cat "$OUT"
