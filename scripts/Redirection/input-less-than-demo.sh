#!/bin/bash
# Redirection — < sends file as command input
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-redirection-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
FILE="$WORK/sample.txt"
echo "line from file" > "$FILE"

echo "=== cat < sample.txt ==="
cat < "$FILE"

echo ""
echo "=== cat sample.txt (same idea for cat) ==="
cat "$FILE"
