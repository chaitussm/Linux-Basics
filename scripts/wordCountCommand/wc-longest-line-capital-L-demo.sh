#!/bin/bash
# Session 10 — wc -L : length of the longest line (capital L, not -l)
set -euo pipefail
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
FILE="$REPO/scripts/linuxbasics/fileinfo.txt"

if [[ ! -f "$FILE" ]]; then
  echo "Missing lab file: $FILE"
  exit 1
fi

echo "=== cat fileinfo.txt (find longest line by eye) ==="
cat -n "$FILE"

echo ""
echo "=== wc -L fileinfo.txt (longest line length in bytes) ==="
wc -L "$FILE"

echo ""
echo "Remember: -l (small L) = line COUNT; -L (capital L) = longest LINE length"
