#!/usr/bin/env python3
"""Rebuild scripts-execution-summary/*.md — one in-depth section per .sh file."""
from __future__ import annotations

import re
from pathlib import Path

from generate_in_depth_sections import run_command, section_for_script

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "scripts-execution-summary"
SCRIPTS = REPO / "scripts"

FOUR_PART_LEGEND = """
Each script section uses the same **four-part** model:

| # | Column in tables | Meaning |
| :---: | :--- | :--- |
| 1 | **What it is** | Command or shell feature (e.g. `echo` = print text). |
| 2 | **Added / configured** | How it appears in Linux (PATH, builtin, flag on CLI, variable in script). |
| 3 | **Execution intent** | What you are trying to do when the line runs. |
| 4 | **Output** | What you see on the **terminal (stdout/stderr)**, in a **file**, or through a **pipeline** (`|`). |
"""

MERMAID_GREY = """%%{init: {'theme': 'base', 'themeVariables': {'primaryColor': '#5c5c5c', 'primaryTextColor': '#ffffff', 'primaryBorderColor': '#3d3d3d', 'lineColor': '#b0b0b0'}}}%%"""


def collect_scripts(rel_dirs: list[str], extra: list[str] | None = None) -> list[Path]:
    paths: list[Path] = []
    for d in rel_dirs:
        folder = REPO / d
        if folder.is_dir():
            paths.extend(sorted(folder.glob("*.sh")))
    for e in extra or []:
        p = REPO / e
        if p.is_file():
            paths.append(p)
    # stable unique
    seen: set[str] = set()
    out: list[Path] = []
    for p in sorted(paths, key=lambda x: str(x).lower()):
        key = str(p.resolve())
        if key not in seen:
            seen.add(key)
            out.append(p)
    return out


def script_index_table(paths: list[Path]) -> str:
    rows = ["| Script | Run |", "| :--- | :--- |"]
    for p in paths:
        rel = p.relative_to(SCRIPTS)
        run = f"`{run_command(rel)}`"
        encoded = rel.as_posix().replace(" ", "%20")
        rows.append(f"| [`{p.name}`](../scripts/{encoded}) | {run} |")
    return "\n".join(rows) + "\n"


def build_doc(
    title: str,
    topic_line: str,
    scripts_dir_line: str,
    pie_mermaid: str,
    flow_mermaid: str | None,
    paths: list[Path],
) -> str:
    parts = [
        title,
        "",
        topic_line,
        scripts_dir_line,
        "",
        pie_mermaid,
        "",
    ]
    if flow_mermaid:
        parts.extend([flow_mermaid, ""])
    parts.extend([FOUR_PART_LEGEND.strip(), "", "---", ""])
    for p in paths:
        parts.append(section_for_script(p))
        parts.append("---")
        parts.append("")
    parts.append("## Script index (all `.sh` in this summary)")
    parts.append("")
    parts.append(script_index_table(paths))
    parts.append("")
    parts.append("**Run every script in this topic (from repo root):**")
    parts.append("")
    parts.append("```bash")
    for p in paths:
        rel = p.relative_to(SCRIPTS)
        parts.append(run_command(rel))
    parts.append("```")
    parts.append("")
    return "\n".join(parts)


