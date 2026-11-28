#!/usr/bin/env bash
# Working with Files — Creation of hidden files and directories (Durga Sir)
set -euo pipefail

WORK="${TMPDIR:-/tmp}/linux-hidden-files-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== 1) Create hidden FILE — name must start with '.' ==="
touch .profile
touch .bashrc
touch visible.txt
echo "plain ls (hidden NOT listed):"
ls
echo ""
echo "ls -l visible vs hidden file:"
ls -l visible.txt .profile 2>/dev/null || ls -l visible.txt; ls -l .profile

echo ""
echo "=== 2) Create hidden DIRECTORY ==="
mkdir .config
mkdir .data
mkdir public_dir
echo "plain ls:"
ls
echo "ls -F (directories marked with /):"
ls -F

echo ""
echo "=== 3) ls -a vs ls -A ==="
echo "ls -a (ALL — includes . and ..):"
ls -a
echo "counts: plain=$(ls | wc -l)  -a=$(ls -a | wc -l)  -A=$(ls -A | wc -l)"

echo ""
echo "ls -A (almost all — hides only . and ..):"
ls -A

echo ""
echo "=== 4) Hide an EXISTING file with mv ==="
echo "secret data" > notes.txt
ls
mv notes.txt .notes.txt
echo "after mv to dot name:"
ls
ls -a

echo ""
echo "=== 5) Unhide — mv dot name back ==="
mv .notes.txt notes.txt
ls

echo ""
echo "=== 6) Every directory has . and .. ==="
pwd
ls -a | head -5

echo ""
echo "Rule: filename starting with '.' → hidden (not shown by plain ls)"