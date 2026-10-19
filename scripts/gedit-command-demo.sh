#!/bin/bash
# Bash Built-in Commands.md — gedit: GUI editor (Durga Sir: edit sunny.jpg content)
set -euo pipefail
WORK="${TMPDIR:-/tmp}/linux-gedit-demo"
rm -rf "$WORK"
mkdir -p "$WORK"
cd "$WORK"

FILE="sunny.jpg"
touch "$FILE"

if command -v gedit >/dev/null 2>&1 && [[ -n "${DISPLAY:-}" ]]; then
  echo "Opening gedit (close the editor window when done)..."
  gedit "$FILE" &
  sleep 1
else
  echo "Terminal-only demo: writing text as Durga Sir did after gedit..."
  echo "hello friends" > "$FILE"
  echo "On Ubuntu desktop, use: gedit $FILE"
fi

echo ""
echo "=== Verify with cat and file ==="
cat "$FILE"
file "$FILE"
