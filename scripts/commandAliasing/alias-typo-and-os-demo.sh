#!/bin/bash
# Session 13 — typos (grp=grep) and OS habits (rename=mv)
set -euo pipefail
shopt -s expand_aliases

WORK="${TMPDIR:-/tmp}/linux-alias-typo-$$"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"
echo "hello grep me" > sample.txt

alias grp=grep
echo "=== typo alias grp=grep ==="
grp hello sample.txt

alias rename=mv
echo ""
echo "=== rename=mv (Windows habit) ==="
echo "new" > a.txt
rename a.txt b.txt
ls -1

rm -rf "$WORK"
