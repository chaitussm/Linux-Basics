#!/bin/bash
# Components of Unix — successful command flow (shell validates, kernel creates file)
set -euo pipefail
WORK_DIR="${TMPDIR:-/tmp}/linux-basics-touch-demo"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"
FILE="sunny.txt"
echo "Working in: $WORK_DIR"
touch "$FILE"
ls -l "$FILE"
echo "Done: kernel created/updated $FILE; shell shows new $ prompt when you run commands interactively."
# AI Overview
#
# The touch command in Linux is primarily used to create empty files and update
# the access or modification timestamps of existing files without changing
# their content.
#
# Usage:
#   touch [OPTION]... FILE...
#
# Common options:
#   -a    change only the access time
#   -m    change only the modification time
#   -c    do not create any files
#   -t    use the specified timestamp instead of the current time
#   -r    use the access and modification times of the reference file
#   --help display this help and exit
#   --version output version information and exit