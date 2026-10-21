#!/bin/bash
# Session 7 — ls -l long format (type, permissions, links, owner, group, size, time, name)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-l-demo"
rm -rf "$WORK"
mkdir -p "$WORK/sub"
cd "$WORK"
echo "abc" > abcdef.txt
echo "plain" > plain.txt

echo "=== ls -l (long listing) ==="
ls -l

echo ""
echo "Column guide (Durga Sir):"
echo "  1st char     → file type (- file, d dir, l link, …)"
echo "  next 9 chars → permissions (detailed topic later)"
echo "  link count   → number of hard links"
echo "  owner, group → user and group name"
echo "  size         → file size in bytes"
echo "  date/time    → last modification (or metadata time)"
echo "  name         → file or directory name"
