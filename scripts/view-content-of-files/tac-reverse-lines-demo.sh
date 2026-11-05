#!/bin/bash
# Session 9 — tac: reverse line order (vertical reverse of cat)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-view-content-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

cat > abc.txt <<'EOF'
sunny
bunny
chini
vinnie
pini
EOF

echo "=== cat abc.txt (normal top-to-bottom) ==="
cat abc.txt

echo ""
echo "=== tac abc.txt (last line becomes first) ==="
tac abc.txt
