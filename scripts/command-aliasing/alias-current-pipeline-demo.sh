#!/bin/bash
# Session 13 — alias current = ls -l | tee output.txt | wc -l (class)
set -euo pipefail
shopt -s expand_aliases

WORK="${TMPDIR:-/tmp}/linux-alias-current-$$"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"
touch f1.txt f2.txt f3.txt

alias current='ls -l | tee output.txt | wc -l'
echo "=== alias current (pipeline with tee) ==="
type current
current
echo "output.txt line count from wc:"
wc -l output.txt
cat output.txt

rm -rf "$WORK"
