#!/bin/bash
set -euo pipefail

echo "=== /bin (binary executables for normal-user commands; may symlink to /usr/bin) ==="
ls -ld /bin 2>/dev/null || true
ls /bin 2>/dev/null | head -12 || true

echo ""
echo "=== /sbin (system bin — super-user / admin binaries) ==="
ls -ld /sbin 2>/dev/null || true
ls /sbin 2>/dev/null | head -12 || true
