# Screen recordings (local only — not pushed to GitHub)

Large screencasts stay **on your machine** so `git push` stays fast and small. Git **ignores** `*.webm`, `*.mp4`, and `*.mkv` in this folder (see [`.gitignore`](.gitignore)).

## Where your file lives

Example (your latest session):

```text
~/Study/Linux-Basics/ScreenRecordings/Screencast From 2026-11-17 10-13-53.webm
```

Topic notes link to this **local path** and use **`docs/assets/`** PNGs (terminal captures), which **do** get pushed.

## Extract frames for notes (on your PC)

```bash
cd ~/Study/Linux-Basics
chmod +x scripts/file-system-navigation-and-hierarchy/extract-screencast-frames.sh
bash scripts/file-system-navigation-and-hierarchy/extract-screencast-frames.sh \
  "ScreenRecordings/Screencast From 2026-11-17 10-13-53.webm" \
  /tmp/copy-move-frames
```

Copy useful PNGs into `docs/assets/` and reference them in the matching `docs/topics/*.md` file.

## Push only notes + screenshots

```bash
git add docs/topics/copyMoveRenamingDirectories.md docs/assets/
git commit -m "Update copy/move/rename notes and lab screenshots"
git pull --rebase origin master
git push origin master
```

Do **not** `git add` files under `ScreenRecordings/*.webm` — they stay untracked by design.

## Troubleshooting push

See [docs/troubleshooting/pushScreenRecordings.md](../docs/troubleshooting/pushScreenRecordings.md) and [gitDivergedBranchFix.md](../docs/troubleshooting/gitDivergedBranchFix.md). Remember remote name **`origin`** (not `orgin`).