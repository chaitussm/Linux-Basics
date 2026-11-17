# Screencast workflow (policy)

**From Nov 2026 onward**, class recordings are **not** stored in this GitHub repo.

## How you name the next topic

For **every upcoming video**, you give the **exact markdown filename** (that is also the **topic name**):

| You say | We create |
| :------ | :-------- |
| `copyMoveRenamingDirectories.md` | `docs/topics/copyMoveRenamingDirectories.md` |
| `absolutePathvsRelativePath.md` | `docs/topics/absolutePathvsRelativePath.md` |

**Rules:**

1. **One screencast → one `.md`** file with the name **you** choose (usually camelCase, no spaces).
2. **Do not merge** many sessions into one giant file — **one `##` section per sub-topic** inside that file.
3. After each new file, add a row to [**linuxBasics.md**](linuxBasics.md) (video index + topic table).

**Example request to the agent:**

> Watch the latest file in `/home/surya/Videos/Screencasts/`, build **`touchCommand.md`** like `removeDirectories.md` (screenshots, line-by-line, flowcharts, *My observation*), open a PR. Do not push the video.

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

Filename: **`docs/topics/<YourTopicName>.md`** (same as you requested).

```markdown
# <Human title from class, e.g. Copy, Move, and Renaming (`cp`, `mv`)>

**Source recording (local — not on GitHub):**  
`/home/surya/Videos/Screencasts/<exact-screencast-filename>.webm`
```

---

## Standard layout (every upcoming video)

Match [**removeDirectories.md**](removeDirectories.md) / [**copyMoveRenamingDirectories.md**](copyMoveRenamingDirectories.md):

| Piece | What to include |
| :---- | :-------------- |
| **§0** | What this recording covers + time map |
| **§1…n** | **One section per Durga topic** (not one merged timeline blob) |
| **Screenshot** | Class terminal/EditPlus → `docs/assets/` + line-by-line under image |
| **Mermaid** | Where the idea is non-obvious (flow / decision) |
| **My observation** | Empty slot for **your** lab PNG/commands |
| **Scripts** | Add or link `scripts/.../*-demo.sh` when useful |
| **Git** | PR with **`.md` + PNG only** |

---

## Agent checklist (each new screencast)

1. User supplies **`Something.md`** = topic name.
2. Pick video from **`/home/surya/Videos/Screencasts/`** (user names file or “latest”).
3. Create **`docs/topics/Something.md`** with sections above.
4. Update **`docs/topics/linuxBasics.md`**.
5. **No** video in git — optional: user pushes frame PNGs to `docs/assets/`.
6. Branch `cursor/<short-name>-29a8` → PR.

---

## Older topics

Some older `.md` files still mention `ScreenRecordings/…` in git history. **New work** uses **`/home/surya/Videos/Screencasts/`** only.