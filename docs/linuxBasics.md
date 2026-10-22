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
