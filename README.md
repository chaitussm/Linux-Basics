# Linux Basics Learning Project

Hands-on companion for **Durga Sir**'s Linux course ([YouTube playlist](https://www.youtube.com/watch?v=txRD_bK062Y&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY)).

## Contents

| Path | Description |
| :--- | :--- |
| [`docs/topics/linuxBasics.md`](docs/topics/linuxBasics.md) | Index to topic notes and scripts |
| [`docs/topics/`](docs/topics/) | All topic notes (the complete discussion for each video) |
| [`docs/troubleshooting/`](docs/troubleshooting/) | Git and tooling error resolutions |
| [`docs/assets/`](docs/assets/) | Screenshots used by the notes |
| [`exercises/`](exercises/) | Topic-based practice READMEs and sample data |
| [`scripts/`](scripts/) | One kebab-case folder per topic with `.sh` demos (see [`scripts/README.md`](scripts/README.md)) |
| [`scripts-execution-summary/`](scripts-execution-summary/) | Generated run-through of every script |

## Repository layout

```text
Linux-Basics/
├── docs/
│   ├── topics/            # notes (md) per topic
│   ├── troubleshooting/   # git error fixes
│   └── assets/            # screenshots
├── exercises/             # 01-… to 06-… practice
├── scripts/
│   ├── <topic-name>/      # *-demo.sh files + run-all.sh where available
│   └── linux-basics-practice/  # scratch scripts, sample text and screenshots
└── scripts-execution-summary/
```

Naming rules: folders are lowercase `kebab-case`; demo scripts end in `-demo.sh`; a topic's orchestrator is `run-all.sh` inside the topic folder.

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
