# Viewing of Files (`cat`, `tac`, `rev`, `head`, `tail`)

**Course:** [Linux with Shell Programming — Durga Soft online](https://www.durgasoftonline.com/s/courses/5e7ae04f0cf29f148a043786/take)  
**Instructor:** Durga Sir  

**Syllabus:** [workingWithFiles.md](workingWithFiles.md) — topic **#2 · Viewing of Files**  
**Durga Soft session:** **Session 15** — *View Content of Files by using cat, tac, rev, head and tail commands*

**Source recording (local — not on GitHub):**  
`/home/surya/Videos/Screencasts/<Session-15-screencast>.webm`

**Prior topic:** [createFileByCatAndTouch.md](createFileByCatAndTouch.md) (Session 14 — create files first, then view them)

**Extra depth (YouTube-era notes):** [viewContentOfFiles.md](viewContentOfFiles.md) (`more`/`less`, long examples) — **this file** follows **online Session 15** only.

**Practice:** [`scripts/view-content-of-files/`](../../scripts/view-content-of-files/)

**Policy:** [screencastWorkflow.md](screencastWorkflow.md) — class PNG + your PNG per section.

---

**Table of contents**

- [0. What Session 15 covers](#0-what-session-15-covers)
- [1. `cat` — print whole file](#1-cat--print-whole-file)
- [2. `cat` — multiple files](#2-cat--multiple-files)
- [3. `cat -n` / `cat -b` — line numbers](#3-cat--n--cat--b--line-numbers)
- [4. `tac` — reverse line order](#4-tac--reverse-line-order)
- [5. `rev` — reverse characters per line](#5-rev--reverse-characters-per-line)
- [6. `head` — first lines](#6-head--first-lines)
- [7. `tail` — last lines](#7-tail--last-lines)
- [8. Viewing does not change the file on disk](#8-viewing-does-not-change-the-file-on-disk)
- [9. Practice questions](#9-practice-questions)
- [Appendix — frame map for PNGs](#appendix--frame-map-for-pngs)

---

## 0. What Session 15 covers

| Idea | Commands |
| :--- | :------- |
| Show all lines | `cat file` |
| Show many files in order | `cat f1 f2` |
| Number lines | `cat -n`, `cat -b` |
| Last line on top | `tac` |
| Each line backwards | `rev` |
| Top of file | `head`, `head -n` |
| Bottom of file | `tail`, `tail -n` |

**Durga Sir class lab screenshot:**

> **Pending:** `docs/assets/viewingOfFiles-session15-title-class.png` (EditPlus **Viewing of Files** heading).

**My observation:** Run `touch viewLab.txt; echo -e "line1\nline2\nline3" > viewLab.txt` — screenshot `cat viewLab.txt`.

---

## 1. `cat` — print whole file

```bash
cat notes.txt
```

**Class rule:** `cat` reads file(s) and writes to **stdout** — good for **small** files you can read in one screen.

**Durga Sir class lab screenshot:**

> **Pending:** `docs/assets/viewingOfFiles-cat-basic-class.png`

**What the screenshot should show (line by line):**

1. `cat notes.txt` — file content streams to terminal.  
2. Prompt returns when file ends.

**My observation:**

> **Pending:** `../assets/viewingOfFiles-cat-basic-my.png`

---

## 2. `cat` — multiple files

```bash
cat part1.txt part2.txt
```

**Class rule:** Output is **concatenated** in argument order (name **cat** = concatenate).

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/viewingOfFiles-cat-multiple-class.png`

**My observation:**

> **Pending:** `../assets/viewingOfFiles-cat-multiple-my.png`

---

## 3. `cat -n` / `cat -b` — line numbers

```bash
cat -n file.txt    # all lines numbered
cat -b file.txt    # number non-blank lines only
```

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/viewingOfFiles-cat-n-b-class.png`

**My observation:** Same file with `-n` and `-b` — two commands, one screenshot.

---

## 4. `tac` — reverse line order

```bash
tac file.txt
```

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/viewingOfFiles-tac-class.png`

**What the screenshot should show:** Last line of file printed **first**.

**My observation:**

> **Pending:** `../assets/viewingOfFiles-tac-my.png`

---

## 5. `rev` — reverse characters per line

```bash
rev file.txt
```

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/viewingOfFiles-rev-class.png`

**My observation:**

> **Pending:** `../assets/viewingOfFiles-rev-my.png`

---

## 6. `head` — first lines

```bash
head file.txt
head -5 file.txt
```

**Default:** first **10** lines.

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/viewingOfFiles-head-class.png`

**My observation:**

> **Pending:** `../assets/viewingOfFiles-head-my.png`

---

## 7. `tail` — last lines

```bash
tail file.txt
tail -3 file.txt
```

**Default:** last **10** lines.

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/viewingOfFiles-tail-class.png`

**My observation:**

> **Pending:** `../assets/viewingOfFiles-tail-my.png`

---

## 8. Viewing does not change the file on disk

**Class rule:** `cat` / `tac` / `rev` / `head` / `tail` are **read-only** for file content (unlike `>` / `>>`).

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/viewingOfFiles-readonly-class.png`

**My observation:** `cat file; wc -l file` — line count unchanged — screenshot.

---

## 9. Practice questions

*(Fill from Session 15 MCQs in screencast.)*

**Q1.** Command to show **last 5** lines?

- **Ans:** `tail -5 file`

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/viewingOfFiles-mcq-class.png`

**My observation:** Answer Q1 on your VM — screenshot.

---

## Appendix — frame map for PNGs

```bash
VIDEO="/home/surya/Videos/Screencasts/<Session-15>.webm"
bash scripts/file-system-navigation-and-hierarchy/extract-screencast-frames.sh \
  "$VIDEO" /tmp/viewing-frames
```

| Approx. time | Asset | Section |
| :----------- | :---- | :------ |
| ~02:00 | `viewingOfFiles-cat-basic-class.png` | §1 |
| ~08:00 | `viewingOfFiles-tac-class.png` | §4 |
| ~12:00 | `viewingOfFiles-head-class.png` | §6 |
| ~15:00 | `viewingOfFiles-tail-class.png` | §7 |

Adjust after you watch once.