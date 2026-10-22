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

list_if_dir /bin "essential user commands"
list_if_dir /sbin "system admin binaries"
list_if_dir /boot "boot loader / kernel files"
list_if_dir /dev "device files"
list_if_dir /etc "configuration"
list_if_dir /home "user home directories"
