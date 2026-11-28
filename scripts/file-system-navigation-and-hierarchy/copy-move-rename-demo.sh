#!/usr/bin/env bash
# Lab: cp, cp -r, mv rename, mv move (safe under /tmp)
set -euo pipefail
WORK="/tmp/linux-basics-copy-move-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

echo "=== cp single file ==="
echo "hello" > a.txt
cp a.txt b.txt
ls -l a.txt b.txt

echo ""
echo "=== cp into existing directory ==="
mkdir d1
cp a.txt b.txt d1/
ls d1

echo ""
echo "=== cp -r directory tree ==="
mkdir -p src/x/y
touch src/x/y/file1.txt
cp -r src dst
find dst -type f

echo ""
echo "=== mv rename (same directory) ==="
mv b.txt renamed.txt
ls -l renamed.txt

echo ""
echo "=== mv move file into d1 ==="
mv renamed.txt d1/
ls d1

echo ""
echo "=== mv rename directory ==="
mv dst dst-backup
ls -d dst-backup

echo "Done. Workspace: $WORK"