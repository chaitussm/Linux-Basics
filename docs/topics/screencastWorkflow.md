# Screencast workflow (policy)

**From Nov 2026 onward**, class recordings are **not** stored in this GitHub repo.

---

## Single source of truth (your PC)

All new screencasts live **only** here:

```text
/home/surya/Videos/Screencasts/
```

Examples:

```text
/home/surya/Videos/Screencasts/Screencast From 2026-11-17 10-13-53.webm
```

Do **not** copy large `.webm` / `.mp4` into `Linux-Basics/ScreenRecordings/` for git. That folder keeps README + `.gitignore` only.

---

## What we push to GitHub

| Push | Do not push |
| :--- | :---------- |
| `docs/topics/<topic>.md` | `*.webm`, `*.mp4` |
| `docs/assets/*.png` (terminal / EditPlus captures) | Anything under `/home/surya/Videos/Screencasts/` |

---

## Create a topic `.md` from a screencast

**On your machine** (WSL/Linux with the video file):

```bash
VIDEO="/home/surya/Videos/Screencasts/Screencast From 2026-11-17 10-13-53.webm"
cd ~/Study/Linux-Basics

# Optional: extract frames every 90s for writing sections
bash scripts/file-system-navigation-and-hierarchy/extract-screencast-frames.sh \
  "$VIDEO" /tmp/frames

# Copy chosen PNGs into the repo
cp /tmp/frames/f_0008.png docs/assets/my-topic-terminal.png

# Edit docs/topics/<newTopic>.md — link to local VIDEO path in the header
# Run lab demos and paste under "My observation"
```

**Cloud agents** cannot read `/home/surya/Videos/Screencasts/`. You (or a local agent) must either:

- push **PNG frames** into `docs/assets/`, or  
- describe timestamps so notes can be updated.

---

## Git commands (notes only)

```bash
cd ~/Study/Linux-Basics
git fetch origin
git pull --rebase origin master
git add docs/topics/ docs/assets/
git status   # must NOT list .webm / .mp4
git commit -m "Add <topic> notes from screencast"
git push origin master
```

Remote name is **`origin`** (not `orgin`).

---

## Topic file header template

```markdown
**Source recording (local — not on GitHub):**  
`/home/surya/Videos/Screencasts/<filename>.webm`
```

---

## Older topics

Some older `.md` files still mention `ScreenRecordings/…` in git history. **New work** uses **`/home/surya/Videos/Screencasts/`** only.