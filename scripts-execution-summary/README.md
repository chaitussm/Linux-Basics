# Scripts execution summary

This folder explains **every command** in **every** **`.sh`** under [`../scripts/`](../scripts/). One **`.md` file per topic folder** matches the split demo layout: each script has an **in-depth table** with (1) what the command is, (2) how it is configured, (3) execution intent, (4) terminal / file / pipeline output.

Regenerate after script changes:

```bash
python3 scripts-execution-summary/tools/build_execution_summaries.py
```

| Summary file | Scripts folder | Topic notes |
| :--- | :--- | :--- |
| [components-of-unix.md](components-of-unix.md) | [`components-of-unix/`](../components-of-unix/) | [Components of Unix.md](../../docs/topics/Components%20of%20Unix.md) |
| [types-of-files-in-linux.md](types-of-files-in-linux.md) | [`types-of-files-in-linux/`](../types-of-files-in-linux/) | [TypesOfFilesInLinux.md](../../docs/topics/TypesOfFilesInLinux.md) |
| [bash-built-in-commands.md](bash-built-in-commands.md) | [`bash-built-in-commands/`](../bash-built-in-commands/) | [Bash Built-in Commands.md](../../docs/topics/Bash%20Built-in%20Commands.md) |
| [file-system-navigation-and-hierarchy.md](file-system-navigation-and-hierarchy.md) | [`file-system-navigation-and-hierarchy/`](../file-system-navigation-and-hierarchy/) | [File System Navigation Commands And Hierarchy.md](../../docs/topics/File%20System%20Navigation%20Commands%20And%20Hierarchy.md) |
| [shell-scripting.md](shell-scripting.md) | [`shell-scripting/`](../shell-scripting/) | Shell scripting examples (Part 2 preview) |
| [ls-command-and-its-options.md](ls-command-and-its-options.md) | [`ls-command-and-its-options/`](../scripts/ls-command-and-its-options/) | [ls Command and its options.md](../docs/topics/ls%20Command%20and%20its%20options.md) (Video 7) |
| [DateandCal Execution summary.md](DateandCal%20Execution%20summary.md) | [`date-and-cal-commands/`](../scripts/date-and-cal-commands/) + orchestrator | [Date and Cal commands.md](../docs/topics/Date%20and%20Cal%20commands.md) (Video 8) |

```bash
cd /path/to/Linux-Basics
chmod +x scripts/**/*.sh
bash scripts/components-of-unix/invalid-command-demos.sh
```
