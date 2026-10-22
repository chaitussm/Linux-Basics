#!/bin/bash
# Session 4 — absolute paths from / vs relative paths from cwd
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

run_demo() {
  local name="$1"
  echo ""
  echo "############################################"
  echo "# $name"
  echo "############################################"
  bash "$HERE/$name"
}

run_demo relative-cd-mydir-demo.sh
run_demo absolute-cd-work-and-home-demo.sh
run_demo cd-home-from-root-vs-tmp-demo.sh
