#!/bin/bash
# Durga Sir: chmod u+x test.sh then execute
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
chmod u+x "$ROOT/scripts/test.sh"
"$ROOT/scripts/test.sh"
