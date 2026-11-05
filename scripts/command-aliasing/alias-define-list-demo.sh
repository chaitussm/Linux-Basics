#!/bin/bash
# Session 13 — define alias, list aliases, original command still works
set -euo pipefail
shopt -s expand_aliases

echo "=== alias cls=clear (Windows-style clear screen) ==="
alias cls=clear
type cls
cls
echo "(screen cleared above)"

echo ""
echo "=== original command clear still works ==="
echo "After alias, both cls and clear are valid (Durga Sir)."

echo ""
echo "=== alias with no arguments — list aliases (grep cls) ==="
alias | grep -E '^alias cls=' || true

echo ""
echo "=== valid quoting: alias c1='clear' and alias c2=\"clear\" ==="
alias c1='clear'
alias c2="clear"
type c1
type c2
