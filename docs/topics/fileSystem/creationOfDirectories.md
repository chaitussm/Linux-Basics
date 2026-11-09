# Creation of Directories (`mkdir`) — Session 10

**Instructor:** Durga Sir  
**Source recordings (frame extraction):** Part 1 — `Screencast From 2026-11-09 17-32-23.webm` (~39 min); Part 2 — `Screencast From 2026-11-09 18-12-23.webm` (~32 min)  
**Notes file on screen:** `linux_online_running_notes.txt` (EditPlus)  
**Approximate time mapping:** frame `f_NNNN` ≈ **(N − 1) × 90s** from the start of that recording (e.g. `f_0002` ≈ 01:30).

**Prior session context (end of notes before this topic):** `ls` command, `date`, `cal`.

---

## Chronological outline (Part 1, then Part 2)

### Part 1 — `Screencast From 2026-11-09 17-32-23.webm`

| Approx. time | Frame | Source | Content | Topic |
| :----------- | :---- | :----- | :------ | :---- |
| 00:00 | f_0001 | EditPlus | `Working with Directories:` (section header after `ls`, `date`, `cal`) | Transition into directory operations |
| 01:30 | f_0002 | VM GUI | Ubuntu Files on **Desktop** — folder empty | Demo workspace on `~/Desktop` (no terminal yet) |
| 03:00 | f_0003 | EditPlus | **1. Creation of directories:** `1. mkdir dir1` — *To create a directory*; `2. mkdir dir1 dir2 dir3` — *To create multiple directories*; `3. mkdir dir1/dir2/dir3` (started) | Basic `mkdir` syntax: one dir, many dirs, path form |
| 04:30 | f_0004 | EditPlus | Continues point 3: `mkdir dir1/dir2/dir3` (cursor on next line) | Nested path syntax (explanation follows) |
| 06:00 | f_0005 | EditPlus | `3. mkdir dir1/dir2/dir3` → *In this case only dir3 will be created. But make sure dir1 should be already available and in that dir2 should be available already.* | **Relative path:** only the **last** component is created; parents must exist |
| 07:30 | f_0006 | EditPlus + Q&A | Same notes; error line: `mkdir: cannot create directory 'dir1/dir2/dir3': No such file or directory`; chat questions on path vs backslash | Error when parent dirs missing; path uses `/` not `\` |
| 09:00 | f_0007 | EditPlus | `4. mkdir -p dir1/dir2/dir3`; `-p means path of directories` | **`-p` (parents):** create full path, including missing parents |
| 10:30 | f_0008 | Terminal (`~/Desktop` … later `~/Desktop`) | From deep path: `cd ../../..` → `pwd` → `/home/durga/Desktop`; then `mkdir -p dir1/dir2/dir3` | Live demo: navigation up with `..`; **`mkdir -p`** on existing tree |
| 12:00 | f_0009 | EditPlus | `-p` recap; question: *if we want to create dir0 before dir1 if dir1/dir2/dir3 is already available?* | Restructuring: insert new parent above existing tree |
| 13:30 | f_0010 | EditPlus | Target layout `dir0/dir1/dir2/dir3`; options: `mkdir -p dir0/dir1/dir2/dir3` **or** `mkdir dir0` then `mv dir1/dir2/dir3 dir0` | **`-p` vs `mkdir` + `mv`** to wrap existing hierarchy |
| 15:00 | f_0011 | Terminal | Output of `sudo apt install tree` (package `tree` 1.7.0-5) | Install **`tree`** to visualize directories |
| 16:30 | f_0012 | Terminal | `sudo apt install tree` typed at `durga@durga-VirtualBox:~/Desktop$` | Same install command |
| 18:00 | f_0013 | EditPlus | `$ sudo apt install tree`; example `tree dir1` output: `dir1` → `a.txt`, `b.txt`, `c.txt`, `dir2` → `dir3` | Notes: verify hierarchy with **`tree`** |
| 19:30 | f_0014 | Terminal | `mkdir -p dir1/dir2/dir3` then `tree dir1` → 2 directories, 3 files under `dir1` | Demo: **`-p`** + **`tree`** after mkdir |
| 21:00 | f_0015 | EditPlus | `mkdir -p dir1/dir2/dir3` | Recap one-liner |
| 22:30 | f_0016 | EditPlus | **Case Study: Heroines Schedule Manager** — structure: `heroines` → `sunny`, `katrina`, `kareena`, `karishma` | Case study intro |
| 24:00 | f_0017 | EditPlus | *3 years schedules*; under each heroine: `jan2020,feb2020,mar2020,....2021,.2022` | Per-heroine month/year folders (2020–2022) |
| 25:30 | f_0018 | EditPlus | Same tree; *In every month folder:* `schedule_1.txt` … `schedule_31.txt` | Files inside each month dir (touch later) |
| 27:00 | f_0019 | EditPlus | Full case-study spec (highlighted block) | Requirements before commands |
| 28:30 | f_0020 | EditPlus | `$ mkdir heroines` | Step 1: create top-level dir |
| 30:00 | f_0021 | EditPlus | `cd heroines`; `mkdir sunny katrina kareena karishma`; `cd sunny`; Q: *sir mkdir -p heroines/sunny/katrina/kasrishma will it work?* | Manual steps; **Q:** `-p` with slashes ≠ multiple siblings |
| 31:30 | f_0022 | EditPlus | Continue manual month list: `mkdir jan2020 feb2020 mar2020 .....jan2021 feb2021.....jan2022...` | Tedious manual `mkdir` for all months/years |
| 33:00 | f_0023 | EditPlus | `mkdir -p heroines/{sunny,katrina,kareena,karishma}` | **Brace expansion** for four heroine dirs |
| 34:30 | f_0024 | EditPlus | Same brace command (highlighted) | Emphasis on `{name1,name2,...}` |
| 36:00 | f_0025 | EditPlus | Full one-liner (wrapped in editor): `mkdir -p heroines/{sunny,katrina,kareena,karishma}/{jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec}_{2020,2021,2022}` | **Nested brace expansion** — all months × years × heroines |
| 37:30 | f_0026 | EditPlus | Same command; sample expanded paths e.g. `heroines/sunny/jan_2020`, `heroines/sunny/feb_2021`, … | How expansion maps to real paths |
| 39:00 | f_0027 | Terminal | `mkdir -p heroines/{sunny,katrina,kareena,karishma}/{jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec}_202{0,1,2}` | Live run on `~/Desktop` (compact year brace `202{0,1,2}`) |

---

### Part 2 — `Screencast From 2026-11-09 18-12-23.webm`

| Approx. time | Frame | Source | Content | Topic |
| :----------- | :---- | :----- | :------ | :---- |
| 00:00 | f_0001 | Files GUI | Path: `Desktop/heroines/sunny` — 36 folders `jan_2020` … `dec_2022` | Verify brace+`mkdir -p` result (GUI) |
| 01:30 | f_0002 | EditPlus | Case-study commands recap: `mkdir heroines`, `cd heroines`, `mkdir sunny katrina kareena karishma`, `cd sunny`, long `mkdir jan2020...` | Recap manual approach vs automation |
| 03:00 | f_0003 | EditPlus | Full `mkdir -p heroines/{...}/{jan,...,dec}_202{0,1,2}`; start `touch schecule_` | **`touch`** for schedule files (typo *schecule* in notes) |
| 04:30 | f_0004 | EditPlus | `touch heroines/{sunny,katrina,kareena,karishma}/{jan,...,dec}_202{0,1,2}/schecule_{1..31}.txt` | **Brace + range `{1..31}`** — 31 files per month folder |
| 06:00 | f_0005 | Files GUI | Under `heroines/sunny/may_2020` — folders `kareena`, `karishma`, `katrina`, `sunny` (likely separate demo/mis-navigation; class still on heroines tree) | GUI exploration |
| 07:30 | f_0006 | EditPlus | `mkdir` + `touch` one-liners (full) | Complete case-study automation |
| 09:00 | f_0007 | Terminal | `tree` summary: `148 directories, 4464 files`; ends with `schecule_9.txt` in listing; prompt `~/Desktop$` | **`tree`** proves scale of mkdir+touch |
| 10:30 | f_0008 | EditPlus | Same `touch` line; line: `Linux...smart, powerful, strong` | Shell power / morale line |
| 12:00 | f_0009 | EditPlus | **Q.** *Create 5 directories named with dir1, dir2, dir3, dir4 and dir5. In these directories create empty files named with a.txt,b.txt,c.txt?* | Practice question |
| 13:30 | f_0010 | EditPlus | **A.** `mkdir dir{1..5}` | **`mkdir` + numeric brace range** |
| 15:00 | f_0011 | Terminal | `ls` → `heroines`; `mkdir dir{1..5}` (typed) | **`ls` before mkdir**; create five dirs on Desktop |
| 16:30 | f_0012 | Diagram | **Diagram4** — tree: `/` → `home` → `durgasoft`/`durga` → branches **X** (`X1`→`X11`,`X12`; `X2`) and **Y** (`Y1`→`Y11`,`Y12`; `Y2`) | Target hierarchy for next case study |
| 18:00 | f_0013 | Diagram + Q&A | Same diagram with red marks; chat: *use tree for only dir{1..5} except heroine*; brace sequence questions | Class Q&A; **`tree dir{1..5}`** suggestion |
| 19:30 | f_0014 | EditPlus | `mkdir dir{1..5}`; `touch dir{1..5}/{a..c}.txt`; **case study:** `cd /home/durga`, `mkdir x y`, `cd x`, `mkdir x1 x2`, `cd x1`, `mkdir` (in progress) | Answer files; start **X/Y tree** manually |
| 21:00 | f_0015 | Terminal | `touch dir{1..5}/{a..c}.txt` at `~/Desktop$` | 15 files (3 per dir) via expansion |
| 22:30 | f_0016 | Terminal | `cd /home/durga/Desktop`; `mkdir x y`; `cd x`; `mkdir x1 x2`; `cd x1`; `mkdir x11 x12`; `cd /home/durga/Desktop`; `cd y`; `mkdir y1 y2`; `cd y1`; `mkdir y11 y12` — ends in `~/Desktop/y/y1` | **Absolute vs relative `cd`**; multiple `mkdir` args |
| 24:00 | f_0017 | Terminal | Empty prompt `durga@durga-VirtualBox:~/Desktop$` | Brief pause / new demo setup |
| 25:30 | f_0018 | EditPlus | Same manual X/Y steps; `mkdir -p {x,y}` (highlight `{x,y}`) | Intro **`mkdir -p` + top-level brace** |
| 27:00 | f_0019 | EditPlus | `mkdir -p x/x1/x1{1,2}` (highlight `x1{1,2}`) | **`-p` + brace** for `x11`,`x12` in one command |
| 28:30 | f_0020 | Files GUI | Path `Desktop/y/y1` — folders `x`, `y` selected | GUI check (verify created names) |
| 30:00 | f_0021 | EditPlus | **Q.** *What is the difference between the following 2 commands?* `mkdir dir1/dir2/dir3` vs `mkdir -p dir1/dir2/dir3` | Interview-style comparison |
| 31:30 | f_0022 | EditPlus | **A.** `mkdir dir1/dir2/dir3` ===> *only dir3 will be created. but make sure dir1 and dir2 should be available already*; `mkdir -p dir1/dir2/dir3` ----> *complete path of directories will be created.* | **`mkdir` vs `mkdir -p`** summary |

---

## Reference — `mkdir` syntax covered in class

| # | Syntax / command | Meaning |
| :- | :----------------- | :------ |
| 1 | `mkdir dir1` | Create a single directory in the current working directory |
| 2 | `mkdir dir1 dir2 dir3` | Create **multiple sibling** directories at once (space-separated names) |
| 3 | `mkdir dir1/dir2/dir3` | Create **only** `dir3` inside existing `dir1/dir2/` (relative path); fails if parents missing |
| 4 | `mkdir -p dir1/dir2/dir3` | **`-p` = parent paths** — create `dir1`, `dir2`, and `dir3` as needed |
| 5 | `mkdir -p dir0/dir1/dir2/dir3` **or** `mkdir dir0` + `mv dir1/dir2/dir3 dir0` | Add a new parent around an existing subtree |
| 6 | `mkdir dir{1..5}` | Numeric **brace expansion** — `dir1` … `dir5` |
| 7 | `mkdir -p heroines/{sunny,katrina,kareena,karishma}` | Brace list for multiple subdirs under one parent |
| 8 | `mkdir -p heroines/{sunny,katrina,kareena,karishma}/{jan,feb,...,dec}_202{0,1,2}` | Nested braces: every heroine × every month × 2020–2022 |
| 9 | `mkdir -p x/x1/x1{1,2}` | Shorthand for `x11` and `x12` under `x/x1/` |
| 10 | `mkdir -p {x,y}` | Create top-level `x` and `y` (with `-p` as shown in notes) |

**Common error (no `-p`):**

```text
mkdir: cannot create directory 'dir1/dir2/dir3': No such file or directory
```

**Related commands (same session):**

- `cd`, `pwd`, `cd ..`, `cd ../../..`, absolute `cd /home/durga/Desktop`
- `ls` (e.g. before creating `dir{1..5}`)
- `sudo apt install tree` and `tree dir1` / full-desktop `tree` summary
- `touch dir{1..5}/{a..c}.txt` and long `touch .../schecule_{1..31}.txt` (files inside dirs created by `mkdir`)
- `mv dir1/dir2/dir3 dir0` when restructuring

**Class Q&A highlights**

- Paths use **forward slash** `/`, not Windows `\`.
- `mkdir -p heroines/sunny/katrina/...` creates a **nested chain**, not four folders beside each other under `heroines`.
- After practice dirs: *use `tree` for only `dir{1..5}` except heroine* (student suggestion in chat).

---

## Case studies

### Heroines Schedule Manager

1. **Layout:** `heroines/{sunny,katrina,kareena,karishma}/{month}_{year}/` with `schedule_1.txt` … `schedule_31.txt` in each month (notes use `schecule_{1..31}.txt`).
2. **Manual path:** `mkdir heroines` → `cd heroines` → `mkdir sunny katrina kareena karishma` → per-heroine `cd` and long month `mkdir` lists.
3. **Smart path:** one `mkdir -p` with nested `{...}` braces; optional compact years `_202{0,1,2}`.
4. **Scale check:** `tree` reported **148 directories, 4464 files** after mkdir + touch.

### Diagram4 — X / Y directory tree

Target (under `/home/durga` or Desktop per demo):

```text
x/
  x1/
    x11/
    x12/
  x2/
y/
  y1/
    y11/
    y12/
  y2/
```

Built stepwise with `mkdir` + `cd`, then condensed with `mkdir -p x/x1/x1{1,2}` (and analogous patterns for `y`).

---

## Frames without notes or mkdir-related terminal text

| Part | Frame | Approx. time | Note |
| :--- | :---- | :----------- | :--- |
| 1 | f_0002 | 01:30 | GUI only — empty Desktop |
| 2 | f_0001 | 00:00 | GUI verification of `sunny` month folders |
| 2 | f_0005 | 06:00 | GUI under `may_2020` |
| 2 | f_0017 | 24:00 | Empty terminal at `~/Desktop` |
| 2 | f_0020 | 28:30 | GUI under `y/y1` |

---

*Outline derived from PNG frames `f_0001`–`f_0027` (p1) and `f_0001`–`f_0022` (p2) at 90s spacing.*
