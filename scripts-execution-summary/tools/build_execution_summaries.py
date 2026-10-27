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

# Pie charts: orange / blue / white slices (high contrast; flowcharts stay MERMAID_GREY)
PIE_CHART_INIT = (
    "%%{init: {'theme': 'base', 'themeVariables': {"
    "'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', "
    "'pie4': '#FF9800', 'pie5': '#1E88E5', "
    "'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', "
    "'pieStrokeColor': '#424242'"
    "}}}%%"
)


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


def script_index_table(paths: list[Path], scripts_link_prefix: str = "../scripts/") -> str:
    rows = ["| Script | Run |", "| :--- | :--- |"]
    for p in paths:
        rel = p.relative_to(SCRIPTS)
        run = f"`{run_command(rel)}`"
        encoded = rel.as_posix().replace(" ", "%20")
        rows.append(f"| [`{p.name}`]({scripts_link_prefix}{encoded}) | {run} |")
    return "\n".join(rows) + "\n"


def build_doc(
    title: str,
    topic_line: str,
    scripts_dir_line: str,
    pie_mermaid: str,
    flow_mermaid: str | None,
    paths: list[Path],
    scripts_link_prefix: str = "../scripts/",
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
        parts.append(section_for_script(p, scripts_link_prefix))
        parts.append("---")
        parts.append("")
    parts.append("## Script index (all `.sh` in this summary)")
    parts.append("")
    parts.append(script_index_table(paths, scripts_link_prefix))
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
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
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
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
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
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
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
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
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
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
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
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
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
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
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
        "merge_into_topic": "docs/topics/viewContentOfFiles.md",
        "execution_begin": "<!-- BEGIN EXECUTION_SUMMARY (generated) -->",
        "execution_end": "<!-- END EXECUTION_SUMMARY (generated) -->",
        "title": "# Execution summary — `viewContentOfFiles/`",
        "topic": "**Topic:** [viewContentOfFiles.md](../../docs/topics/viewContentOfFiles.md) (Video 9)  ",
        "dir_line": "**Scripts directory:** [`../../scripts/viewContentOfFiles/`](../../scripts/viewContentOfFiles/)",
        "dirs": ["scripts/viewContentOfFiles"],
        "extra": None,
        "scripts_link_prefix": "../../scripts/",
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
pie title View-content commands in demos
    "cat and options" : 35
    "head / tail" : 30
    "tac / rev" : 15
    "more / less / strategy" : 20
```""",
        "flow": None,
    },
    {
        "file": "wordCountCommand.md",
        "title": "# Execution summary — `wordCountCommand/`",
        "topic": "**Topic:** [wordCountCommand.md](../docs/topics/wordCountCommand.md) (Video 10)  ",
        "dir_line": "**Scripts directory:** [`../scripts/wordCountCommand/`](../scripts/wordCountCommand/)",
        "dirs": ["scripts/wordCountCommand"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
pie title wc demos
    "Default wc" : 20
    "Options -l -w -c" : 45
    "Multiple files" : 15
    "Pipe counts" : 20
```""",
        "flow": None,
    },
    {
        "file": "Redirection.md",
        "title": "# Execution summary — `Redirection/`",
        "topic": "**Topic:** [EOF and Redirection.md](../../docs/topics/EOF%20and%20Redirection.md)  ",
        "dir_line": "**Scripts directory:** [`../../scripts/Redirection/`](../../scripts/Redirection/)",
        "dirs": ["scripts/Redirection"],
        "extra": None,
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
pie title Redirection demos
    "Overwrite >" : 25
    "Append >>" : 25
    "Heredoc EOF" : 25
    "Input < and pipe hint" : 25
```""",
        "flow": None,
    },
    {
        "file": "redirectionScriptSummary.md",
        "title": "# Execution summary — Session 11 redirection",
        "topic": "**Topic:** [redirection.md](../docs/topics/redirection.md) (Video 11)  ",
        "dir_line": "**Scripts:** [`../scripts/redirection.sh`](../scripts/redirection.sh) · [`../scripts/redirection/`](../scripts/redirection/) · [`../scripts/Redirection/`](../scripts/Redirection/)",
        "dirs": ["scripts/redirection", "scripts/Redirection"],
        "extra": ["scripts/redirection.sh"],
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
pie title Session 11 redirection demos
    "Streams 0 1 2" : 15
    "Stdout > >>" : 25
    "Stderr 2>" : 20
    "Stdin < combined" : 15
    "&> both streams" : 10
    "EOF Rama demos" : 15
```""",
        "flow": f"""```mermaid
{MERMAID_GREY}
flowchart LR
    IN[stdin 0] --> CMD[Command]
    CMD --> OUT[stdout 1]
    CMD --> ERR[stderr 2]
    OUT -->|"> >>"| F[File]
    ERR -->|"2>"| E[Error file]
    OUT -->|"&>"| B[Both in one file]
    ERR --> B

    classDef darkGrey fill:#5c5c5c,stroke:#3d3d3d,color:#ffffff,stroke-width:2px
    class IN,CMD,OUT,ERR,F,E,B darkGrey
```""",
    },
    {
        "file": "PipingTeeXargs.md",
        "title": "# Execution summary — Session 12 piping, tee, xargs",
        "topic": "**Topic:** [PipingTeeXargs.md](../docs/topics/PipingTeeXargs.md) (Video 12)  ",
        "dir_line": "**Scripts:** [`../scripts/PipingTeeXargs.sh`](../scripts/PipingTeeXargs.sh) · [`../scripts/PipingTeeXargs/`](../scripts/PipingTeeXargs/)",
        "dirs": ["scripts/PipingTeeXargs"],
        "extra": ["scripts/PipingTeeXargs.sh"],
        "pie": """```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'pie1': '#FF9800', 'pie2': '#1E88E5', 'pie3': '#FFFFFF', 'pie4': '#FF9800', 'pie5': '#1E88E5', 'pieTitleTextColor': '#212121', 'pieSectionTextColor': '#212121', 'pieStrokeColor': '#424242'}}}%%
