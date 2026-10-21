#!/bin/bash
# Session 7 — ls -F classify: / dir, * executable, @ symlink
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-ls-F-demo"
rm -rf "$WORK"
mkdir -p "$WORK/subdir"
cd "$WORK"
echo '#!/bin/bash' > runme.sh
chmod +x runme.sh
ln -s runme.sh link.sh

echo "=== ls -F in demo dir ==="
ls -F

echo ""
echo "=== ls -F /bin (sample) — * = executable, @ = symlink ==="
ls -F /bin 2>/dev/null | head -15 || true
