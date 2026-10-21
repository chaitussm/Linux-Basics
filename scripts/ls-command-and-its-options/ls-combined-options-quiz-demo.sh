#!/bin/bash
# Session 7 — combine options; order usually irrelevant; ls -ai, ls -lAtr
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-combo-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"
touch .hidden
touch visible.txt
sleep 1
touch newer.txt

echo "=== ls -ai (all files + inode) ==="
ls -ai

echo ""
echo "=== ls -lAtr (long, almost-all, time, reverse → oldest first) ==="
ls -lAtr

echo ""
echo "=== ls -r vs ls -ltr are NOT the same (-r = name reverse, -ltr = time oldest first) ==="
echo "ls -r:"; ls -r
echo "ls -ltr:"; ls -ltr

echo ""
echo "Single hyphen once: ls -ltr  (not ls -l -t -r required)"
