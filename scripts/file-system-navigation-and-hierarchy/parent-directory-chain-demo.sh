#!/bin/bash
# Session 4 — current directory vs parent chain (dir2 -> dir1 -> desktop -> ... -> /)
set -euo pipefail

BASE="${TMPDIR:-/tmp}/linux-parent-chain-demo"
rm -rf "$BASE"
mkdir -p "$BASE/home/durga/desktop/dir1/dir2"
cd "$BASE/home/durga/desktop/dir1/dir2"

echo "=== Current working directory (pwd) ==="
pwd
echo "Current directory name: dir2"

echo ""
echo "=== Parent of dir2 is dir1 (cd ..) ==="
cd ..
pwd

echo ""
echo "=== Parent of dir1 is desktop ==="
cd ..
basename "$(pwd)"

echo ""
echo "=== Parent of desktop is user home (durga) ==="
cd ..
pwd

echo ""
echo "=== Parent of /home/durga is /home ==="
cd ..
pwd

echo ""
echo "=== Parent of /home is / (root) ==="
cd ..
pwd

echo ""
echo "=== ls -a at root shows . and ..; parent of / is nothing (cd .. stays at /) ==="
cd /
ls -a | head -5
cd .. && echo "after cd .. at / : $(pwd)"
