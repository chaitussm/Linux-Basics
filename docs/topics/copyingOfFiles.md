# Copying of Files (`cp`)

**Syllabus #3** · [workingWithFiles.md](workingWithFiles.md)  
**Course:** [Durga Soft — Linux with Shell Programming](https://www.durgasoftonline.com/s/courses/5e7ae04f0cf29f148a043786/take)

**Not the same as Session 13:** [copyMoveRenamingDirectories.md](copyMoveRenamingDirectories.md) covers **directories** with `cp` / `mv`. **This file** is **files only** (normal files), per syllabus item **3. Copying of Files**.

**Source recording:** `/home/surya/Videos/Screencasts/<your-screencast>.webm`  
**Policy:** [screencastWorkflow.md](screencastWorkflow.md)

**Practice:** [`copy-move-rename-demo.sh`](../../scripts/file-system-navigation-and-hierarchy/copy-move-rename-demo.sh) — use file-copy blocks only.

---

**Table of contents**

- [1. `cp` — duplicate a file in the same directory](#1-cp--duplicate-a-file-in-the-same-directory)
- [2. `cp` — copy into another directory](#2-cp--copy-into-another-directory)
- [3. `cp` — multiple sources into one directory](#3-cp--multiple-sources-into-one-directory)
- [4. Options `-i`, `-v`, `-u` on **files**](#4-options--i--v--u-on-files)
- [5. Common mistakes](#5-common-mistakes)
- [Appendix — PNG names](#appendix--png-names)

---

## 1. `cp` — duplicate a file in the same directory

```bash
cp file1 file2
```

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/copyingOfFiles-cp-same-dir-class.png`

**My observation:**

> **Pending:** `../assets/copyingOfFiles-cp-same-dir-my.png`

---

## 2. `cp` — copy into another directory

```bash
cp notes.txt ~/backup/
```

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/copyingOfFiles-cp-to-dir-class.png`

**My observation:**

> **Pending:** `../assets/copyingOfFiles-cp-to-dir-my.png`

---

## 3. `cp` — multiple sources into one directory

```bash
cp a.txt b.txt c.txt targetDir/
```

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/copyingOfFiles-cp-multi-class.png`

**My observation:**

> **Pending:** `../assets/copyingOfFiles-cp-multi-my.png`

---

## 4. Options `-i`, `-v`, `-u` on **files**

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/copyingOfFiles-cp-options-class.png`

**My observation:**

> **Pending:** `../assets/copyingOfFiles-cp-options-my.png`

---

## 5. Common mistakes

| Mistake | Result |
| :------ | :----- |
| `cp file.txt` (no dest) | Usage error |
| Overwrite without `-i` | Silent replace |

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/copyingOfFiles-mistakes-class.png`

**My observation:** Screenshot one mistake on purpose, then fix with `-i`.

---

## Appendix — PNG names

After screencast: extract frames, `git add docs/topics/copyingOfFiles.md docs/assets/copyingOfFiles-*.png`, run `validate-docs-assets.sh`.