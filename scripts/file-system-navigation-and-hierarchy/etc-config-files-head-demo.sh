#!/bin/bash
set -euo pipefail

echo "=== /etc — system configuration (sample files Durga Sir mentions) ==="
for f in /etc/passwd /etc/group /etc/hosts; do
  if [[ -f "$f" ]]; then
    echo "--- $f (first 5 lines) ---"
    head -5 "$f"
    echo ""
  fi
done

echo "etc = system configuration; passwd = users, group = groups, hosts = hostname/IP hints."
