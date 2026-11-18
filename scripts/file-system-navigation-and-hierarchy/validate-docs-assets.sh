#!/usr/bin/env bash
# List broken image links under docs/topics/*.md (real ![](...) lines only, not backtick examples)
# Usage: from repo root: bash scripts/file-system-navigation-and-hierarchy/validate-docs-assets.sh

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

refs="$(
  grep -hE '^[[:space:]]*!\[[^]]*\]\(\.\./assets/[^)]+\)' docs/topics/*.md 2>/dev/null \
    | grep -ohE '\]\(\.\./assets/[^)]+\)' \
    | sed 's/](\.\.\/assets\///;s/)$//' \
    | sort -u
)"
missing=0
while IFS= read -r name; do
  [[ -z "$name" ]] && continue
  file="docs/assets/$name"
  if [[ ! -f "$file" ]]; then
    echo "MISSING: $file"
    missing=$((missing + 1))
  fi
done <<< "$refs"

if [[ "$missing" -eq 0 ]]; then
  n=$(echo "$refs" | grep -c . || true)
  echo "OK: all $n referenced asset paths exist under docs/assets/."
else
  echo "---"
  echo "$missing file(s) missing. Add PNGs under docs/assets/ and commit, or remove/replace the markdown image line."
  exit 1
fi