#!/bin/bash
# Session 11 — stderr only: 2> and 2>> ; plain > does not capture errors
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-redirection-s11"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== cal with bad year — error on terminal if not redirected ==="
set +e
cal 99999
set -e

echo ""
echo "=== cal 99999 2> error.txt — stderr in file, stdout still on screen if any ==="
set +e
cal 99999 2> error.txt
set -e
echo "--- error.txt ---"
cat error.txt

echo ""
echo "=== ls > only.txt does NOT store cal-style errors (use 2>) ==="
set +e
cal 99999 > only.txt
set -e
echo "--- only.txt (often empty) ---"
cat only.txt || true
