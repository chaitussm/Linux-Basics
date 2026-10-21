#!/bin/bash
# Session 7 — page through long ls output: more (forward) vs less (forward+back); q to quit
set -euo pipefail
TARGET="${1:-/etc}"

echo "For interactive paging (Durga Sir demo):"
echo "  ls -l $TARGET | more    # Space = next page; q = quit"
echo "  ls -l $TARGET | less    # Page Up/Down; q = quit (more powerful)"
echo ""
echo "Non-interactive preview — first page via head -25:"
ls -l "$TARGET" 2>/dev/null | head -25
echo "..."
echo "(Run the more/less commands above in your own terminal to practice.)"