SPECS = [
    {
        "file": "components-of-unix.md",
        "title": "# Execution summary — `components-of-unix/`",
        "topic": "**Topic:** [Components of Unix.md](../docs/topics/Components%20of%20Unix.md) (Video 2)  ",
        "dir_line": "**Scripts directory:** [`../scripts/components-of-unix/`](../scripts/components-of-unix/)",
        "dirs": ["scripts/components-of-unix"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#5c5c5c', 'pie2': '#6e6e6e', 'pie3': '#4a4a4a', 'pie4': '#7a7a7a', 'pieTitleTextColor': '#ffffff', 'pieSectionTextColor': '#ffffff'}}}%%
pie title Commands in this folder (by role)
    "File create / list (touch, ls)" : 35
    "Shell errors / validation" : 25
    "User / environment (whoami, echo)" : 20
    "Calendar / date (cal, date)" : 15
    "Script setup (chmod, cd, mkdir)" : 5
```""",
        "flow": f"""```mermaid
{MERMAID_GREY}
flowchart LR
    U[User runs .sh] --> S[Shell reads script]
    S --> V{{Valid command?}}
    V -->|yes| K[Kernel runs program]
    V -->|no| E[Shell prints error]
    K --> P[Output + exit]
    E --> P
```""",
    },
    {
        "file": "types-of-files-in-linux.md",
        "title": "# Execution summary — `types-of-files-in-linux/`",
        "topic": "**Topic:** [TypesOfFilesInLinux.md](../docs/topics/TypesOfFilesInLinux.md) (Video 3)  ",
        "dir_line": "**Scripts directory:** [`../scripts/types-of-files-in-linux/`](../scripts/types-of-files-in-linux/)",
        "dirs": ["scripts/types-of-files-in-linux"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#5c5c5c', 'pie2': '#6e6e6e', 'pie3': '#4a4a4a', 'pieTitleTextColor': '#ffffff', 'pieSectionTextColor': '#ffffff'}}}%%
pie title File-type demos
    "touch / ls -l" : 40
    "file / mv" : 35
    "tty / dev" : 25
```""",
        "flow": None,
    },
    {
        "file": "bash-built-in-commands.md",
        "title": "# Execution summary — `bash-built-in-commands/`",
        "topic": "**Topic:** [Bash Built-in Commands.md](../docs/topics/Bash%20Built-in%20Commands.md)  ",
        "dir_line": "**Scripts directory:** [`../scripts/bash-built-in-commands/`](../scripts/bash-built-in-commands/)",
        "dirs": ["scripts/bash-built-in-commands"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#5c5c5c', 'pie2': '#6e6e6e', 'pie3': '#4a4a4a', 'pie4': '#7a7a7a', 'pieTitleTextColor': '#ffffff', 'pieSectionTextColor': '#ffffff'}}}%%
pie title Built-in vs external in demos
    "Bash builtins" : 55
    "External (file, cat, gedit, ls)" : 45
```""",
        "flow": None,
    },
    {
        "file": "file-system-navigation-and-hierarchy.md",
        "title": "# Execution summary — `file-system-navigation-and-hierarchy/`",
        "topic": "**Topic:** [File System Navigation Commands And Hierarchy.md](../docs/topics/File%20System%20Navigation%20Commands%20And%20Hierarchy.md) (Video 4)  ",
        "dir_line": "**Scripts directory:** [`../scripts/file-system-navigation-and-hierarchy/`](../scripts/file-system-navigation-and-hierarchy/)",
        "dirs": ["scripts/file-system-navigation-and-hierarchy"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#5c5c5c', 'pie2': '#6e6e6e', 'pie3': '#4a4a4a', 'pie4': '#7a7a7a', 'pie5': '#555555', 'pieTitleTextColor': '#ffffff', 'pieSectionTextColor': '#ffffff'}}}%%
pie title Demo scripts by theme
    "cd / pwd / paths" : 40
    "mkdir / ls / ls -a" : 25
    "FHS /bin /sbin /etc" : 20
    "Parent chain and root edge cases" : 15
```""",
        "flow": None,
    },
    {
        "file": "ls-command-and-its-options.md",
        "title": "# Execution summary — `ls-command-and-its-options/`",
        "topic": "**Topic:** [ls Command and its options.md](../docs/topics/ls%20Command%20and%20its%20options.md) (Video 7)  ",
        "dir_line": "**Scripts directory:** [`../scripts/ls-command-and-its-options/`](../scripts/ls-command-and-its-options/)",
        "dirs": ["scripts/ls-command-and-its-options"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#5c5c5c', 'pie2': '#6e6e6e', 'pie3': '#4a4a4a', 'pieTitleTextColor': '#ffffff', 'pieSectionTextColor': '#ffffff'}}}%%
pie title ls demo focus
    "Listing options (-l -a -R …)" : 50
    "Pipes (head tail man)" : 30
    "Sort and size (-t -h -s)" : 20
```""",
        "flow": None,
    },
    {
        "file": "shell-scripting.md",
        "title": "# Execution summary — `shell-scripting/`",
        "topic": "**Topic:** Shell scripting examples (preview)  ",
        "dir_line": "**Scripts directory:** [`../scripts/shell-scripting/`](../scripts/shell-scripting/)",
        "dirs": ["scripts/shell-scripting"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#5c5c5c', 'pie2': '#6e6e6e', 'pieTitleTextColor': '#ffffff', 'pieSectionTextColor': '#ffffff'}}}%%
pie title Scripting demos
    "Parameters and tests" : 50
    "tar backup" : 50
```""",
        "flow": None,
    },
    {
        "file": "DateandCal Execution summary.md",
        "title": "# DateandCal Execution summary",
        "topic": "**Topic:** [Date and Cal commands.md](../docs/topics/Date%20and%20Cal%20commands.md) (Video 8)  ",
        "dir_line": "**Scripts directory:** [`../scripts/date-cal-commands/`](../scripts/date-cal-commands/) (orchestrator + split demos)",
        "dirs": ["scripts/date-cal-commands"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#5c5c5c', 'pie2': '#6e6e6e', 'pieTitleTextColor': '#ffffff', 'pieSectionTextColor': '#ffffff'}}}%%
pie title Session 8 commands
    "date (default + formats)" : 50
    "cal (month + options)" : 35
    "log file + echo" : 15
```""",
        "flow": f"""```mermaid
{MERMAID_GREY}
flowchart TD
    O[Date and Cal commands.sh orchestrator]
    O --> D[date-*-demo.sh]
    O --> C[cal-*-demo.sh]
```""",
    },
    {
        "file": "viewContentOfFiles/viewContentOfFiles.md",
        "title": "# Execution summary — `viewContentOfFiles/`",
        "topic": "**Topic:** [viewContentOfFiles.md](../../docs/topics/viewContentOfFiles.md) (Video 9)  ",
        "dir_line": "**Scripts directory:** [`../../scripts/viewContentOfFiles/`](../../scripts/viewContentOfFiles/)",
        "dirs": ["scripts/viewContentOfFiles"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#5c5c5c', 'pie2': '#6e6e6e', 'pie3': '#4a4a4a', 'pie4': '#7a7a7a', 'pieTitleTextColor': '#ffffff', 'pieSectionTextColor': '#ffffff'}}}%%
pie title View-content commands in demos
    "cat and options" : 35
    "head / tail" : 30
    "tac / rev" : 15
    "more / less / strategy" : 20
```""",
        "flow": None,
    },
    {
        "file": "Redirection/Redirection.md",
        "title": "# Execution summary — `Redirection/`",
        "topic": "**Topic:** [Redirection/README.md](../../docs/topics/Redirection/README.md)  ",
        "dir_line": "**Scripts directory:** [`../../scripts/Redirection/`](../../scripts/Redirection/)",
        "dirs": ["scripts/Redirection"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#5c5c5c', 'pie2': '#6e6e6e', 'pie3': '#4a4a4a', 'pieTitleTextColor': '#ffffff', 'pieSectionTextColor': '#ffffff'}}}%%
pie title Redirection demos
    "Overwrite >" : 25
    "Append >>" : 25
    "Heredoc EOF" : 25
    "Input < and pipe hint" : 25
```""",
        "flow": None,
    },
]


def main() -> None:
    for spec in SPECS:
        paths = collect_scripts(spec["dirs"], spec.get("extra"))
        if spec["file"] == "DateandCal Execution summary.md":
            orch = SCRIPTS / "date-cal-commands" / "Date and Cal commands.sh"
            paths = [orch] + [p for p in paths if p.resolve() != orch.resolve()]
        doc = build_doc(
            spec["title"],
            spec["topic"],
            spec["dir_line"],
            spec["pie"],
            spec.get("flow"),
            paths,
        )
        out_path = OUT / spec["file"]
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(doc, encoding="utf-8")
        print(f"Wrote {out_path} ({len(paths)} scripts)")


if __name__ == "__main__":
    main()
