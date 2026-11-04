#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT="$ROOT/docs/topics/fileSystem/source"
mkdir -p "$OUT"
export PATH="$HOME/.local/bin:$PATH"

for f in "$ROOT/ScreenRecordings/fileSystem1.webm" "$ROOT/ScreenRecordings/fileSystem2.webm"; do
  bash "$ROOT/scripts/file-system-navigation-and-hierarchy/transcribe-screencast-to-topic.sh" \
    "$f" "$OUT"
done

PART1="$OUT/fileSystem1-transcript.txt"
PART2="$OUT/fileSystem2-transcript.txt"
MERGED="$OUT/session5-merged-transcript.txt"
{
  echo "# Session 5 — merged transcript (fileSystem1 + fileSystem2)"
  echo ""
  echo "## Part 1 — fileSystem1.webm"
  echo ""
  cat "$PART1"
  echo ""
  echo "## Part 2 — fileSystem2.webm"
  echo ""
  cat "$PART2"
} > "$MERGED"
echo "Merged: $MERGED ($(wc -c < "$MERGED") bytes)"
