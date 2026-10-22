#!/usr/bin/env python3
"""Generate in-depth command tables for execution summary markdown (4-part model)."""
from __future__ import annotations

import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SCRIPTS = REPO / "scripts"

# (what, configured, intent, output)
GLOSSARY: dict[str, tuple[str, str, str, str]] = {
    "set -euo pipefail": (
        "Bash strict-mode option bundle.",
        "Written at top of script; not installed separately.",
        "Tell Bash to stop on errors, treat unset variables as errors, and fail pipelines if any stage fails.",
        "No visible output; changes how later commands affect exit status.",
    ),
    "set +e": (
        "Bash option: do not exit on command failure.",
        "Shell builtin toggled inside the script.",
        "Allow demo commands that are expected to fail without stopping the whole script.",
        "No output; failed commands still print their error text to stderr.",
    ),
    "set -e": (
        "Bash option: exit immediately on failure.",
        "Re-enabled after demos that expect errors.",
        "Restore strict behavior for the rest of the script.",
        "No direct output.",
    ),
    "echo": (
        "Bash builtin that prints arguments to standard output.",
        "Always available in Bash; no package install.",
        "Show section titles, tips, or messages to the terminal (trying to **print** text for the user).",
        "Lines appear on **stdout** in your terminal (or in CI logs). Not used in a pipeline unless followed by `|`.",
    ),
    "pwd": (
        "Print working directory — shows full path of current folder.",
        "Usually `/bin/pwd` or Bash builtin; on PATH by default.",
        "Answer “where am I in the filesystem?” before/after `cd`.",
        "One line path on **stdout**, e.g. `/tmp/linux-pwd-cd-demo/nested/deep`.",
    ),
    "cd": (
        "Change directory — move shell’s current working directory.",
        "Builtin; takes relative or absolute path, `~`, `-`, or no args (home).",
        "Navigate the tree (trying to **enter** a folder); relative paths start from cwd.",
        "Normally silent on success; failure prints `cd: ...: No such file or directory` on **stderr**.",
    ),
    "mkdir": (
        "Make directories.",
        "Coreutils; `-p` creates parents as needed.",
        "Try to **create** folder(s) for the demo tree.",
        "Silent on success; errors on stderr if path invalid.",
    ),
    "rm -rf": (
        "Remove files/directories recursively, force.",
        "Coreutils; `-r` recursive, `-f` no prompt.",
        "Clean old demo data under `/tmp` before recreating.",
        "Silent on success.",
    ),
    "touch": (
        "Create empty file or update timestamps.",
        "Coreutils on PATH.",
        "Try to **create** a zero-byte file or refresh mtime (Durga Sir first step).",
        "Silent; then `ls -l` shows new file with size 0.",
    ),
    "ls": (
        "List directory contents.",
        "Coreutils; options change columns, hidden files, sort.",
        "Try to **show names** in cwd or given path.",
        "Names on stdout; options add permissions, sizes, inodes.",
    ),
    "ls -l": (
        "`ls` long format.",
        "Flag `-l` passed on command line.",
        "Show type, permissions, owner, size, date, name.",
        "Multiple lines on stdout.",
    ),
    "ls -a": (
        "`ls` including hidden dotfiles.",
        "Flag `-a`.",
        "Reveal `.` and `..` and dotfiles.",
        "Extra lines on stdout vs plain `ls`.",
    ),
    "date": (
        "Print or set system date/time.",
        "`date` from coreutils; `+format` uses `%` codes.",
        "Show **current time** or build a formatted string for logs.",
        "Human-readable line on stdout, or custom format string only.",
    ),
    "cal": (
        "Print ASCII calendar.",
        "Optional package `cal` / `ncal` on some minimal images.",
        "Display month grid (current or given month/year).",
        "Calendar grid on stdout; missing binary → “command not found”.",
    ),
    "man": (
        "Manual pager for commands.",
        "man-db package; uses `$PAGER` (often `less`).",
        "Read official documentation interactively.",
        "Fullscreen pager on stdout; `man > file` captures text to file (pipeline/redirect).",
    ),
    "cat": (
        "Concatenate and print files.",
        "Coreutils.",
        "Try to **display file contents** on terminal.",
        "File bytes on stdout.",
    ),
    "head": (
        "Print first N lines of file or pipe.",
        "Coreutils; often `head -n` or `head -20`.",
        "Truncate long output in demos.",
        "First lines on stdout; in pipeline: `cal -y | head -20` only first 20 lines reach terminal.",
    ),
    "tail": (
        "Print last N lines.",
        "Coreutils.",
        "Show end of listing or log.",
        "Last lines on stdout; works in pipelines like `ls | tail`.",
    ),
    "wc": (
        "Word/line/byte count.",
        "Coreutils; `-l` lines, `-c` bytes.",
        "Count entries or file size.",
        "Number on stdout; `wc -l < file` reads file via stdin redirect.",
    ),
    "whoami": (
        "Print effective username.",
        "Installed with login tools.",
        "Show **which user** runs the shell.",
        "Single username line on stdout.",
    ),
    "chmod": (
        "Change file mode (permissions).",
        "Coreutils; e.g. `chmod u+x` adds execute for user.",
        "Make script **executable** so `./script.sh` works.",
        "Silent; `ls -l` then shows `x` in permission bits.",
    ),
    "command -v": (
        "Show path to command or builtin.",
        "POSIX builtin.",
        "Check if `cal`, `gedit`, etc. exist before running.",
        "Path string on stdout or empty if missing.",
    ),
    "find": (
        "Search directory tree.",
        "findutils.",
        "List demo directories for verification.",
        "Paths on stdout, one per line.",
    ),
    "basename": (
        "Strip directory from path.",
        "Coreutils.",
        "Show directory **name only** (e.g. `desktop`).",
        "Single name on stdout.",
    ),
    "type": (
        "Bash builtin: how name is resolved.",
        "Built into Bash.",
        "See if `echo` is builtin or external.",
        "Line like `echo is a shell builtin` on stdout.",
    ),
    "help": (
        "Bash builtin: list internal commands.",
        "Built into Bash.",
        "Discover shell builtins for study.",
        "Many lines on stdout; demos pipe to `head -8`.",
    ),
    "alias": (
        "Bash builtin: temporary command shortcut.",
        "Defined in script; needs `shopt -s expand_aliases` in scripts.",
        "Create nickname for longer command.",
        "No output when defined; invoking alias runs substituted command.",
    ),
    "export": (
        "Bash builtin: mark variable for child processes.",
        "Name=value in script.",
        "Put variable in **environment** for subprocesses.",
        "Silent; `echo $VAR` shows value.",
    ),
    "unset": (
        "Bash builtin: remove variable.",
        "Variable name in script.",
        "Clear demo variable after `export`.",
        "Silent.",
    ),
    "pushd": (
        "Push directory onto stack and cd.",
        "Bash builtin.",
        "Save cwd and jump to new dir.",
        "Often silent with `/dev/null` redirect in demos.",
    ),
    "popd": (
        "Pop directory from stack and cd.",
        "Bash builtin.",
        "Return to previous stacked directory.",
        "Silent in demos.",
    ),
    "dirs": (
        "Show directory stack.",
        "Bash builtin; `-p` one per line.",
        "Display stack after `pushd`.",
        "Paths on stdout.",
    ),
    "printf": (
        "Formatted print (builtin).",
        "Bash builtin.",
        "Print with format specifiers like C.",
        "Formatted bytes on stdout.",
    ),
    "mapfile": (
        "Read lines into array.",
        "Bash builtin.",
        "Load here-string into `lines` array.",
        "Silent; later `printf` shows element.",
    ),
    "file": (
        "Guess file type from content.",
        "External `file` package.",
        "Inspect type despite extension.",
        "One descriptive line on stdout.",
    ),
    "mv": (
        "Move/rename files.",
        "Coreutils.",
        "Rename only; content unchanged.",
        "Silent on success.",
    ),
    "ln -s": (
        "Create symbolic link.",
        "Coreutils.",
        "Create symlink entry pointing to target.",
        "Silent; `ls -l` shows `l` type.",
    ),
    "tty": (
        "Print terminal device path.",
        "Coreutils.",
        "Show which `/dev/pts/N` you use.",
        "Device path on stdout.",
    ),
    "tar": (
        "Archive files.",
        "GNU tar; `-czf` gzip compress.",
        "Create backup archive with timestamp name.",
        "Creates file on disk; message on stdout in demo scripts.",
    ),
    "grep": (
        "Search text patterns.",
        "Often in pipelines.",
        "Filter lines matching pattern.",
        "Matching lines on stdout in pipeline.",
    ),
    "shopt": (
        "Shell option setter (`shopt -s` / `-u`).",
        "Bash builtin; e.g. `expand_aliases` for scripts.",
        "Enable behavior needed for next lines (aliases in non-interactive scripts).",
        "Silent; changes parsing of following commands.",
    ),
    "eval": (
        "Execute string as shell code.",
        "Bash builtin.",
        "Run alias or dynamic command after `alias` definition.",
        "Output of evaluated command on stdout/stderr.",
    ),
    "sleep": (
        "Pause execution for N seconds.",
        "Usually `/usr/bin/sleep` on PATH.",
        "Wait briefly (e.g. after starting GUI editor).",
        "No output; delays script.",
    ),
    "more": (
        "Pager for long text (legacy).",
        "Package on PATH.",
        "Page through `ls` output interactively.",
        "Interactive fullscreen or lines if not a TTY.",
    ),
    "less": (
        "Pager (modern).",
        "Package on PATH.",
        "Scroll long listings.",
        "Interactive pager on stdout.",
    ),
}

