#!/usr/bin/env bash
# Extract PNG frames every 90s from a local screencast (for topic notes).
# Run on YOUR PC where the .webm lives — videos are not stored on GitHub.
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 \"/path/Screencast ....webm\" [output-dir]"
  echo "Example:"
  echo "  $0 \"\$HOME/Study/Linux-Basics/ScreenRecordings/Screencast From 2026-11-17 10-13-53.webm\""
  exit 1
fi

VIDEO="$1"
OUT="${2:-/tmp/screencast-frames}"

if [[ ! -f "$VIDEO" ]]; then
  echo "File not found: $VIDEO"
  exit 1
fi

mkdir -p "$OUT"
ffmpeg -y -i "$VIDEO" -vf "fps=1/90" -q:v 2 "$OUT/f_%04d.png"
echo "Frames written to: $OUT ($(ls "$OUT" | wc -l) images)"