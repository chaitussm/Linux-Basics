#!/bin/bash
set -euo pipefail

list_if_dir() {
  local name="$1"
  local note="$2"
  if [[ -d "$name" ]]; then
    echo "--- $name ($note) ---"
    ls -ld "$name"
    echo "sample entries:"
    ls "$name" 2>/dev/null | head -8 || true
    echo ""
  else
    echo "--- $name — not present on this system ---"
    echo ""
  fi
}

list_if_dir /usr "programs, libraries, documentation"
list_if_dir /var "variable data (e.g. logs)"
list_if_dir /tmp "temporary files"
list_if_dir /opt "optional third-party software"
list_if_dir /mnt "mount point"
list_if_dir /proc "process / kernel info (virtual)"
list_if_dir /root "root user home"

echo "Tip: explore with 'ls' and 'cd' — do not modify system dirs without admin knowledge."
