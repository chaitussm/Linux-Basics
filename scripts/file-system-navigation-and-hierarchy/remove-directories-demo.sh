#!/usr/bin/env bash
# Durga Sir Session — remove directories lab (safe under /tmp)
set -euo pipefail
WORK="/tmp/linux-basics-remove-dir-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== 1) rmdir on non-empty dir (expect failure) ==="
mkdir -p dir1
touch dir1/a.txt
rmdir dir1 2>&1 || true

echo ""
echo "=== 2) rm without -r (expect failure) ==="
rm dir1 2>&1 || true

echo ""
echo "=== 3) rm -r removes dir + contents ==="
rm -r dir1
ls -A dir1 2>&1 || echo "(dir1 gone)"

echo ""
echo "=== 4) rm -ri demo ==="
mkdir -p dir1 && touch dir1/{a..c}.txt
printf 'y\ny\ny\ny\n' | rm -ri dir1 2>&1 || true

echo ""
echo "=== 4b) rm -r on missing vs rm -rf ==="
rm -r dir1 2>&1 || true
rm -rf dir1
echo "(rm -rf silent)"

echo ""
echo "=== 5) rm -rv ==="
mkdir -p dir1 && touch dir1/{a..e}.txt
rm -rv dir1

echo ""
echo "Done. Workspace was $WORK"
