#!/usr/bin/env bash
# Extract PNG frames every 90s from a local screencast (for topic notes).
# Videos stay under /home/surya/Videos/Screencasts/ — not in git.
set -euo pipefail

SCREENCAST_DIR="${SCREENCAST_DIR:-/home/surya/Videos/Screencasts}"

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 \"/path/to/file.webm\" [output-dir]"
  echo ""
  echo "Canonical screencast directory:"
  echo "  $SCREENCAST_DIR"
  echo "Example:"
  echo "  $0 \"$SCREENCAST_DIR/Screencast From 2026-11-17 10-13-53.webm\""
  exit 1
fi

VIDEO="$1"
OUT="${2:-/tmp/screencast-frames}"

if [[ ! -f "$VIDEO" ]]; then
  echo "File not found: $VIDEO"
  echo "Expected location: $SCREENCAST_DIR/"
  exit 1
fi

mkdir -p "$OUT"
ffmpeg -y -i "$VIDEO" -vf "fps=1/90" -q:v 2 "$OUT/f_%04d.png"
echo "Frames written to: $OUT ($(ls "$OUT" | wc -l) images)"