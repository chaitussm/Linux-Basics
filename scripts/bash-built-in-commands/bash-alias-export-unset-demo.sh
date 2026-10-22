#!/bin/bash
set -euo pipefail

echo "=== alias, export, unset ==="
shopt -s expand_aliases
alias demo_ls='ls --color=auto'
# Alias must be expanded in this shell (see man bash — aliases in scripts)
eval "demo_ls /tmp" | head -3
export DEMO_VAR=linux
echo "DEMO_VAR=$DEMO_VAR"
unset DEMO_VAR
