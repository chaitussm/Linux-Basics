#!/bin/bash
set -euo pipefail

BASE="${TMPDIR:-/tmp}/linux-mkdir-ls-demo"
mkdir -p "$BASE/desktop/dir1/dir2"
cd "$BASE/desktop/dir1/dir2"

echo "=== plain ls in empty dir2 (no files created yet) ==="
ls
echo "(output empty — Durga Sir: 'nothing' until you create files)"

echo ""
echo "=== ls -a still shows . and .. in every directory ==="
ls -a

echo ""
echo "Tip: trailing slash on directory names is optional (cd desktop vs cd desktop/)"
