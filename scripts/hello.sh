#!/bin/bash
# Part 2 — first script: shebang, positional parameters
COURSE="${1:-Linux Basics}"
echo "Hello from $0"
echo "Studying: $COURSE"
echo "Argument count: $#"
# hereYes—echo is roughly like Java’s System.out.println(): it writes text to standard output and 
# normally ends with a newline. Bash’s printf is another option when you need precise formatting.
