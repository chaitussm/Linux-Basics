#!/bin/bash
# Session 3 — extension vs content; file and mv (Durga Sir demo)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-file-command-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

touch sunny.jpg
echo "=== After touch (empty) ==="
file sunny.jpg || true

echo "hello friends" > sunny.jpg
echo "=== After adding text content ==="
file sunny.jpg
cat sunny.jpg

mv sunny.jpg sunny.durga
echo "=== After mv rename (extension changed) ==="
file sunny.durga
ls -l
