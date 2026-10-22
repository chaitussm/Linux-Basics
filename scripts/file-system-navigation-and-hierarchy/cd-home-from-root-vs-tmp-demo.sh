#!/bin/bash
set -euo pipefail

echo "=== From /, relative cd home -> /home (child directory named home) ==="
( cd / && cd home && pwd )

echo ""
echo "=== From /tmp, cd home usually fails (no home/ under /tmp) ==="
if ( cd /tmp && cd home 2>/dev/null ); then
  pwd
else
  echo "cd home from /tmp: failed (expected)"
fi
