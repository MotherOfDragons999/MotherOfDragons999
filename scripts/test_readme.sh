#!/bin/sh
set -e
# Fail if README contains malformed comment markers
if grep -n '<!---' README.md || grep -n -- '--->' README.md; then
  echo "Invalid comment markers found" >&2
  exit 1
fi
# Optionally run a markdown linter if available
if command -v markdownlint >/dev/null 2>&1; then
  markdownlint README.md
fi

echo "README checks passed"
