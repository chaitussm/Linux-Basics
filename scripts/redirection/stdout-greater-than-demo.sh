#!/bin/bash
# Session 11 — stdout redirect: > and >> ; optional 1> ; no space after 1
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-redirection-s11"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== ls > output.txt (stdout to file; screen quiet) ==="
ls -1 > output.txt
echo "--- contents of output.txt ---"
cat output.txt

echo ""
echo "=== echo line >> output.txt (append) ==="
echo "appended line" >> output.txt
cat output.txt

echo ""
echo "=== 1>same.txt — digit 1 must touch > (1>file not 1 > file) ==="
echo "via explicit 1>" 1>same.txt
cat same.txt

echo ""
echo "=== cat > keyboard.txt then type (here: one line via printf) ==="
printf 'hello from keyboard input\n' | cat > keyboard.txt
cat keyboard.txt
