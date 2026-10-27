#!/bin/bash
# Session 13 — long repeated command → short alias d20f (class lab)
set -euo pipefail
shopt -s expand_aliases

WORK="${TMPDIR:-/tmp}/linux-alias-d20f-$$"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== long command (run once manually) ==="
echo 'mkdir -p dir1 && touch dir1/file{1..20}.txt'

echo ""
echo "=== alias d20f — same work in one nickname ==="
alias d20f='mkdir -p dir1 && touch dir1/file{1..20}.txt'
d20f
ls dir1 | wc -l
echo "files in dir1 (expect 20):"
ls dir1 | head -5
echo "..."

rm -rf "$WORK"
