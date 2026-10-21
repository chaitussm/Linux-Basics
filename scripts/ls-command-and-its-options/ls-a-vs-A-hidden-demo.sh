#!/bin/bash
# Session 7 — ls -a (all) vs ls -A (almost all: hide . and ..)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-hidden-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"
touch visible.txt
touch .hidden_rc

echo "=== ls — hidden dotfiles NOT shown ==="
ls
echo "count: $(ls | wc -l)"

echo ""
echo "=== ls -a — all, including . .. and dotfiles ==="
ls -a
echo "count: $(ls -a | wc -l)"

echo ""
echo "=== ls -A — almost all (no . and ..) ==="
ls -A
echo "count: $(ls -A | wc -l)"

echo ""
echo "Rule: name starting with '.' → hidden file (Session 7)"