VAR_ASSIGN = (
    "Shell variable assignment.",
    "Name=`value` in script; often under `${TMPDIR:-/tmp}`.",
    "Store path or stamp for later commands (setup, not a user command).",
    "No output; variable used by `cd`, `rm`, file paths.",
)

RUN_DEMO = (
    "Orchestrator helper call.",
    "Function `run_demo` in same script; takes child `.sh` filename.",
    "Run the next focused demo so its output is grouped under a banner.",
    "Banner on stdout, then child script output.",
)

SUBSHELL = (
    "Subshell `( commands )`.",
    "Parentheses spawn child shell; cwd changes do not affect parent.",
    "Try `cd` in isolation without leaving main script directory.",
    "Inner `pwd` on stdout; outer cwd unchanged.",
)

IF_TEST = (
    "Conditional test `[[ ... ]]` or `if`.",
    "Bash syntax.",
    "Branch: run block only when directory exists / command succeeds.",
    "Either block runs (messages on stdout) or `else` branch.",
)

FOR_LOOP = (
    "`for` loop over words.",
    "Bash syntax; list after `in`.",
    "Repeat command for each item (e.g. each utility name).",
    "One output line per iteration on stdout.",
)

TRUE_FALLBACK = (
    "Literal `true` or `|| true`.",
    "Builtin `true` always succeeds.",
    "Prevent `set -e` from stopping when optional command fails.",
    "No output; exit status 0.",
)


