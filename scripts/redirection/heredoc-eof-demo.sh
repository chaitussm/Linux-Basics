#!/bin/bash
# Redirection — heredoc <<EOF (overwrite and append)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-redirection-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
FILE="$WORK/appendData.sh"

cat > "$FILE" <<EOF
Rama
Sita
EOF
echo "=== cat > file <<EOF (overwrite with two lines) ==="
cat "$FILE"

echo ""
cat >> "$FILE" <<EOF
Hanuman
EOF
echo "=== after cat >> file <<EOF (append block) ==="
cat "$FILE"
