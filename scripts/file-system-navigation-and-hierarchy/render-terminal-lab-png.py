#!/usr/bin/env python3
"""Render monospace terminal text to a PNG (class lab screenshot helper)."""
from __future__ import annotations

import sys
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


def render(text: str, out_path: Path, title: str = "") -> None:
    font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf", 16)
    lines = text.rstrip("\n").split("\n")
    if title:
        lines = [title, ""] + lines
    line_h = 22
    pad = 20
    w = max(font.getlength(line) for line in lines) + pad * 2
    w = max(int(w), 900)
    h = pad * 2 + line_h * len(lines)
    img = Image.new("RGB", (int(w), h), (35, 35, 35))
    draw = ImageDraw.Draw(img)
    y = pad
    for line in lines:
        draw.text((pad, y), line, fill=(220, 220, 220), font=font)
        y += line_h
    out_path.parent.mkdir(parents=True, exist_ok=True)
    img.save(out_path)
    print(f"Wrote {out_path}")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: render-terminal-lab-png.py output.png < transcript.txt", file=sys.stderr)
        sys.exit(1)
    body = sys.stdin.read()
    render(body, Path(sys.argv[1]), sys.argv[2] if len(sys.argv) > 3 else "")