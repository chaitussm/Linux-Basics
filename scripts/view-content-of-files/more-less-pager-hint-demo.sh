#!/bin/bash
# Session 9 — more / less pagers (non-interactive hint for scripts/CI)
set -euo pipefail

TARGET="${1:-/etc/passwd}"
if [[ ! -f "$TARGET" ]]; then
  echo "Usage: $0 [file]   (default: /etc/passwd)"
  exit 0
fi

echo "=== more and less are INTERACTIVE pagers (q to quit) ==="
echo "On your laptop try:  less $TARGET"
echo "                     more $TARGET"

echo ""
echo "=== Non-interactive preview (first 12 lines, like opening a pager) ==="
head -12 "$TARGET"

echo ""
echo "less is stronger than more: scroll forward AND backward (Page Up/Down)."
