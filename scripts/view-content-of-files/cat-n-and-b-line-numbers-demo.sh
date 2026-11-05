#!/bin/bash
# Session 9 — cat -n and cat -b (blank lines)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-view-content-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

cat > abc.txt <<'EOF'
mango
apple

orange
banana
java
python
EOF

echo "=== cat abc.txt (shows blank lines too) ==="
cat abc.txt

echo ""
echo "=== cat -n abc.txt (number all lines, including blanks) ==="
cat -n abc.txt

echo ""
echo "=== cat -b abc.txt (number non-blank lines only) ==="
cat -b abc.txt
