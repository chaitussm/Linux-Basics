#!/bin/bash
# Session 10 — wc -c : bytes; newline counts as one character (Durga Sir / printString lab)
set -euo pipefail

echo "=== echo \"vishnu\" | wc -c (newline adds 1 byte) ==="
echo "vishnu" | wc -c

echo ""
echo "=== echo -n \"vishnu\" | wc -c (no trailing newline) ==="
echo -n "vishnu" | wc -c

echo ""
echo "Durga Sir: in Linux each character is normally 1 byte; \\n after echo is also counted."