def classify_line(line: str) -> str | None:
    s = line.strip()
    if not s or s.startswith("#"):
        return None
    if s.startswith("echo "):
        return "echo"
    if s.startswith("set -euo pipefail"):
        return "set -euo pipefail"
    if s.startswith("set +e"):
        return "set +e"
    if s.startswith("set -e"):
        return "set -e"
    for key in sorted(GLOSSARY.keys(), key=len, reverse=True):
        if s == key or s.startswith(key + " ") or s.startswith(key + "\t"):
            return key
    if s.startswith("run_demo(") or s.startswith("run_demo "):
        return "run_demo"
    if s.startswith("bash "):
        return "bash orchestrator"
    if s.startswith("shopt "):
        return "shopt"
    if s.startswith("eval "):
        return "eval"
    if s.startswith("sleep "):
        return "sleep"
    if s.startswith("more ") or s.startswith("less "):
        return "less" if s.startswith("less") else "more"
    if s.startswith("WORK=") or s.startswith("BASE=") or s.startswith("STAMP="):
        return "var_assign"
    if s.startswith("LOG=") or s.startswith("FILE=") or s.startswith("HERE=") or s.startswith("DIR="):
        return "var_assign"
    if s.startswith("(( "):
        return "arithmetic"
    if s.startswith("[[ "):
        return "if_test"
    if s.startswith("if ") or s.startswith("elif "):
        return "if_test"
    if s.startswith("for "):
        return "for_loop"
    if s.startswith("list_if_dir "):
        return "ls"
    if s.endswith("|| true") or s == "true":
        return "true_fallback"
    if s.startswith("( ") or (s.startswith("cd ") and s.endswith(")")):
        return "subshell"
    if "|" in s and not s.startswith("echo "):
        return "pipeline"
    if "$(date" in s or "date +" in s or s.startswith("date"):
        return "date"
    if s.startswith("cal"):
        return "cal"
    if s.startswith("cd "):
        return "cd"
    if s.startswith("ls "):
        return "ls -l" if "-l" in s else "ls"
    if s.startswith("mkdir"):
        return "mkdir"
    if s.startswith("rm -rf"):
        return "rm -rf"
    if s.startswith("touch"):
        return "touch"
    if s.startswith("pwd"):
        return "pwd"
    if s.startswith("head "):
        return "head"
    if s.startswith("tail "):
        return "tail"
    if s.startswith("wc "):
        return "wc"
    if s.startswith("whoami"):
        return "whoami"
    if s.startswith("chmod"):
        return "chmod"
    if s.startswith("command -v"):
        return "command -v"
    if s.startswith("find "):
        return "find"
    if s.startswith("basename"):
        return "basename"
    if s.startswith("type "):
        return "type"
    if s.startswith("help"):
        return "help"
    if s.startswith("alias "):
        return "alias"
    if s.startswith("export "):
        return "export"
    if s.startswith("unset "):
        return "unset"
    if s.startswith("pushd"):
        return "pushd"
    if s.startswith("popd"):
        return "popd"
    if s.startswith("dirs"):
        return "dirs"
    if s.startswith("printf"):
        return "printf"
    if s.startswith("mapfile"):
        return "mapfile"
    if s.startswith("file "):
        return "file"
    if s.startswith("mv "):
        return "mv"
    if s.startswith("ln -s"):
        return "ln -s"
    if s.startswith("tty"):
        return "tty"
    if s.startswith("tar "):
        return "tar"
    if s.startswith("cat "):
        return "cat"
    if s.startswith("man "):
        return "man"
    if "STAMP=" in s and "date" in s:
        return "date"
    if s.startswith("if ") or s.startswith("fi") or s.startswith("else") or s.startswith("for "):
        return None
    if s.startswith("(") or s.startswith(")") or s.startswith("done"):
        return None
    if s.startswith("local ") or s.startswith("list_if_dir") or s.startswith("}"):
        return None
    if ">" in s and "echo" in s:
        return "echo redirect"
    return "shell line"


