#!/bin/bash
# Session 3 — ls -l first character = file type
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-type-demo"
rm -rf "$WORK"
mkdir -p "$WORK/subdir"
cd "$WORK"

echo "ordinary" > plain.txt
ln -s plain.txt link.txt
echo "=== ls -l in demo dir (note 1st column) ==="
ls -l
echo ""
echo "Key: - = ordinary, d = directory, l = symlink"
echo ""
echo "=== Sample device entries under /dev (first lines) ==="
ls -l /dev/null /dev/zero /dev/pts 2>/dev/null | head -20 || ls -l /dev | head -15
