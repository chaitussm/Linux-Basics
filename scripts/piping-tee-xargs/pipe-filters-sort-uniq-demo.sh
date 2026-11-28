#!/bin/bash
# Session 12 — filter commands: read stdin, transform output
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-pipe-filters"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

cat > marks.txt << 'EOF'
ravi 90
sita 85
ravi 90
amit 78
sita 85
EOF

echo "=== cat marks.txt | sort | uniq (sorted unique lines) ==="
cat marks.txt | sort | uniq

echo ""
echo "=== cat marks.txt | sort | uniq -c (count duplicates) ==="
cat marks.txt | sort | uniq -c
