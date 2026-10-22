#Code Runner (formulahendry.code-runner) is already installed. Open a .sh file and use Run Code or press Ctrl+Alt+N to execute it with Bash.
# It runs the currently open script, not every .sh file in the repository at once. Ensure Bash is installed on your system.

#!/bin/bash
# Runs split builtin demos — prefer individual bash-*-demo.sh files for readable output
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

run_demo bash-help-list-demo.sh
run_demo bash-pwd-cd-echo-type-demo.sh
run_demo bash-conditional-arithmetic-demo.sh
run_demo bash-alias-export-unset-demo.sh
run_demo bash-pushd-popd-dirs-demo.sh
run_demo bash-external-file-command-demo.sh
run_demo bash-printf-mapfile-demo.sh
