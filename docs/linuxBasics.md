# Linux Basics — Study Index

*Durga Sir — [YouTube playlist](https://www.youtube.com/watch?v=txRD_bK062Y&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY)*

Each topic has its own **`.md` file** under [`topics/`](topics/). Runnable **`.sh`** demos live under [`../scripts/`](../scripts/) in **topic folders** (same name as the lesson, e.g. `scripts/components-of-unix/`). See [`scripts/README.md`](../scripts/README.md). For **what each script runs**, see [`scripts-execution-summary/README.md`](../scripts-execution-summary/README.md).

---

## Video index

| # | Topic file | Video |
| :---: | :--- | :--- |
| 1 | *(Session 1 notes — in earlier merged guide; more topic files coming)* | [Session 1](https://www.youtube.com/watch?v=txRD_bK062Y&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=1) |
| 2 | [**Components of Unix.md**](topics/Components%20of%20Unix.md) | [Session 2](https://www.youtube.com/watch?v=2zfh8eC7cY0&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=2) |
| 3 | [**TypesOfFilesInLinux.md**](topics/TypesOfFilesInLinux.md) | [Session 3](https://www.youtube.com/watch?v=-Y4bjL-fBMY&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=3) |
| 4 | [**File System Navigation Commands And Hierarchy.md**](topics/File%20System%20Navigation%20Commands%20And%20Hierarchy.md) | [Session 4](https://www.youtube.com/watch?v=Aqx97d4NSbg&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=4) |
| 7 | [**ls Command and its options.md**](topics/ls%20Command%20and%20its%20options.md) | [Session 7](https://www.youtube.com/watch?v=rpxT2L3t1a8&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=7) |
| 8 | [**Date and Cal commands.md**](topics/Date%20and%20Cal%20commands.md) | [Session 8](https://www.youtube.com/watch?v=NmJyVY1Mvww&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=8) |
| 9 | [**viewContentOfFiles.md**](topics/viewContentOfFiles.md) | [Session 9](https://www.youtube.com/watch?v=FuzpoZwDcZU&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=9) |
| 10 | [**wordCountCommand.md**](topics/wordCountCommand.md) | [Session 10 — `wc`](https://www.youtube.com/watch?v=hmPHZBR-9Wk&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=10) |
| 11 | [**redirection.md**](topics/redirection.md) | [Session 11 — Redirection](https://www.youtube.com/watch?v=f_B6BIxlYFw&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=11) |
| 12 | [**PipingTeeXargs.md**](topics/PipingTeeXargs.md) | [Session 12 — Pipe, tee, xargs](https://www.youtube.com/watch?v=Ko3VktocAQw&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=12) |

---

## Topic files

| File | Subject |
| :--- | :--- |
| [**Components of Unix.md**](topics/Components%20of%20Unix.md) | Shell, kernel, execution flow, first script (Video 2) |
| [**Bash Built-in Commands.md**](topics/Bash%20Built-in%20Commands.md) | Full `help` list — each builtin with example |
| [**TypesOfFilesInLinux.md**](topics/TypesOfFilesInLinux.md) | Normal, directory, device files; `ls -l`, `file`, `tty` |
| [**File System Navigation Commands And Hierarchy.md**](topics/File%20System%20Navigation%20Commands%20And%20Hierarchy.md) | `pwd`, `cd`, paths, `.` / `..`, FHS under `/` (Video 4) |
| [**ls Command and its options.md**](topics/ls%20Command%20and%20its%20options.md) | `ls`, `man`, `-l`, `-a`, `-A`, `-F`, `-R`, `-i`, `-h`, pipes (Video 7) |
| [**pipeCommands.md**](topics/pipeCommands.md) | Pipe `\|`, `ls -l /etc \| head`, broken pipe |
| [**Date and Cal commands.md**](topics/Date%20and%20Cal%20commands.md) | `date`, `date +format`, `cal`, options (Video 8) |
| [**Steps To Write a Shell Script.md**](topics/Steps%20To%20Write%20a%20Shell%20Script.md) | `#!/bin/bash`, write and run `.sh` files (beginner guide) |
| [**viewContentOfFiles.md**](topics/viewContentOfFiles.md) | `cat`, `tac`, `rev`, `head`, `tail`, `more`, `less` (Video 9) |
| [**wordCountCommand.md**](topics/wordCountCommand.md) | `wc` — lines, words, bytes; `-l`, `-w`, `-c`; pipes (Video 10) |
| [**redirection.md**](topics/redirection.md) | Streams 0/1/2; `>`, `2>`, `<`, `&>`; `tty` / `/dev/pts` (Video 11) |
| [**PipingTeeXargs.md**](topics/PipingTeeXargs.md) | Pipe `\|`, filters, `tee`, `xargs` (Video 12) |
| [**EOF and Redirection.md**](topics/EOF%20and%20Redirection.md) | `>`, `>>`, `<`, heredoc `<<EOF` (overwrite vs append) |

---

## Run examples (Ubuntu + VS Code terminal)

```bash
cd /path/to/Linux-Basics
chmod +x scripts/**/*.sh
bash scripts/components-of-unix/invalid-command-demos.sh
bash scripts/components-of-unix/command-execution-touch-demo.sh
bash scripts/components-of-unix/run-test-script.sh
```

See **[scripts/README.md](../scripts/README.md)** for the full script list.
