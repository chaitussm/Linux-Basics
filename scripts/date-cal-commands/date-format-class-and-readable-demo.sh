#!/bin/bash
# Session 8 — date + format strings
set -euo pipefail

echo "=== date + custom format (class style: day_month_year_hour_min_sec) ==="
date +%d_%m_%Y_%H_%M_%S

echo ""
echo "=== date + readable format ==="
date +"%d/%m/%Y %H:%M:%S"
