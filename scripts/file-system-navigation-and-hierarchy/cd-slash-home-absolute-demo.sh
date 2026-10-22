#!/bin/bash
set -euo pipefail

echo "=== cd /home (absolute from /) — always the users' home parent dir ==="
if [[ -d /home ]]; then
  cd /home
  pwd
  ls -la /home | head -8
else
  echo "/home not on this system"
fi

echo ""
echo "Remember: /home exists only under root /, not as a relative name from random cwd."
