#!/bin/bash
# Session 10 — wc file: lines, words, bytes, filename
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-wc-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

cat > fruits.txt <<'EOF'
mango
apple
orange
EOF

echo "=== wc fruits.txt (default — four fields) ==="
wc fruits.txt

echo ""
echo "Durga Sir order: lines | words | bytes | file name"
