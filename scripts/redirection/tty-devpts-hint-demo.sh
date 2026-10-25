#!/bin/bash
# Session 11 — redirect output to another terminal: tty → /dev/pts/N
set -euo pipefail

echo "=== In class: open two terminals ==="
echo "Terminal A: run  tty          → e.g. /dev/pts/1"
echo "Terminal B: run  cal > /dev/pts/1   → calendar appears on A's screen"
echo ""
echo "=== This environment: current tty (if any) ==="
if tty -s 2>/dev/null; then
  TTY_DEV="$(tty)"
  echo "tty reports: $TTY_DEV"
  echo "Example (same terminal): echo 'Hello from redirection' > $TTY_DEV"
  echo 'Hello from redirection' > "$TTY_DEV"
else
  echo "No controlling tty here — run the two-terminal lab on your Ubuntu machine."
fi
