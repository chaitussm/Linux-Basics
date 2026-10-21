#!/bin/bash
# Session 4 — /bin, /sbin, /etc (Durga Sir hierarchy deep dive)
set -euo pipefail

echo "=== which — which executable runs for a command (often /usr/bin on modern Ubuntu) ==="
for cmd in touch ls mkdir cd cat date; do
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "$cmd -> $(command -v "$cmd")"
  fi
done

echo ""
echo "=== /bin (binary executables for normal-user commands; may symlink to /usr/bin) ==="
ls -ld /bin 2>/dev/null || true
ls /bin 2>/dev/null | head -12 || true

echo ""
echo "=== /sbin (system bin — super-user / admin binaries) ==="
ls -ld /sbin 2>/dev/null || true
ls /sbin 2>/dev/null | head -12 || true

echo ""
echo "=== /etc — system configuration (sample files Durga Sir mentions) ==="
for f in /etc/passwd /etc/group /etc/hosts; do
  if [[ -f "$f" ]]; then
    echo "--- $f (first 5 lines) ---"
    head -5 "$f"
    echo ""
  fi
done

echo "etc = system configuration; passwd = users, group = groups, hosts = hostname/IP hints."
