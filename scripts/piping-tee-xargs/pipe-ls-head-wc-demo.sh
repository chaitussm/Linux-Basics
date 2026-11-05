#!/bin/bash
# Session 12 — pipe: connect stdout of ls to stdin of head / wc
set -euo pipefail

echo "=== ls -l /etc | head (first 10 lines only) ==="
ls -l /etc | head || true

echo ""
echo "=== ls -l /etc | wc -l (count lines — includes total line from ls -l) ==="
ls -l /etc | wc -l
