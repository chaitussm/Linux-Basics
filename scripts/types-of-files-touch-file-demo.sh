#!/bin/bash
# Session 3 — touch creates empty ordinary file (Durga Sir: sunny.jpg demo)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-types-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

touch sunny.jpg
ls -l sunny.jpg
echo "Size in bytes: $(wc -c < sunny.jpg)"
file sunny.jpg || true
echo "Empty file: type may be 'empty' until content is added."
