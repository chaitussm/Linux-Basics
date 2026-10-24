#!/bin/bash
# Redirection — >> appends without deleting old lines
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-redirection-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
FILE="$WORK/appendData.sh"

echo Rama > "$FILE"
echo Sita >> "$FILE"
echo Lakshmana >> "$FILE"

echo "=== File built with > then >> ==="
cat -n "$FILE"
