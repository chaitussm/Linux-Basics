# Shell scripts by topic

Scripts are grouped in folders that match **`docs/topics/*.md`** notes (one folder per video/topic).

**Command-by-command explanations** (flowcharts, pie charts, Ctrl+click to each `.sh`): [`scripts-execution-summary/`](../scripts-execution-summary/README.md)

## Layout

| Folder | Topic `.md` file | Purpose |
| :--- | :--- | :--- |
| [`components-of-unix/`](components-of-unix/) | [Components of Unix.md](../docs/topics/Components%20of%20Unix.md) | Shell, kernel, execution flow (Video 2) |
| [`types-of-files-in-linux/`](types-of-files-in-linux/) | [TypesOfFilesInLinux.md](../docs/topics/TypesOfFilesInLinux.md) | File types, `touch`, `file`, `ls -l`, `tty` (Video 3) |
| [`bash-built-in-commands/`](bash-built-in-commands/) | [Bash Built-in Commands.md](../docs/topics/Bash%20Built-in%20Commands.md) | `help` builtins + `cat`, `gedit`, `ls -l` size |
| [`file-system-navigation-and-hierarchy/`](file-system-navigation-and-hierarchy/) | [File System Navigation Commands And Hierarchy.md](../docs/topics/File%20System%20Navigation%20Commands%20And%20Hierarchy.md) | `pwd`, `cd`, paths, FHS (Video 4) |
| [`ls-command-and-its-options/`](ls-command-and-its-options/) | [ls Command and its options.md](../docs/topics/ls%20Command%20and%20its%20options.md) | `ls` and options (Video 7) |
| [`shell-scripting/`](shell-scripting/) | Shell scripting examples | `hello.sh`, `check-file.sh`, `backup-logs.sh` |
| [`scripts-execution-summary/`](../scripts-execution-summary/) | Per-topic **execution summary** `.md` files | Explains every command in each `.sh` |

## Session 8 — root script

| Script | Description |
| :--- | :--- |
| [`Date and Cal commands.sh`](Date%20and%20Cal%20commands.sh) | `date`, `date +format`, `cal`, options (Video 8) |

See [DateandCal Execution summary.md](../scripts-execution-summary/DateandCal%20Execution%20summary.md).

## Run from repo root

```bash
cd /path/to/Linux-Basics
chmod +x scripts/**/*.sh
chmod +x "scripts/Date and Cal commands.sh"
bash "scripts/Date and Cal commands.sh"
bash scripts/components-of-unix/invalid-command-demos.sh
bash scripts/types-of-files-in-linux/file-command-content-demo.sh
bash scripts/bash-built-in-commands/cat-command-demo.sh
bash scripts/shell-scripting/hello.sh "Linux"
```

## Adding scripts for a new video (procedure)

1. Add **`docs/topics/<TopicName>.md`** (notes, flowcharts, examples).
2. Create **`scripts/<topic-folder>/`** (kebab-case, same theme as the `.md` file).
3. Add **`.sh`** demos only in that folder; link them from the `.md` with Ctrl+click paths.
4. Update this README table and [`docs/linuxBasics.md`](../docs/linuxBasics.md) video index.
5. Open a PR.

**Topic folder naming:** lowercase, hyphens, e.g. `types-of-files-in-linux` for `TypesOfFilesInLinux.md`.

## Script index

### `components-of-unix/`

| Script | Description |
| :--- | :--- |
| `command-execution-touch-demo.sh` | Successful `touch` flow |
| `command-execution-flow-trace.sh` | Success + error path |
| `invalid-command-demos.sh` | Shell validation errors |
| `test.sh` | `cal`, `date`, `echo` demo |
| `run-test-script.sh` | Run `test.sh` with execute bit |
| `whoami-demo.sh` | Current user / prompts |

### `types-of-files-in-linux/`

| Script | Description |
| :--- | :--- |
| `types-of-files-touch-file-demo.sh` | Empty file with `touch` |
| `file-command-content-demo.sh` | `file`, `mv`, extension vs content |
| `types-of-files-ls-demo.sh` | `ls -l` type column |
| `tty-and-dev-demo.sh` | `tty`, `/dev/pts` |

### `bash-built-in-commands/`

| Script | Description |
| :--- | :--- |
| `bash-builtin-examples.sh` | Sample builtins |
| `cat-command-demo.sh` | Display file with `cat` |
| `gedit-command-demo.sh` | GUI edit workflow |
| `ls-l-file-size-demo.sh` | `ls -l` size in bytes |

### `file-system-navigation-and-hierarchy/`

| Script | Description |
| :--- | :--- |
| `pwd-cd-navigation-demo.sh` | `pwd`, `cd`, `~`, `.`, `..`, `cd -` |
| `mkdir-ls-navigation-demo.sh` | `mkdir`, empty `ls`, `ls -a` |
| `mkdir-navigation-tree-demo.sh` | DR1/DR2 tree; parent vs `cd -` |
| `ls-dot-parent-demo.sh` | `ls -a` and `.` / `..` |
| `parent-directory-chain-demo.sh` | Parent chain up to `/` |
| `cd-multiple-parent-demo.sh` | `cd ../..`, invalid `cd ...` |
| `cd-root-edge-cases-demo.sh` | `cd ..` / `cd .` at root |
| `cd-home-relative-vs-absolute-demo.sh` | `cd home` vs `cd /home` |
| `absolute-vs-relative-paths-demo.sh` | Absolute `/` paths vs relative |
| `bin-sbin-etc-demo.sh` | `/bin`, `/sbin`, `/etc` samples |
| `fhs-root-directories-demo.sh` | Read-only tour of `/` and FHS dirs |

### `ls-command-and-its-options/`

| Script | Description |
| :--- | :--- |
| `ls-basic-and-directory-arg-demo.sh` | `ls` vs `ls <dir>` |
| `man-ls-redirect-wc-demo.sh` | `man ls`, redirect, `wc -l` |
| `ls-r-reverse-alphabetical-demo.sh` | `ls -r` |
| `ls-l-long-listing-demo.sh` | `ls -l` columns |
| `ls-lt-ltr-time-sort-demo.sh` | `ls -lt`, `ls -ltr` |
| `ls-a-vs-A-hidden-demo.sh` | `ls -a` vs `ls -A` |
| `ls-F-classify-demo.sh` | `ls -F` type suffixes |
| `ls-f-no-color-demo.sh` | `ls -f` no color |
| `ls-i-inode-demo.sh` | `ls -i` inode |
| `ls-R-recursive-demo.sh` | `ls -R` recursive |
| `ls-s-and-lh-size-demo.sh` | `ls -s`, `ls -lh` |
| `ls-combined-options-quiz-demo.sh` | Combined options |
| `ls-with-head-tail-demo.sh` | `head` / `tail` with `ls` |
| `ls-with-more-less-hint-demo.sh` | `more` / `less` hints |

See [scripts-execution-summary/ls-command-and-its-options.md](../scripts-execution-summary/ls-command-and-its-options.md).

### `shell-scripting/`

| Script | Description |
| :--- | :--- |
| `hello.sh` | Positional parameters |
| `check-file.sh` | `if [ -f ]` |
| `backup-logs.sh` | `tar` backup example |
