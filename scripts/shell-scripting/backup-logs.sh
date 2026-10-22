#!/bin/bash
# Simple backup: tar + date (compression topic)
set -euo pipefail
SRC="${1:-./exercises/03-redirection-pipes/sample}"
DEST="${2:-/tmp}"
STAMP=$(date +%Y%m%d-%H%M%S)
ARCHIVE="$DEST/linux-basics-backup-$STAMP.tar.gz"
tar -czf "$ARCHIVE" -C "$(dirname "$SRC")" "$(basename "$SRC")"
echo "Created $ARCHIVE"

##!/bin/bash is called a shebang. It tells Linux to run the script using the Bash interpreter at /bin/bash when you execute it directly, for example:
# ./backup-logs.sh

# Without a shebang, Linux may not know which interpreter to use. You can still run the script by specifying Bash yourself:
# bash backup-logs.sh

# In backup-logs.sh, the shebang is on the first line because that’s where Linux expects it.
