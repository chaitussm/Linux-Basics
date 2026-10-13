#!/bin/bash
# Part 2 — first script: shebang, positional parameters
COURSE="${1:-Linux Basics}"
echo "Hello from $0"
echo "Studying: $COURSE"
echo "Argument count: $#"
