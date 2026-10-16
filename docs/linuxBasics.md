# Linux Basics — Study Index

*Durga Sir — [YouTube playlist](https://www.youtube.com/watch?v=txRD_bK062Y&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY)*

Each topic has its own **`.md` file** under [`topics/`](topics/). **All runnable examples** live in [`../scripts/`](../scripts/) as **`.sh`** files.

---

## Video index

| # | Topic file | Video |
| :---: | :--- | :--- |
| 1 | *(Session 1 notes — in earlier merged guide; more topic files coming)* | [Session 1](https://www.youtube.com/watch?v=txRD_bK062Y&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=1) |
| 2 | [**Components of Unix.md**](topics/Components%20of%20Unix.md) | [Session 2](https://www.youtube.com/watch?v=2zfh8eC7cY0&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=2) |
| 3 | [**TypesOfFilesInLinux.md**](topics/TypesOfFilesInLinux.md) | [Session 3](https://www.youtube.com/watch?v=-Y4bjL-fBMY&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=3) |

---

## Topic files

| File | Subject |
| :--- | :--- |
| [**Components of Unix.md**](topics/Components%20of%20Unix.md) | Shell, kernel, execution flow, first script (Video 2) |
| [**Bash Built-in Commands.md**](topics/Bash%20Built-in%20Commands.md) | Full `help` list — each builtin with example |
| [**TypesOfFilesInLinux.md**](topics/TypesOfFilesInLinux.md) | Normal, directory, device files; `ls -l`, `file`, `tty` |

---

## Run examples (Ubuntu + VS Code terminal)

```bash
cd /path/to/Linux-Basics
chmod +x scripts/*.sh
bash scripts/invalid-command-demos.sh
bash scripts/command-execution-touch-demo.sh
bash scripts/run-test-script.sh
```

See **[scripts/README.md](../scripts/README.md)** for the full script list.
