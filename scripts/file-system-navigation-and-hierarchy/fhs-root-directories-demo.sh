#!/bin/bash
# Session 4 — FHS: list / and brief notes on common top-level dirs
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

echo "=== Top of Linux file system (read-only tour) ==="
ls -l /

echo ""
list_if_dir /bin "essential user commands"
list_if_dir /sbin "system admin binaries"
list_if_dir /boot "boot loader / kernel files"
list_if_dir /dev "device files"
list_if_dir /etc "configuration"
list_if_dir /home "user home directories"
list_if_dir /usr "programs, libraries, documentation"
list_if_dir /var "variable data (e.g. logs)"
list_if_dir /tmp "temporary files"
list_if_dir /opt "optional third-party software"
list_if_dir /mnt "mount point"
list_if_dir /proc "process / kernel info (virtual)"
list_if_dir /root "root user home"

echo "Tip: explore with 'ls' and 'cd' — do not modify system dirs without admin knowledge."
