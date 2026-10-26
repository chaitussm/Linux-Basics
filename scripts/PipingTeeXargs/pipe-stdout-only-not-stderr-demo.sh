#!/bin/bash
# Session 12 — pipe carries stdout (1), not stderr (2)
set -euo pipefail

echo "=== cal 99999 | wc -l — error still on terminal; wc gets little/no stdout ==="
set +e
cal 99999 | wc -l
set -e
echo "(Durga Sir point: redirect stderr with 2> if you need errors in a file.)"
