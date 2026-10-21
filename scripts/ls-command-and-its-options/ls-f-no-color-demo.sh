#!/bin/bash
# Session 7 — ls -f: disable color; Durga Sir — blue often means directory (not portable)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-f-demo"
rm -rf "$WORK"
mkdir -p "$WORK/mydir"
cd "$WORK"
touch file.txt
touch .dotfile

echo "=== ls (colors depend on distro/theme — not standard for exams) ==="
ls --color=auto 2>/dev/null || ls

echo ""
echo "=== ls -f — no color; also lists entries like -a (includes dotfiles on GNU ls) ==="
ls -f

echo ""
echo "Prefer ls -l or ls -F for portable type info, not colors."
