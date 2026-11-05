#!/bin/bash
# Session 13 — alias of alias (class: C → cls → date; demo uses nick2 → nick1 → clear)
set -euo pipefail
shopt -s expand_aliases

alias cls=clear
alias C=cls
type C
type cls
echo "C runs clear via cls (class chain):"
C
