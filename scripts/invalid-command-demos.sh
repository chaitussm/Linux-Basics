#!/bin/bash
# Components of Unix — shell reports errors (invalid name / invalid usage)
set +e
echo "=== Invalid command name (expect: command not found) ==="
touch123 2>&1

echo ""
echo "=== Invalid option (expect: error from touch) ==="
touch -da abc.txt 2>&1

echo ""
echo "=== Invalid argument (expect: cal error) ==="
cal 99999 2>&1

set -e
echo ""
echo "These failures are handled by the shell before the kernel runs the command."
