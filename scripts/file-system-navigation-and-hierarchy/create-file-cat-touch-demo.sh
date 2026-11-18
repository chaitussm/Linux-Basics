#!/usr/bin/env bash
# Create files with touch and cat (Durga Sir lab pattern)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-basics-cat-touch-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== touch — zero-byte file ==="
touch demo.txt
ls -l demo.txt
file demo.txt

echo ""
echo "=== touch — multiple files ==="
touch a.txt b.txt c.txt
ls a.txt b.txt c.txt

echo ""
echo "=== cat > — create/overwrite with keyboard input ==="
cat > hello.txt <<'EOF'
line one
line two
EOF
cat hello.txt

echo ""
echo "=== cat >> — append ==="
echo "line three" >> hello.txt
cat hello.txt

echo ""
echo "Done. Workspace: $WORK"