#!/bin/bash
# Session 13 — temporary vs permanent (~/.bashrc, ~/.bash_aliases)
set -euo pipefail

echo "=== session aliases are TEMPORARY ==="
echo "They disappear when you close the terminal (Durga Sir)."
echo ""
echo "=== make aliases PERMANENT (two ways) ==="
echo "1) Add alias lines to:  ~/.bashrc"
echo "2) Or create:           ~/.bash_aliases  (in your HOME — name is fixed)"
echo ""
echo "After editing, open a NEW terminal OR run:"
echo "  source ~/.bashrc"
echo ""
echo "Show hidden file in home (class): ls -a ~ | grep bash"
ls -a ~ 2>/dev/null | grep -E 'bashrc|bash_aliases' || echo "(home listing skipped in CI)"
