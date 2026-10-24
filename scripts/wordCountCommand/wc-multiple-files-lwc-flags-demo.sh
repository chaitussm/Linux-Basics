#!/bin/bash
# Session 10 — wc -l / -w / -c on multiple files (per file + total)
set -euo pipefail
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
LAB="$REPO/scripts/linuxbasics"

for f in fileinfo.txt filedata.txt datfile.txt; do
  if [[ ! -f "$LAB/$f" ]]; then
    echo "Missing $LAB/$f — see wordCountCommand.md section 10 lab"
    exit 1
  fi
done

echo "=== wc -l (lines per file + total) ==="
wc -l "$LAB/fileinfo.txt" "$LAB/filedata.txt" "$LAB/datfile.txt"

echo ""
echo "=== wc -w (words per file + total) ==="
wc -w "$LAB/fileinfo.txt" "$LAB/filedata.txt" "$LAB/datfile.txt"

echo ""
echo "=== wc -c (bytes per file + total) ==="
wc -c "$LAB/fileinfo.txt" "$LAB/filedata.txt" "$LAB/datfile.txt"

echo ""
echo "=== wc -lc / -lw / -wc (combined flags, multiple files + total) ==="
wc -lc "$LAB/fileinfo.txt" "$LAB/filedata.txt" "$LAB/datfile.txt"
wc -lw "$LAB/fileinfo.txt" "$LAB/filedata.txt" "$LAB/datfile.txt"
wc -wc "$LAB/fileinfo.txt" "$LAB/filedata.txt" "$LAB/datfile.txt"
