#Code Runner (formulahendry.code-runner) is already installed. Open a .sh file and use Run Code or press Ctrl+Alt+N to execute it with Bash.
# It runs the currently open script, not every .sh file in the repository at once. Ensure Bash is installed on your system.

#!/bin/bash
# Demonstrates sample Bash built-ins documented in Bash Built-in Commands.md
set -euo pipefail

echo "=== help (list internal commands) ==="
help | head -8

echo ""
echo "=== pwd, cd, echo, type ==="
pwd
cd /tmp
pwd
echo "Hello from echo builtin"
type echo

echo ""
echo "=== test / [[ / (( arithmetic )) ==="
[[ -d /tmp ]] && echo "/tmp is a directory"
(( x = 3 + 4 )) && echo "(( )) result: x=$x"

echo ""
echo "=== alias, export, unset ==="
alias demo_ls='ls --color=auto'
demo_ls /tmp | head -3
export DEMO_VAR=linux
echo "DEMO_VAR=$DEMO_VAR"
unset DEMO_VAR

echo ""
echo "=== pushd / popd / dirs ==="
pushd /tmp >/dev/null
dirs -p
popd >/dev/null

echo ""
echo "=== file (external — check file type by content) ==="
WORK_FILE="${TMPDIR:-/tmp}/bash-builtin-file-demo.txt"
echo "sample text" > "$WORK_FILE"
type file
file "$WORK_FILE"

echo ""
echo "=== printf, read (here-string), mapfile ==="
printf "User: %s\n" "$(whoami)"
mapfile -t lines <<< $'one\ntwo'
printf 'mapfile[0]=%s\n' "${lines[0]}"

echo ""
echo "Done. See: docs/topics/Bash Built-in Commands.md"
