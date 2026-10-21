#!/bin/bash
# Session 4 — ls -a shows . and ..
set -euo pipefail

WORK="${TMPDIR:-/tmp}/linux-ls-dot-demo"
rm -rf "$WORK"
mkdir -p "$WORK/child"
cd "$WORK"

echo "=== ls (no -a) — dot entries usually hidden ==="
ls

echo ""
echo "=== ls -a — note . and .. ==="
ls -a

echo ""
echo "=== Inside child/ ==="
cd child
ls -a

echo ""
echo "cd .. returns to parent ($(cd .. && pwd))"
