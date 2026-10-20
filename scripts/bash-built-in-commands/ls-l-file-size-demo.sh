#!/bin/bash
# Bash Built-in Commands.md — ls -l filename: file type + size in bytes
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-size-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

touch demo.txt
echo "=== Empty file ==="
ls -l demo.txt
echo "Size (bytes): $(wc -c < demo.txt)"

echo ""
echo "hello friends" > demo.txt
echo "=== After writing text ==="
ls -l demo.txt
ls -lh demo.txt
file demo.txt

echo ""
echo "5th column of ls -l is size in bytes (not RAM — disk file size)."