ORCHESTRATOR = (
    "Invoke another script with Bash.",
    "Child path built from `HERE` / `DIR` next to orchestrator.",
    "Run one focused demo file so output maps to that file’s commands.",
    "Child script’s stdout/stderr appear in your terminal in order; orchestrator prints `#####` banner first.",
)

ECHO_REDIRECT = (
    "Redirection: write echo text into a file.",
    "Path in variable like `$LOG` or `$FILE`; `>` overwrites.",
    "Try to **create/overwrite** file content from shell.",
    "No terminal output from redirect itself; file on disk holds the line.",
)

PIPELINE = (
    "Pipeline: connect stdout of left command to stdin of right.",
    "Uses `|` between commands.",
    "Send partial output to filter (e.g. only first lines).",
    "You see only filtered output on terminal; left command may get SIGPIPE if right exits early.",
)

SHELL_LINE = (
    "Shell syntax (variable, test, subshell, or function).",
    "Defined in this script only.",
    "Prepare path, branch on failure, or wrap commands.",
    "Depends on line: may be silent or print via embedded commands.",
)


def row_for(line: str, key: str | None) -> str:
    raw = line.strip().replace("|", "\\|")
    if raw.startswith("echo ") and "===" in raw:
        msg = "Section header for humans."
        return f"| `{raw[:70]}{'…' if len(raw)>70 else ''}` | {msg} | Literal string in script | **Print** section title | Title line on **stdout** before commands |"
    if key == "bash orchestrator":
        w, c, i, o = ORCHESTRATOR
        short = raw if len(raw) <= 60 else raw[:57] + "…"
        return f"| `{short}` | {w} | {c} | {i} | {o} |"
    if key == "run_demo":
        w, c, i, o = RUN_DEMO
        return f"| `{raw[:72]}` | {w} | {c} | {i} | {o} |"
    if key == "var_assign":
        w, c, i, o = VAR_ASSIGN
        return f"| `{raw[:72]}` | {w} | {c} | {i} | {o} |"
    if key == "subshell":
        w, c, i, o = SUBSHELL
        return f"| `{raw[:72]}` | {w} | {c} | {i} | {o} |"
    if key == "if_test":
        w, c, i, o = IF_TEST
        return f"| `{raw[:72]}` | {w} | {c} | {i} | {o} |"
    if key == "for_loop":
        w, c, i, o = FOR_LOOP
        return f"| `{raw[:72]}` | {w} | {c} | {i} | {o} |"
    if key == "true_fallback":
        w, c, i, o = TRUE_FALLBACK
        return f"| `{raw[:72]}` | {w} | {c} | {i} | {o} |"
    if key == "arithmetic":
        return (
            f"| `{raw[:72]}` | Bash arithmetic `(( ))`. | Built into Bash. | "
            "Compute numbers in shell (trying to **calculate**). | "
            "Result often printed via following `echo` on stdout. |"
        )
    if key == "echo redirect":
        w, c, i, o = ECHO_REDIRECT
        return f"| `{raw[:60]}…` | {w} | {c} | {i} | {o} |"
    if key == "pipeline":
        w, c, i, o = PIPELINE
        return f"| `{raw[:60]}…` | {w} | {c} | {i} | {o} |"
    if key and key in GLOSSARY:
        w, c, i, o = GLOSSARY[key]
    else:
        w, c, i, o = SHELL_LINE
    short = raw if len(raw) <= 72 else raw[:69] + "…"
    return f"| `{short}` | {w} | {c} | {i} | {o} |"


