#!/bin/bash
# Conditional example from shell scripting section
FILE="${1:?Usage: $0 <file>}"
if [ -f "$FILE" ]; then
  echo "$FILE exists ($(wc -l < "$FILE") lines)"
else
  echo "$FILE does not exist" >&2
  exit 1
fi
