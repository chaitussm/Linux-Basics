#!/bin/bash
# Session 7 — ls -i show inode (index node) numbers
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-i-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"
echo "data" > sample.txt

echo "=== ls -i (inode number before name) ==="
ls -i

echo ""
echo "=== ls -li (long listing + inode) ==="
ls -li

echo "Inode stores metadata: size, owner, group, times, link count, …"
