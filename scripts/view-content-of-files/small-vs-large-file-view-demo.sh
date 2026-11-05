#!/bin/bash
# Session 9 — when to use cat vs head/tail/more/less
set -euo pipefail

echo "=== Small file: cat is fine (full dump at once) ==="
WORK="${TMPDIR:-/tmp}/linux-view-content-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
echo "hello friends" > "$WORK/small.txt"
cat "$WORK/small.txt"

echo ""
echo "=== Large file: prefer head/tail (not whole cat) ==="
if [[ -f /etc/passwd ]]; then
  echo "--- head -5 /etc/passwd ---"
  head -5 /etc/passwd
  echo "--- tail -3 /etc/passwd ---"
  tail -3 /etc/passwd
else
  echo "/etc/passwd not found on this system"
fi

echo ""
echo "Durga Sir: small file -> cat; huge content -> head, tail, more, or less."
