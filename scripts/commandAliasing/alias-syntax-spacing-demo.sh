#!/bin/bash
# Session 13 — spacing rules around = (class board)
set -euo pipefail
shopt -s expand_aliases

echo "=== VALID: alias rename=mv (no spaces around =) ==="
alias rename=mv
type rename

echo ""
echo "=== INVALID examples (Durga Sir) — shown as comments only ==="
echo "# alias bad1 =mv          # space before =  → error"
echo "# alias bad2= mv          # space after =   → error"
echo "# alias bad3 rename=mv    # space after alias name → error"
echo "Quotes around the command are optional: alias x=mv or alias x='mv'"
