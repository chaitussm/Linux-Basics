#!/bin/bash
# Session 4 — at filesystem root: cd .. and cd . behavior
set -euo pipefail

echo "=== cd / (root directory) ==="
cd /
pwd

echo ""
echo "=== cd .. at root — no parent above /; you stay at root (Ubuntu) ==="
cd ..
pwd

echo ""
echo "=== cd . at root — current directory; still at root ==="
cd .
pwd

echo ""
echo "Durga Sir: root has no parent directory; beyond root there is nothing."
