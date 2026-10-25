#!/bin/bash
# Session 11 — stdin 0, stdout 1, stderr 2 (default devices)
set -euo pipefail

echo "=== Three standard data streams (Durga Sir) ==="
echo "0 = stdin  (keyboard by default)"
echo "1 = stdout (terminal by default) — normal command output"
echo "2 = stderr (terminal by default) — error messages"

echo ""
echo "=== This line goes to stdout (stream 1) ==="

echo ""
echo "=== This line goes to stderr (stream 2) ===" >&2

echo ""
echo "=== tty — name of your terminal device ==="
tty || echo "(no tty in this environment — still valid in a real lab terminal)"
