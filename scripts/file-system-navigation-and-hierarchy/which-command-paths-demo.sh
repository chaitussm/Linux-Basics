#!/bin/bash
set -euo pipefail

echo "=== which — which executable runs for a command (often /usr/bin on modern Ubuntu) ==="
for cmd in touch ls mkdir cd cat date; do
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "$cmd -> $(command -v "$cmd")"
  fi
done
