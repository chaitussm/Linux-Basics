#!/bin/bash
set -euo pipefail

echo "=== ls -a at root shows . and ..; parent of / is nothing (cd .. stays at /) ==="
cd /
ls -a | head -5
cd .. && echo "after cd .. at / : $(pwd)"
