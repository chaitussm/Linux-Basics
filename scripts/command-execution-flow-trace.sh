#!/bin/bash
# Diagram-2 walkthrough: success path then error path (shell vs kernel)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-basics-flow-trace"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== SUCCESS PATH: touch sunny.txt (shell validates → kernel creates file) ==="
touch sunny.txt
ls -l sunny.txt

echo ""
echo "=== ERROR PATH: invalid command (shell only — kernel not involved) ==="
set +e
touch123 2>&1
set -e

echo ""
echo "=== Done: in an interactive terminal you would see the \$ prompt again ==="
