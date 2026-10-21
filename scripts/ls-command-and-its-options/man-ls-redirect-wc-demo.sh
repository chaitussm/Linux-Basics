#!/bin/bash
# Session 7 — man ls, quit with q; redirect man to file; wc -l
set -euo pipefail
OUT="${TMPDIR:-/tmp}/ls-man-page-demo.txt"

echo "=== man ls (first 15 lines; full manual: run 'man ls' and press q to quit) ==="
if MANWIDTH=80 man ls 2>/dev/null | head -15; then
  echo "(truncated — use: man ls)"
else
  echo "man not available in this environment; try: ls --help | head -20"
  ls --help 2>/dev/null | head -20 || true
fi

echo ""
echo "=== man ls > file  (redirection saves documentation) ==="
if MANWIDTH=80 man ls >"$OUT" 2>/dev/null; then
  echo "Wrote: $OUT"
  echo "Line count (wc -l): $(wc -l < "$OUT")"
  echo "Extension not important on Linux — any filename works."
else
  ls --help >"$OUT" 2>/dev/null || echo "help text" >"$OUT"
  echo "Fallback wrote: $OUT ($(wc -l < "$OUT") lines)"
fi
