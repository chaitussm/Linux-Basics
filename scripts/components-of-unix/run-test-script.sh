#!/bin/bash
# Durga Sir: chmod u+x test.sh then execute
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
chmod u+x "$DIR/test.sh"
"$DIR/test.sh"
