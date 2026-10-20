#!/bin/bash
# Session 3 — terminal as device file; tty command
set -euo pipefail

echo "Current terminal device (tty):"
tty

echo ""
echo "This path is a device file under /dev — Durga Sir: communicate via the file."
echo "Example from class (manual, needs a second open terminal):"
echo "  # On terminal 2, run: tty   → e.g. /dev/pts/1"
echo "  # On terminal 1: echo 'Hello' > /dev/pts/1"

if [[ -d /dev/pts ]]; then
  echo ""
  echo "Pseudo-terminals in /dev/pts:"
  ls -l /dev/pts 2>/dev/null | head -10
fi
