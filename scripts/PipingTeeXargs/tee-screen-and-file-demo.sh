#!/bin/bash
# Session 12 — tee: output to terminal AND file (T-junction)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-tee-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== ls -l | tee listing.txt (see screen + file) ==="
ls -l | tee listing.txt
echo "--- file contents ---"
wc -l listing.txt
