# Linux Basics Learning Project

Hands-on companion for **Durga Sir**'s Linux course ([YouTube playlist](https://www.youtube.com/watch?v=txRD_bK062Y&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY)).

## Contents

| Path | Description |
| :--- | :--- |
| [`docs/linuxBasics.md`](docs/linuxBasics.md) | Index to topic notes and scripts |
| [`docs/topics/Components of Unix.md`](docs/topics/Components%20of%20Unix.md) | Video 2 — shell, kernel, execution flow |
| [`exercises/`](exercises/) | Topic-based practice READMEs and sample data |
| [`scripts/`](scripts/) | Topic folders with `.sh` demos (see [`scripts/README.md`](scripts/README.md)) |

## Topics covered

1. **Introduction** — OS concepts, Unix/Linux features, distros, architecture  
2. **File system & navigation** — hierarchy, `pwd`, `cd`, `ls`, `mkdir`, …  
3. **Files** — `touch`, `cat`, links, compare, `sort`/`uniq`, `wc`  
4. **Redirection & pipes** — `>`, `>>`, `2>`, `\|`, `&&`  
5. **Search & filters** — wildcards, regex, `grep`, `cut`, `find`, `locate`  
6. **Compression** — `tar`, `gzip`, `gunzip`  
7. **Permissions & editors** — `chmod`, `chown`, `vi`/`vim` basics  
8. **Shell scripting** — variables, conditionals, loops (see `scripts/`)  
9. **Admin basics** — cron, users, processes, packages (theory in docs)

## How to practice

```bash
cd exercises/01-navigation
# Follow README.md and run commands on your Linux VM or WSL
```

```bash
chmod +x scripts/**/*.sh
bash scripts/shell-scripting/hello.sh Linux
bash scripts/components-of-unix/invalid-command-demos.sh
```

## Requirements

- Any Linux environment (Ubuntu recommended) or WSL2 on Windows
- Bash shell (default on most distros)

## License

Educational use — notes derived from publicly available course structure by Durga Sir (Durga Soft).
