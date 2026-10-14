#!/bin/bash
# Components of Unix — successful command flow (shell validates, kernel creates file)
set -euo pipefail
WORK_DIR="${TMPDIR:-/tmp}/linux-basics-touch-demo"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"
FILE="sunny.txt"
echo "Working in: $WORK_DIR"
touch "$FILE"
ls -l "$FILE"
echo "Done: kernel created/updated $FILE; shell shows new $ prompt when you run commands interactively."
