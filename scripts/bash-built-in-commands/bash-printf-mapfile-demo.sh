#!/bin/bash
set -euo pipefail

echo "=== printf, read (here-string), mapfile ==="
printf "User: %s\n" "$(whoami)"
mapfile -t lines <<< $'one\ntwo'
printf 'mapfile[0]=%s\n' "${lines[0]}"

echo ""
echo "Done. See: docs/topics/Bash Built-in Commands.md"
