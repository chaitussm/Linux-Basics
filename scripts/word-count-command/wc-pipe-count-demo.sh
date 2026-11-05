#!/bin/bash
# Session 10 — wc with pipe (count lines of command output)
set -euo pipefail

echo "=== ls /etc | wc -l (how many names — includes . and .. on some systems) ==="
ls /etc | wc -l

echo ""
echo "=== printf 'one\\ntwo\\nthree\\n' | wc -l ==="
printf 'one\ntwo\nthree\n' | wc -l

echo ""
echo "Pipe sends stdout to wc; file name shows as input or is omitted."
