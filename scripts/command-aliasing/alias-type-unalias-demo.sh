#!/bin/bash
# Session 13 — type before define; unalias one name
set -euo pipefail
shopt -s expand_aliases

echo "=== type cls1 — name not used yet ==="
if type cls1 2>/dev/null; then
  type cls1
else
  echo "bash: type: cls1: not found   # safe to use cls1 as alias name"
fi

alias cls1=date
echo ""
echo "=== type cls1 — now an alias ==="
type cls1

echo ""
echo "=== unalias cls1 — remove this alias ==="
unalias cls1
if type cls1 2>/dev/null; then
  type cls1
else
  echo "cls1 no longer defined"
fi

echo ""
echo "=== overwrite alias (like x=10 then x=20) ==="
alias demo=date
type demo
alias demo=cal
type demo
echo "Running demo (should show calendar month, not date line):"
demo | head -3
