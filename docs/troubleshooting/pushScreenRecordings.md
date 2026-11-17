# Git: Pushing screen recordings (mp4 / webm)

## What went wrong on this repo (Nov 2026)

Several commits titled **`updated changes`** on `master` **removed** files from `ScreenRecordings/` on GitHub (delete commits with `Bin … -> 0 bytes`). The folder is **empty on `origin/master`** even if you still have videos on your PC.

So a push might “work” but the remote ends up **without** the video, or your local add never reaches GitHub because of **size**, **LFS**, or **non-fast-forward** rejection.

**Fix:** Re-add the recording using the steps below (and use Git LFS).

---

## Step-by-step (local machine)

### 1. Sync and enable LFS

```bash
cd ~/Study/Linux-Basics   # your clone path
git lfs install
git fetch origin
git pull --rebase origin master
```

### 2. Confirm the file is real (not empty)

```bash
ls -lh ScreenRecordings/
```

Size should be **megabytes**, not `0`.

### 3. Stage with quoted paths

```bash
git add "ScreenRecordings/Your Screencast Name.mp4"
git lfs ls-files    # should list your video before push
git status
```

### 4. Commit and push

```bash
git commit -m "Add screen recording: <session topic>"
git push origin master
```

If rejected:

```bash
git pull --rebase origin master
git push origin master
```

Full branch divergence help: [gitDivergedBranchFix.md](gitDivergedBranchFix.md).

---

## GitHub 100 MB limit (without LFS)

Plain Git rejects any **single blob over 100 MB**. Long screen recordings as `.mp4` often exceed that.

This repo’s **`.gitattributes`** sends `ScreenRecordings/**`, `*.mp4`, `*.webm`, and `*.mkv` through **Git LFS**. You must run **`git lfs install`** on your PC once.

If LFS is not active, you’ll see:

```text
remote: error: File … is 150.00 MB; this exceeds GitHub's file size limit of 100.00 MB
```

---

## Checklist before you complain “it won’t push”

- [ ] `git lfs install` run on this machine  
- [ ] `git pull --rebase origin master` done  
- [ ] File path in quotes; file listed in `git status`  
- [ ] `git lfs ls-files` shows the video after `git add`  
- [ ] Push error text copied (size limit vs auth vs non-fast-forward)  

---

## Still stuck?

Paste the **exact** `git push` error (last 10 lines) in chat. Common fixes are in [ScreenRecordings/README.md](../../ScreenRecordings/README.md).