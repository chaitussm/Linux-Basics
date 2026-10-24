#!/bin/bash
# Session 9 — cat: display file content (Durga Sir)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-view-content-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

cat > file1.txt <<'EOF'
mango
apple
orange
EOF

echo "=== cat file1.txt (view full small file) ==="
cat file1.txt

echo ""
echo "=== cat < file1.txt (optional input redirect — same idea) ==="
cat < file1.txt
