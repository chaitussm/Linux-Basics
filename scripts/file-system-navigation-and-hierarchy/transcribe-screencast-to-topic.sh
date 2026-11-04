#!/usr/bin/env bash
# Run on YOUR PC where the .webm screencast lives (WSL, Linux, or Mac).
# Produces a small transcript .txt you can upload to Cursor chat (~15 MB limit).
#
# Needs: ffmpeg, python3, pip package faster-whisper
#
# Example:
#   bash transcribe-screencast-to-topic.sh "/path/Screencast From 2026-10-30 16-06-57.webm"
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 /path/to/recording.webm [output-dir]"
  exit 1
fi

INPUT="$1"
OUT_DIR="${2:-.}"
STEM="$(basename "$INPUT" | sed 's/\.[^.]*$//')"
WORK="$OUT_DIR/${STEM}-transcribe-work"
AUDIO="$WORK/audio-16k-mono.wav"
TRANSCRIPT="$OUT_DIR/${STEM}-transcript.txt"

command -v ffmpeg >/dev/null || { echo "Install ffmpeg first."; exit 1; }
python3 -c "import faster_whisper" 2>/dev/null || {
  echo "Installing faster-whisper (one time)..."
  pip install --user faster-whisper
}

mkdir -p "$WORK"
echo "=== Extracting audio (much smaller than video) ==="
ffmpeg -y -i "$INPUT" -vn -ac 1 -ar 16000 -c:a pcm_s16le "$AUDIO"

echo "=== Transcribing (CPU; first run downloads Whisper model) ==="
python3 << PY
from pathlib import Path
from faster_whisper import WhisperModel

audio = Path("$AUDIO")
out = Path("$TRANSCRIPT")
model_size = __import__("os").environ.get("WHISPER_MODEL", "small")
model = WhisperModel(model_size, device="cpu", compute_type="int8")
segments, info = model.transcribe(str(audio), vad_filter=True, language="en")
lines = [
    f"# Transcript: {audio.name}",
    f"# language={info.language} duration={info.duration:.0f}s",
    "",
]
for s in segments:
    t = s.text.strip()
    if t:
        m = int(s.start // 60)
        sec = s.start % 60
        lines.append(f"[{m:02d}:{sec:05.2f}] {t}")
out.write_text("\\n".join(lines) + "\\n", encoding="utf-8")
print("Wrote", out, "size", out.stat().st_size, "bytes")
PY

ls -lh "$TRANSCRIPT"
echo ""
echo "Upload this file to your Cursor agent chat:"
echo "  $TRANSCRIPT"
echo "Then ask the agent to build fileSystemsPartTwo.md from the transcript."
