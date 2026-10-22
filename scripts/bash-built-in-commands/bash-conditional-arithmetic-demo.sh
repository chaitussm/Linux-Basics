#!/bin/bash
set -euo pipefail

echo "=== test / [[ / (( arithmetic )) ==="
[[ -d /tmp ]] && echo "/tmp is a directory"
(( x = 3 + 4 )) && echo "(( )) result: x=$x"
