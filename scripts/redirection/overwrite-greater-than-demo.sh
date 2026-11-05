#!/bin/bash
# Redirection — > overwrites (truncates) the whole file
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-redirection-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
FILE="$WORK/appendData.sh"

echo Rama > "$FILE"
echo Sita >> "$FILE"
echo "=== After Rama > and Sita >> ==="
cat "$FILE"

echo ""
echo "=== echo Rama > file (Sita is removed) ==="
echo Rama > "$FILE"
cat "$FILE"