def script_link(rel: Path) -> str:
    encoded = rel.as_posix().replace(" ", "%20")
    return f"../scripts/{encoded}"


def run_command(rel: Path) -> str:
    pos = rel.as_posix()
    if " " in pos:
        return f'bash "scripts/{pos}"'
    return f"bash scripts/{pos}"


def section_for_script(path: Path) -> str:
    rel = path.relative_to(SCRIPTS)
    lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    out = [
        f"## [`{path.name}`]({script_link(rel)})",
        "",
        f"**Run:** `{run_command(rel)}`",
        "",
        "### In-depth command walkthrough",
        "",
        "| Command (as in script) | 1. What it is | 2. Added / configured | 3. Execution intent | 4. Output (terminal / file / pipeline) |",
        "| :--- | :--- | :--- | :--- | :--- |",
    ]
    seen = 0
    for line in lines:
        stripped = line.strip()
        if not stripped or stripped.startswith("#"):
            continue
        if stripped in ("}", "fi", "done", "else", "then", "{"):
            continue
        if stripped.startswith("run_demo()") or stripped.startswith("local ") or stripped.startswith("list_if_dir"):
            continue
        key = classify_line(line)
        if key is None and not stripped.startswith("echo"):
            continue
        out.append(row_for(line, key))
        seen += 1
    out.append("")
    return "\n".join(out)


def main() -> None:
    for p in sorted(SCRIPTS.rglob("*.sh")):
        if "tools" in p.parts:
            continue
        print(section_for_script(p))
        print("---")


if __name__ == "__main__":
    main()
