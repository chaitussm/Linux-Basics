#!/bin/bash
set -euo pipefail

echo "=== pushd / popd / dirs ==="
pushd /tmp >/dev/null
dirs -p
popd >/dev/null
