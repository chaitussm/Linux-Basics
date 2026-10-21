#!/bin/bash
# Session 4 — mkdir, cd, pwd, plain ls vs empty directory (Durga Sir dir1/dir2 demo)
set -euo pipefail

BASE="${TMPDIR:-/tmp}/linux-mkdir-ls-demo"
rm -rf "$BASE"
mkdir -p "$BASE/desktop"
cd "$BASE/desktop"

echo "=== mkdir dir1 (create directory) ==="
mkdir dir1
echo "=== cd dir1; mkdir dir2 inside ==="
cd dir1
mkdir dir2
cd dir2

echo ""
echo "=== pwd (full path to current working directory) ==="
pwd

echo ""
echo "=== plain ls in empty dir2 (no files created yet) ==="
ls
echo "(output empty — Durga Sir: 'nothing' until you create files)"

echo ""
echo "=== ls -a still shows . and .. in every directory ==="
ls -a

echo ""
echo "Tip: trailing slash on directory names is optional (cd desktop vs cd desktop/)"
