#!/bin/bash
set -euo pipefail

echo "=== file (external — check file type by content) ==="
WORK_FILE="${TMPDIR:-/tmp}/bash-builtin-file-demo.txt"
echo "sample text" > "$WORK_FILE"
type file
file "$WORK_FILE"
