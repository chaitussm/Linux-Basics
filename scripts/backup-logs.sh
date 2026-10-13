#!/bin/bash
# Simple backup: tar + date (compression topic)
set -euo pipefail
SRC="${1:-./exercises/03-redirection-pipes/sample}"
DEST="${2:-/tmp}"
STAMP=$(date +%Y%m%d-%H%M%S)
ARCHIVE="$DEST/linux-basics-backup-$STAMP.tar.gz"
tar -czf "$ARCHIVE" -C "$(dirname "$SRC")" "$(basename "$SRC")"
echo "Created $ARCHIVE"