pie title Session 12 demos
    "Pipe filters" : 35
    "tee" : 25
    "xargs" : 25
    "stderr note" : 15
```""",
        "flow": f"""```mermaid
{MERMAID_GREY}
flowchart LR
    A[command1] -->|pipe| B[filter]
    B --> C[terminal]
    B -->|tee| F[file]
    D[stdin lines] --> X[xargs]
    X --> E[command with args]

    classDef darkGrey fill:#5c5c5c,stroke:#3d3d3d,color:#ffffff,stroke-width:2px
    class A,B,C,F,D,X,E darkGrey
```""",
    },
    {
        "file": "commandAliasing.md",
        "title": "# Execution summary — Session 13 command aliasing",
        "topic": "**Topic:** [commandAliasing.md](../docs/topics/commandAliasing.md) (Video 13)  ",
        "dir_line": "**Scripts:** [`../scripts/commandAliasing.sh`](../scripts/commandAliasing.sh) · [`../scripts/commandAliasing/`](../scripts/commandAliasing/)",
        "dirs": ["scripts/commandAliasing"],
        "extra": ["scripts/commandAliasing.sh"],
        "pie": f"""```mermaid
{PIE_CHART_INIT}
pie title Session 13 alias demos
    "alias define list" : 25
    "type unalias" : 25
    "class labs d20f current" : 30
    "persistence hint" : 20
```""",
        "flow": f"""```mermaid
{MERMAID_GREY}
flowchart LR
    A[alias name=cmd] --> U[use nickname]
    U --> R[real command runs]
    A --> L[alias list]
    U --> UN[unalias]

    classDef darkGrey fill:#5c5c5c,stroke:#3d3d3d,color:#ffffff,stroke-width:2px
    class A,U,R,L,UN darkGrey
```""",
    },
]


def execution_body_for_topic(
    pie_mermaid: str,
    flow_mermaid: str | None,
    paths: list[Path],
    scripts_link_prefix: str,
) -> str:
    """Pie chart through run-all block — embedded in docs/topics/*.md."""
    parts = [pie_mermaid, ""]
    if flow_mermaid:
        parts.extend([flow_mermaid, ""])
    parts.extend([FOUR_PART_LEGEND.strip(), "", "---", ""])
    for p in paths:
        parts.append(section_for_script(p, scripts_link_prefix=scripts_link_prefix))
        parts.append("---")
        parts.append("")
    parts.append("## Script index (all `.sh` in this summary)")
    parts.append("")
    parts.append(script_index_table(paths, scripts_link_prefix))
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


def merge_execution_into_topic(topic_rel: str, begin: str, end: str, body: str) -> None:
    topic_path = REPO / topic_rel
    text = topic_path.read_text(encoding="utf-8")
    if begin not in text or end not in text:
        raise SystemExit(f"Markers not found in {topic_path}")
    start = text.index(begin) + len(begin)
    stop = text.index(end)
    new_text = text[:start] + "\n" + body.rstrip() + "\n" + text[stop:]
    topic_path.write_text(new_text, encoding="utf-8")


def main() -> None:
    for spec in SPECS:
        paths = collect_scripts(spec["dirs"], spec.get("extra"))
        if spec.get("file") == "DateandCal Execution summary.md":
            orch = SCRIPTS / "date-cal-commands" / "Date and Cal commands.sh"
            paths = [orch] + [p for p in paths if p.resolve() != orch.resolve()]
        link_prefix = spec.get("scripts_link_prefix", "../scripts/")
        if spec.get("merge_into_topic"):
            body = execution_body_for_topic(
                spec["pie"],
                spec.get("flow"),
                paths,
                link_prefix,
            )
            merge_execution_into_topic(
                spec["merge_into_topic"],
                spec["execution_begin"],
                spec["execution_end"],
                body,
            )
            print(f"Merged execution summary into {spec['merge_into_topic']} ({len(paths)} scripts)")
            continue
        doc = build_doc(
            spec["title"],
            spec["topic"],
            spec["dir_line"],
            spec["pie"],
            spec.get("flow"),
            paths,
            link_prefix,
        )
        out_path = OUT / spec["file"]
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(doc, encoding="utf-8")
        print(f"Wrote {out_path} ({len(paths)} scripts)")


if __name__ == "__main__":
    main()
