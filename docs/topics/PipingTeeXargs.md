# Piping, `tee`, and `xargs` (Session 12)

**Video:** [Session 12 — Piping and importance of `tee` and `xargs`](https://www.youtube.com/watch?v=Ko3VktocAQw&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=12)  
**Instructor:** Durga Sir  
**Course title (full syllabus):** Session 25 — *Piping and Importance of tee and xargs commands*

**Prerequisites:** [redirection.md](redirection.md) (streams 0/1/2, `>`, `2>`) · [pipeCommands.md](pipeCommands.md) (first introduction to `|`) · [wordCountCommand.md](wordCountCommand.md) (`wc`) · [viewContentOfFiles.md](viewContentOfFiles.md) (`head`, `tail`, `cat`)

**Scripts:** [`scripts/PipingTeeXargs.sh`](../../scripts/PipingTeeXargs.sh) · [`scripts/PipingTeeXargs/`](../../scripts/PipingTeeXargs/)  
**Execution summary:** [`PipingTeeXargs.md`](../../scripts-execution-summary/PipingTeeXargs.md)

```bash
cd /path/to/Linux-Basics
bash scripts/PipingTeeXargs.sh
```

---

**Table of contents**

- [1. Goal of this session](#1-goal-of-this-session)
- [2. Recap — how a command gets input and sends output](#2-recap--how-a-command-gets-input-and-sends-output)
- [3. Need of piping](#3-need-of-piping)
- [4. What is a pipe (`|`)?](#4-what-is-a-pipe-)
- [5. Filter commands](#5-filter-commands)
- [6. Piping with filters — Durga Sir examples](#6-piping-with-filters--durga-sir-examples)
- [7. Long pipelines and order](#7-long-pipelines-and-order)
- [8. Pipe carries stdout only (not stderr)](#8-pipe-carries-stdout-only-not-stderr)
- [9. `tee` — write to file and screen](#9-tee--write-to-file-and-screen)
- [10. `xargs` — build command lines from stdin](#10-xargs--build-command-lines-from-stdin)
- [11. Pipe vs redirection vs `tee`](#11-pipe-vs-redirection-vs-tee)
- [12. Session checklist](#12-session-checklist)
- [13. Script index](#13-script-index)

---

## 1. Goal of this session

After [redirection](redirection.md), Durga Sir introduces **piping** — the **operating-system mechanism** to move **output of one command** directly into **input of another command** without creating a temporary file.

In the same session you learn:

| Topic | Command | One-line idea |
| :--- | :--- | :--- |
| **Piping** | **`|`** | Connect **stdout** of left command to **stdin** of right command |
| **tee** | **`tee`** | **Split** output — show on **terminal** **and** save to **file(s)** |
| **xargs** | **`xargs`** | Read **stdin**, build **argument list** for another command |

```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
pie title Session 12 — three ideas
    "Pipe |" : 40
    "tee" : 30
    "xargs" : 30
```

---

## 2. Recap — how a command gets input and sends output

Durga Sir repeats the model from the redirection session:

### Input (how a command gets data)

| # | Source | Example |
| :---: | :--- | :--- |
| 1 | **Command-line arguments** | `cat a.txt`, `ls /etc` |
| 2 | **Standard input** | Keyboard, **`< file`**, or **pipe** from previous command |

### Output (where command results go)

| # | Destination | Mechanism |
| :---: | :--- | :--- |
| 1 | **Terminal** | Default **stdout** / **stderr** |
| 2 | **File** | **Redirection** — `>`, `>>`, `2>`, `&>`, … |
| 3 | **Another command** | **Piping** — **`|`** |

So: **redirection** → file; **pipe** → **next program**.

---

## 3. Need of piping

**Without pipe** (two steps):

```bash
ls -l /etc > etclist.txt
wc -l < etclist.txt
```

**With pipe** (one step, no intermediate file):

```bash
ls -l /etc | wc -l
```

Durga Sir’s point: piping is **efficient** and **common** in real servers — logs, filters, counts, and reports are almost always **chains** of small commands.

---

## 4. What is a pipe (`|`)?

```bash
command1 | command2
```

| Part | Role |
| :--- | :--- |
| **command1** | Writes **normal output** to **stdout (1)** |
| **`|`** | Kernel **pipe** — buffer between processes |
| **command2** | Reads from **stdin (0)** |

```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
flowchart LR
    C1[command1 stdout] --> P[pipe buffer]
    P --> C2[command2 stdin]
    C2 --> T[terminal]

    classDef darkGrey fill:#5c5c5c,stroke:#3d3d3d,color:#ffffff,stroke-width:2px
    class C1,P,C2,T darkGrey
```

**Not** the same as **`>`** — `>` goes to a **file**; **`|`** goes to **another command**. See [pipeCommands.md](pipeCommands.md) for **`Broken pipe`** when the reader (`head`) exits early.

**Lab command:**

```bash
bash scripts/PipingTeeXargs/pipe-ls-head-wc-demo.sh
```

---

## 5. Filter commands

**Filter** = a command that can take **input from stdin** (keyboard **or** pipe), process it, and write **stdout**.

Durga Sir lists examples you will use often with **`|`**:

| Filter | Typical use with pipe |
| :--- | :--- |
| **`wc`** | Count lines, words, bytes |
| **`grep`** | Search for a pattern |
| **`sort`** | Sort lines |
| **`uniq`** | Remove duplicate **adjacent** lines (use after **`sort`**) |
| **`head`** / **`tail`** | First / last lines |
| **`cut`** | Columns (later session) |
| **`tr`** | Translate characters (later session) |

If a command **only** accepts file names and **never** reads stdin, it is a **poor** filter for piping (unless you use **`xargs`**).

---

## 6. Piping with filters — Durga Sir examples

**Filter commands** (`wc`, `head`, `sort`, …) can read input in **two** ways:

| Source | Meaning |
| :--- | :--- |
| **Keyboard (terminal)** | Run the filter **alone**, type lines, end with **Ctrl+D** |
| **Pipe** | Previous command’s **stdout** becomes this command’s **stdin** |

---

### Your lab — `wc` (`scripts/linuxbasics`)

**1) Input from the terminal (keyboard):**

```bash
cd scripts/linuxbasics
wc
```

Type lines (e.g. `This is first line`, `This is second line`), then **Ctrl+D**.  
**`wc`** prints three numbers: **lines**, **words**, **characters** (example: `2  8  41`).

**2) Input from another command’s output (pipe):**

```bash
ls -l /etc | wc
```

Here **`wc`** does **not** read the keyboard — it counts whatever **`ls -l /etc`** printed (example: `246  2223  20956`).

![Terminal: wc with keyboard input, then ls -l /etc | wc](../assets/pipe-wc-keyboard-and-ls-etc-pipe-terminal.png)

---

### Your lab — `head` (keyboard, then pipe)

![Terminal: head from keyboard, then ls -l /etc | head -5 (total line, Broken pipe)](../assets/piping1-head-keyboard-ls-etc-head5-terminal.png)

**1) Input from the terminal:**

```bash
head
```

Type lines from the keyboard (Durga Sir lab: up to **10 lines**). When you press **Enter** after the tenth line, or when you press **Ctrl+D**, **`head`** prints only the **first 10 lines** of what you typed.

**2) Input from a pipe:**

```bash
ls -l /etc | head -5
```

**`head`** reads the **`ls`** listing from the pipe and shows the **first 5 lines** on screen (including the **`total`** line) — you do not type the `/etc` listing yourself. You may see **`ls: Broken pipe`** after **`head`** exits; that is normal when the reader stops early (see [pipeCommands.md](pipeCommands.md#5-broken-pipe--what-does-it-mean)).

---

### `ls -l` and the **`total`** line (after pipe examples)

Whenever you run **`ls -l`** on a directory (including **`ls -l /etc | …`**), the **first line** of the listing looks like:

```text
total 1234
```

Durga Sir’s point: **`total`** is **not** the number of files. It is the **total disk blocks** used by the **files and directories** listed for that folder (here, under **`/etc`**). The lines below **`total`** are the individual files and directories.

---

### Example 3 — `who | wc -l`

**How many users** logged in (class wording: count lines of `who` output):

```bash
who | wc -l
```

### Example 4 — `cat` file | `sort` | `uniq`

Remove duplicate lines ( **`uniq` only removes repeats on consecutive lines**, so **`sort` first**):

```bash
cat marks.txt | sort | uniq
```

With counts:

```bash
cat marks.txt | sort | uniq -c
```

**Lab command:**

```bash
bash scripts/PipingTeeXargs/pipe-filters-sort-uniq-demo.sh
```

### Example 5 — `ls` | `grep` (pattern)

List only lines matching a pattern (when `grep` is already introduced):

```bash
ls -l | grep ".sh"
```

---

## 7. Long pipelines and order

Durga Sir stresses: **order matters** — each command reads what the **previous** command produced.

### Your lab — `ls -l | wc` then `ls -l | wc | wc -l` (`scripts/linuxbasics`)

```bash
cd scripts/linuxbasics
ls -l | wc
ls -l | wc | wc -l
```

![Terminal: ls -l | wc then ls -l | wc | wc -l](../assets/pipe-ls-wc-wc-l-long-pipeline-terminal.png)

**What you see (from the screenshot):**

| Step | Command | Output | Meaning |
| :---: | :--- | :--- | :--- |
| 1 | `ls -l \| wc` | `30  267  1808` | **`wc`** counted the **whole `ls -l` listing**: **30 lines**, **267 words**, **1808 bytes/characters** |
| 2 | `ls -l \| wc \| wc -l` | `1` | The **middle `wc`** prints **one summary line** (`30 267 1808`). The **last `wc -l`** only counts **lines in that one line** → always **`1`** |

**Point by point:**

1. **`ls -l`** sends a **multi-line** listing to the pipe (one line per file/dir, plus the **`total`** line).
2. **First `wc`** (no flags) reads that listing from **stdin** and prints **three numbers**: lines, words, characters.
3. That **single line** of three numbers becomes the **input** to the **next** command in the chain.
4. **`wc -l`** at the end counts **how many lines** it received — here **one line**, so output is **`1`**.
5. This is **not** “30 files”; it is “**one line** of `wc` statistics.” To count **files**, use something like `ls -l | grep -v '^total' | wc -l` (later topic) or count entries another way.

**Another long pipeline (class pattern):**

```bash
cat data.txt | sort | uniq | wc -l
```

Read left to right: **read file → sort → unique → count lines**.

---

## 8. Pipe carries stdout only (not stderr)

**Pipe connects stdout (1) to stdin (0).**  
**Stderr (2) is not piped** unless you redirect it separately (`2>`) or merge streams (`&>`).

```bash
cal 99999 | wc -l
```

The **error message** still appears on the **terminal**; **`wc`** may get **no** useful calendar output.

**Lab command:**

```bash
bash scripts/PipingTeeXargs/pipe-stdout-only-not-stderr-demo.sh
```

---

## 9. `tee` — write to file and screen

**`tee`** is named like the letter **T** — **split** the stream:

- One copy → **terminal** (you still **see** output)
- One copy → **file** (you **save** output)

### Basic use

```bash
ls -l | tee listing.txt
```

Same output on screen **and** in **`listing.txt`**.

### Append — `tee -a`

```bash
echo "line 1" | tee log.txt
echo "line 2" | tee -a log.txt
```

### Multiple files

```bash
echo "report" | tee file1.txt file2.txt
```

Durga Sir uses **`tee`** when you need **both** human viewing **and** a log file (install logs, long command output).

**Lab commands:**

```bash
bash scripts/PipingTeeXargs/tee-screen-and-file-demo.sh
bash scripts/PipingTeeXargs/tee-append-multiple-files-demo.sh
```

---

## 10. `xargs` — build command lines from stdin

**Problem:** Some commands want **file names as arguments** (`touch a b c`, `wc file1 file2`), but a pipe gives **stdin**, not argv.

**`xargs`** reads **stdin** (often lines or words) and **appends** them as arguments to a command (default command is **`echo`** if you omit one).

### Example 1 — create files from a word list

```bash
echo "apple banana cherry" | xargs touch
```

Creates **`apple`**, **`banana`**, **`cherry`**.

### Example 2 — `xargs -n`

Run command with **at most N arguments** per invocation:

```bash
printf 'one two three four\n' | xargs -n 2 echo
```

### Example 3 — pipe file list into `wc`

```bash
ls /path/to/scripts/*.sh | xargs wc -l
```

Each path becomes an argument to **`wc -l`**.

Durga Sir warning: **`find … | xargs rm`** is dangerous — wrong matches delete files. Always test with **`echo`** first.

**Lab commands:**

```bash
bash scripts/PipingTeeXargs/xargs-build-command-line-demo.sh
bash scripts/PipingTeeXargs/xargs-with-find-style-demo.sh
```

---

## 11. Pipe vs redirection vs `tee`

| Mechanism | Symbol / command | Connects to |
| :--- | :--- | :--- |
| **Pipe** | **`|`** | **Next command’s stdin** |
| **Redirect** | **`>`**, **`>>`**, **`2>`** | **File** |
| **tee** | **`tee file`** | **Terminal and file(s)** at once |

Combine when needed:

```bash
ls -l /etc | tee etclist.txt | wc -l
```

---

## 12. Session checklist

- [ ] Explain **three** output destinations: terminal, file, **pipe**
- [ ] Run `ls -l /etc | head` and `ls -l /etc | wc -l`
- [ ] Run `cat marks.txt | sort | uniq` and `uniq -c`
- [ ] Show `cal 99999 | wc -l` — error on screen, pipe does not carry stderr
- [ ] Run `ls -l | tee listing.txt` and confirm file + screen
- [ ] Run `echo "a b c" | xargs touch`
- [ ] Run `bash scripts/PipingTeeXargs.sh`
- [ ] Add lab **screenshots** under each block after class (same workflow as `redirection.md`)

---

## 13. Script index

| Script | Topic |
| :--- | :--- |
| [`PipingTeeXargs.sh`](../../scripts/PipingTeeXargs.sh) | Run all Session 12 demos |
| [`pipe-ls-head-wc-demo.sh`](../../scripts/PipingTeeXargs/pipe-ls-head-wc-demo.sh) | `ls \| head`, `ls \| wc -l` |
| [`pipe-filters-sort-uniq-demo.sh`](../../scripts/PipingTeeXargs/pipe-filters-sort-uniq-demo.sh) | `sort \| uniq` |
| [`pipe-stdout-only-not-stderr-demo.sh`](../../scripts/PipingTeeXargs/pipe-stdout-only-not-stderr-demo.sh) | stderr not piped |
| [`tee-screen-and-file-demo.sh`](../../scripts/PipingTeeXargs/tee-screen-and-file-demo.sh) | `tee` to file + screen |
| [`tee-append-multiple-files-demo.sh`](../../scripts/PipingTeeXargs/tee-append-multiple-files-demo.sh) | `tee -a`, multiple files |
| [`xargs-build-command-line-demo.sh`](../../scripts/PipingTeeXargs/xargs-build-command-line-demo.sh) | `xargs touch`, `-n` |
| [`xargs-with-find-style-demo.sh`](../../scripts/PipingTeeXargs/xargs-with-find-style-demo.sh) | `ls *.sh \| xargs wc -l` |

Full command tables: [`scripts-execution-summary/PipingTeeXargs.md`](../../scripts-execution-summary/PipingTeeXargs.md).
