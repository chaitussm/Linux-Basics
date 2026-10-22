#!/bin/bash
set -euo pipefail

BASE="${TMPDIR:-/tmp}/linux-multi-parent-demo"
rm -rf "$BASE"
mkdir -p "$BASE/desktop/d1/d2"

echo "=== cd ... (three dots) is INVALID — no such file or directory ==="
if ( cd "$BASE/desktop/d1/d2" && cd ... 2>/dev/null ); then
  pwd
else
  echo "cd ... failed (expected — only . and .. exist, not ...)"
fi
