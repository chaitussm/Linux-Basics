# Bash Built-in Commands

**Context:** When you run `help` in Bash (as in Durga Sir’s class and your screenshot), you see **shell built-in commands** — features implemented **inside the shell**, not separate programs on disk.

![Bash help command output](../assets/bash-help-screenshot.png)

**Related:** [Components of Unix.md](Components%20of%20Unix.md) (shell vs kernel flow) · [TypesOfFilesInLinux.md](TypesOfFilesInLinux.md) (file types)  
**Practice script:** [`scripts/bash-builtin-examples.sh`](../../scripts/bash-builtin-examples.sh)  
**Check file type (Ctrl+click):** [`file` command](#file-command)

```bash
help              # full list (like the screenshot)
help cd           # details for one builtin
bash scripts/bash-builtin-examples.sh
```

---

**Table of contents**

- [1. Built-in vs external command](#topic-1)
- [2. Category overview (pie chart)](#topic-2)
- [3. Command reference (from `help` screen)](#topic-3)
- [4. Check file type — `file` command (external)](#file-command)
- [Getting help and command information](#getting-help-and-command-information)
  - [`help`](#help)
  - [`type`](#type)
  - [`command`](#command)
  - [`builtin`](#builtin)
  - [`enable`](#enable)
  - [`hash`](#hash)
- [Directories and navigation](#directories-and-navigation)
  - [`cd`](#cd)
  - [`pwd`](#pwd)
  - [`pushd`](#pushd)
  - [`popd`](#popd)
  - [`dirs`](#dirs)
- [Variables, environment, and names](#variables-environment-and-names)
  - [`export`](#export)
  - [`unset`](#unset)
  - [`declare`](#declare)
  - [`typeset`](#typeset)
  - [`local`](#local)
  - [`readonly`](#readonly)
  - [`set`](#set)
  - [`shift`](#shift)
  - [`getopts`](#getopts)
  - [`shopt`](#shopt)
  - [`umask`](#umask)
  - [`ulimit`](#ulimit)
  - [`alias`](#alias)
  - [`unalias`](#unalias)
- [Input, output, and data](#input-output-and-data)
  - [`echo`](#echo)
  - [`printf`](#printf)
  - [`read`](#read)
  - [`mapfile`](#mapfile)
  - [`readarray`](#readarray)
- [Tests and conditions](#tests-and-conditions)
  - [`[ arg... ]`](#topic-39)
  - [`[[ expression ]]`](#topic-40)
  - [`test`](#test)
  - [`(( expression ))`](#topic-42)
  - [`:`](#topic-43)
  - [`true`](#true)
  - [`false`](#false)
- [Loops and branching](#loops-and-branching)
  - [`if`](#if)
  - [`case`](#case)
  - [`for NAME in WORDS`](#for-name-in-words)
  - [`for (( exp1; exp2; exp3 ))`](#topic-50)
  - [`while`](#while)
  - [`until`](#until)
  - [`select`](#select)
  - [`break`](#break)
  - [`continue`](#continue)
- [Functions, grouping, and sourcing](#functions-grouping-and-sourcing)
  - [`function / name()`](#topic-57)
  - [`return`](#return)
  - [`caller`](#caller)
  - [`. filename [arguments]`](#topic-60)
  - [`source`](#source)
  - [`{ COMMANDS ; }`](#topic-62)
  - [`eval`](#eval)
  - [`exec`](#exec)
- [Job control and processes](#job-control-and-processes)
  - [`job_spec [&]`](#topic-66)
  - [`bg`](#bg)
  - [`fg`](#fg)
  - [`jobs`](#jobs)
  - [`kill`](#kill)
  - [`wait`](#wait)
  - [`disown`](#disown)
  - [`suspend`](#suspend)
  - [`coproc`](#coproc)
- [History and editing](#history-and-editing)
  - [`history`](#history)
  - [`fc`](#fc)
  - [`bind`](#bind)
- [Programmable completion](#programmable-completion)
  - [`compgen`](#compgen)
  - [`complete`](#complete)
  - [`compopt`](#compopt)
- [Timing, signals, and shell control](#timing-signals-and-shell-control)
  - [`exit`](#exit)
  - [`logout`](#logout)
  - [`trap`](#trap)
  - [`times`](#times)
  - [`time`](#time)
  - [`let`](#let)
  - [`variables`](#variables)

---

<a id="topic-1"></a>

## 1. Built-in vs external command

```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'primaryColor': '#5c5c5c', 'primaryTextColor': '#ffffff', 'primaryBorderColor': '#3d3d3d', 'lineColor': '#b0b0b0'}}}%%
flowchart TB
    A["You type a command"] --> B{"Shell parses line"}
    B --> C{"Is it a shell builtin?"}
    C -->|Yes| D["Shell runs builtin internally"]
    C -->|No| E["Shell runs external program from PATH"]
    D --> F["Result on terminal"]
    E --> F

    classDef darkGrey fill:#5c5c5c,stroke:#3d3d3d,color:#ffffff,stroke-width:2px
    class A,B,C,D,E,F darkGrey
```

| Type | Example | How to check |
| :--- | :--- | :--- |
| **Builtin** | `cd`, `echo`, `export` | `type cd` → *builtin* |
| **External** | `ls`, `grep`, `touch`, [`file`](#file-command) | `type file` → */usr/bin/file* |
| **Alias** | `ll` → `ls -l` | `type ll` → *alias* |

> A `*` next to a name in `help` means that builtin is **disabled** (`enable -n name`).

---

<a id="topic-2"></a>

## 2. Category overview (pie chart)

```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#5c5c5c', 'pie2': '#6e6e6e', 'pie3': '#4a4a4a', 'pie4': '#707070', 'pie5': '#555555', 'pie6': '#656565', 'pie7': '#5a5a5a', 'pie8': '#606060', 'pieTitleTextColor': '#ffffff', 'pieSectionTextColor': '#ffffff'}}}%%
pie title Bash help list by category
    "Variables and environment" : 18
    "Loops and branching" : 16
    "Job control" : 12
    "Functions and sourcing" : 11
    "Input and output" : 8
    "Tests and conditions" : 10
    "Navigation" : 7
    "History and completion" : 10
    "Shell meta" : 8
```

---

<a id="topic-3"></a>

## 3. Command reference (from `help` screen)

## Getting help and command information

### `help`

**Explanation:** Show help for shell builtins.

**Example:**
```bash
help cd
```

### `type`

**Explanation:** Show how a name would be interpreted.

**Example:**
```bash
type -a cd
```

### `command`

**Explanation:** Run a command, ignoring shell functions named like it.

**Example:**
```bash
command ls
```

### `builtin`

**Explanation:** Run a shell builtin, bypassing functions with the same name.

**Example:**
```bash
builtin echo hi
```

### `enable`

**Explanation:** Enable/disable shell builtins or load from file.

**Example:**
```bash
enable echo
```

### `hash`

**Explanation:** Remember full path of commands for faster lookup.

**Example:**
```bash
hash -r; hash ls
```

## Directories and navigation

### `cd`

**Explanation:** Change working directory.

**Example:**
```bash
cd /var/log && pwd
```

### `pwd`

**Explanation:** Print working directory.

**Example:**
```bash
pwd -P
```

### `pushd`

**Explanation:** Push directory onto stack and cd to it.

**Example:**
```bash
pushd /tmp; pwd
```

### `popd`

**Explanation:** Remove top directory from stack and cd to it.

**Example:**
```bash
pushd /tmp; popd
```

### `dirs`

**Explanation:** Display directory stack from pushd/popd.

**Example:**
```bash
dirs -p
```

## Variables, environment, and names

### `export`

**Explanation:** Mark variables for child processes.

**Example:**
```bash
export PATH; export MY_APP=1
```

### `unset`

**Explanation:** Remove variables or functions.

**Example:**
```bash
unset MY_VAR
```

### `declare`

**Explanation:** Declare variables and optional attributes (-a array, -i integer, etc.).

**Example:**
```bash
declare -i n=5; echo $((n+2))
```

### `typeset`

**Explanation:** Synonym for declare.

**Example:**
```bash
typeset -i n=2; echo $n
```

### `local`

**Explanation:** Declare function-local variables.

**Example:**
```bash
f(){ local x=1; echo $x; }; f
```

### `readonly`

**Explanation:** Make variables unchangeable.

**Example:**
```bash
readonly R=1; echo $R
```

### `set`

**Explanation:** Set shell options and positional parameters.

**Example:**
```bash
set -e  # exit on error
```

### `shift`

**Explanation:** Shift positional parameters left.

**Example:**
```bash
set -- a b c; shift; echo $1
```

### `getopts`

**Explanation:** Parse script options (flags).

**Example:**
```bash
while getopts ab o; do case $o in a) A=1;; esac; done
```

### `shopt`

**Explanation:** Toggle Bash-specific options.

**Example:**
```bash
shopt -s nocaseglob
```

### `umask`

**Explanation:** Default permission mask for new files.

**Example:**
```bash
umask; umask 022
```

### `ulimit`

**Explanation:** Resource limits (files, memory, etc.).

**Example:**
```bash
ulimit -a | head -5
```

### `alias`

**Explanation:** Define or list command shortcuts.

**Example:**
```bash
alias ll='ls -l'; ll
```

### `unalias`

**Explanation:** Remove alias definitions.

**Example:**
```bash
alias x=1; unalias x
```

## Input, output, and data

### `echo`

**Explanation:** Print arguments to stdout.

**Example:**
```bash
echo Hello Unix
```

### `printf`

**Explanation:** Formatted output (portable).

**Example:**
```bash
printf 'Count=%d\n' 42
```

### `read`

**Explanation:** Read line(s) from stdin into variables.

**Example:**
```bash
read -p 'Name: ' n <<< 'Durga'; echo $n
```

### `mapfile`

**Explanation:** Read lines from stdin into an array.

**Example:**
```bash
mapfile -t a < /etc/hosts; echo ${a[0]}
```

### `readarray`

**Explanation:** Synonym for mapfile.

**Example:**
```bash
readarray -t lines < /etc/os-release; echo ${lines[0]}
```

## Tests and conditions

<a id="topic-39"></a>

### `[ arg... ]`

**Explanation:** POSIX test command built into Bash (same as test).

**Example:**
```bash
[ -f /etc/hosts ] && echo exists
```

<a id="topic-40"></a>

### `[[ expression ]]`

**Explanation:** Extended conditional test with safer parsing than [.

**Example:**
```bash
[[ -n $HOME ]] && echo HOME is set
```

### `test`

**Explanation:** Evaluate conditional expression.

**Example:**
```bash
test -w /tmp && echo writable
```

<a id="topic-42"></a>

### `(( expression ))`

**Explanation:** Evaluate arithmetic in C-style syntax.

**Example:**
```bash
(( total = 5 + 10 )); echo $total
```

<a id="topic-43"></a>

### `:`

**Explanation:** Null command; always succeeds (exit 0). Useful in loops/conditionals.

**Example:**
```bash
: # no-op
```

### `true`

**Explanation:** Return success (0).

**Example:**
```bash
true && echo ok
```

### `false`

**Explanation:** Return non-zero exit status.

**Example:**
```bash
false || echo failed
```

## Loops and branching

### `if`

**Explanation:** Conditional execution.

**Example:**
```bash
if [ -d /tmp ]; then echo ok; fi
```

### `case`

**Explanation:** Multi-branch pattern matching.

**Example:**
```bash
case $HOSTNAME in (*)* ) echo matched;; esac
```

### `for NAME in WORDS`

**Explanation:** Loop over a word list.

**Example:**
```bash
for d in a b; do echo $d; done
```

<a id="topic-50"></a>

### `for (( exp1; exp2; exp3 ))`

**Explanation:** C-style numeric for loop.

**Example:**
```bash
for ((i=1;i<=3;i++)); do echo $i; done
```

### `while`

**Explanation:** Loop while condition is true.

**Example:**
```bash
while [ ! -f /tmp/x ]; do break; done
```

### `until`

**Explanation:** Loop until condition is true.

**Example:**
```bash
n=0; until [ $n -ge 2 ]; do n=$((n+1)); done
```

### `select`

**Explanation:** Interactive menu loop.

**Example:**
```bash
select x in a b; do echo $x; break; done
```

### `break`

**Explanation:** Exit from for/while/until/select loops.

**Example:**
```bash
for i in 1 2; do break; done
```

### `continue`

**Explanation:** Skip to next loop iteration.

**Example:**
```bash
for i in 1 2 3; do [ $i -eq 2 ] && continue; echo $i; done
```

## Functions, grouping, and sourcing

<a id="topic-57"></a>

### `function / name()`

**Explanation:** Define a reusable shell function.

**Example:**
```bash
demo(){ echo fn; }; demo
```

### `return`

**Explanation:** Exit a function with status.

**Example:**
```bash
f(){ return 42; }; f; echo $?
```

### `caller`

**Explanation:** Show line number and source of the current call frame.

**Example:**
```bash
f(){ caller; }; f
```

<a id="topic-60"></a>

### `. filename [arguments]`

**Explanation:** Read and execute commands from a file in the current shell (source).

**Example:**
```bash
. ./scripts/test.sh
```

### `source`

**Explanation:** Same as . ; run script in current shell.

**Example:**
```bash
source ./scripts/test.sh
```

<a id="topic-62"></a>

### `{ COMMANDS ; }`

**Explanation:** Group commands in current shell.

**Example:**
```bash
{ echo one; echo two; }
```

### `eval`

**Explanation:** Parse and execute arguments as shell code.

**Example:**
```bash
eval 'echo eval-demo'
```

### `exec`

**Explanation:** Replace shell with given command (or redirect fds).

**Example:**
```bash
exec 3>&1  # duplicate stdout to fd 3
```

## Job control and processes

<a id="topic-66"></a>

### `job_spec [&]`

**Explanation:** Run a pipeline or command in the background; same as suffixing with &.

**Example:**
```bash
sleep 2 &
```

### `bg`

**Explanation:** Resume a stopped job in the background.

**Example:**
```bash
sleep 100 & J=$!; kill -STOP $J; bg %1
```

### `fg`

**Explanation:** Bring background job to foreground.

**Example:**
```bash
# fg %1  (interactive)
```

### `jobs`

**Explanation:** List active jobs.

**Example:**
```bash
sleep 5 & jobs
```

### `kill`

**Explanation:** Send signal to process or job.

**Example:**
```bash
kill -0 $$ && echo shell alive
```

### `wait`

**Explanation:** Wait for background jobs to finish.

**Example:**
```bash
sleep 1 & wait
```

### `disown`

**Explanation:** Remove jobs from shell job table.

**Example:**
```bash
sleep 60 & disown
```

### `suspend`

**Explanation:** Stop the shell until SIGCONT (login shells).

**Example:**
```bash
# suspend
```

### `coproc`

**Explanation:** Start a coprocess connected by pipes.

**Example:**
```bash
coproc C { echo coproc; }; echo sent
```

## History and editing

### `history`

**Explanation:** Show or manipulate command history.

**Example:**
```bash
history 5
```

### `fc`

**Explanation:** Edit/re-run commands from history.

**Example:**
```bash
fc -l -5
```

### `bind`

**Explanation:** Configure readline key bindings.

**Example:**
```bash
bind -p | head -3
```

## Programmable completion

### `compgen`

**Explanation:** Generate possible completion matches.

**Example:**
```bash
compgen -c | grep '^ls$'
```

### `complete`

**Explanation:** Register programmable completion for a command.

**Example:**
```bash
complete -W 'start stop' mysvc
```

### `compopt`

**Explanation:** Change completion options for a command.

**Example:**
```bash
compopt -o filenames ls
```

## Timing, signals, and shell control

### `exit`

**Explanation:** Exit the shell with optional status code.

**Example:**
```bash
exit 0
```

### `logout`

**Explanation:** Exit a login shell.

**Example:**
```bash
# logout
```

### `trap`

**Explanation:** Run command on signals or shell exit.

**Example:**
```bash
trap 'echo trapped' EXIT
```

### `times`

**Explanation:** Print CPU times for shell and children.

**Example:**
```bash
times
```

### `time`

**Explanation:** Time pipeline/command execution.

**Example:**
```bash
time sleep 0.1
```

### `let`

**Explanation:** Arithmetic evaluation (legacy).

**Example:**
```bash
let x=2*3; echo $x
```

### `variables`

**Explanation:** Help topic listing special shell variables.

**Example:**
```bash
help variables | head -10
```

---

<a id="file-command"></a>

## 4. Check file type — `file` command (external)

> **`file` is not a Bash builtin** — it does not appear in `help`. The shell runs it as an **external program** (usually `/usr/bin/file`). You use it with builtins such as `touch` and `mv` when learning [Types of Files in Linux](TypesOfFilesInLinux.md).

### `file`

**Explanation:** Inspects the **content** of a path and reports what kind of data it holds (ASCII text, image, executable, empty, etc.). On Linux, the **file extension is not reliable** — Durga Sir’s demo: `sunny.jpg` with text inside is reported as **ASCII text**, not JPEG.

| Situation | Typical `file` output |
| :--- | :--- |
| Empty file (`touch sunny.jpg`) | `empty` |
| Text inside any name | `ASCII text` |
| Real binary (e.g. image) | `JPEG image data`, `PNG image data`, … |

**How to verify it is external:**

```bash
type file
# file is /usr/bin/file
```

**Example (Durga Sir — extension vs content):**

```bash
touch sunny.jpg
file sunny.jpg                    # empty

echo "hello friends" > sunny.jpg
file sunny.jpg                    # ASCII text (not "JPEG")

mv sunny.jpg sunny.durga
file sunny.durga                  # still ASCII text
```

**Run full demo script:**

```bash
bash scripts/file-command-content-demo.sh
```

**See also:** [TypesOfFilesInLinux.md — Extension vs content](TypesOfFilesInLinux.md#3-extension-vs-content-file-command) · [`ls -l` first character](TypesOfFilesInLinux.md#6-how-to-check-file-type-standard-way)

