#!/bin/bash
# Session 9 — rev/tac only print; cat still shows original file on disk
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-view-readonly-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
FILE="$WORK/sample.sh"

cat > "$FILE" <<'EOF'
#!/bin/bash
echo "All arguments with @ : $@"
EOF

echo "=== 1) Original file on disk (cat) ==="
cat "$FILE"

echo ""
echo "=== 2) rev — reversed CHARACTERS on screen only (file unchanged) ==="
rev "$FILE"

echo ""
echo "=== 3) cat again — same original order (proof file not modified) ==="
cat "$FILE"

echo ""
echo "=== 4) tac — reversed LINE order on screen (add second line first) ==="
printf 'line-one\nline-two\n' > "$WORK/two.txt"
tac "$WORK/two.txt"

echo ""
echo "=== 5) cat two.txt — still line-one then line-two on disk ==="
cat "$WORK/two.txt"

echo ""
echo "Tip: file changes only when you WRITE (>, >>, editor). Not from rev/tac/cat alone."
