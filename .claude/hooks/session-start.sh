#!/bin/bash
set -euo pipefail

# This repo is a single static HTML page with no package manager, build
# step, tests, or linter. This hook just confirms a static file server
# is available so the page can be previewed (e.g. python3 -m http.server).
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

if command -v python3 >/dev/null 2>&1; then
  echo "OK: python3 available (serve with: python3 -m http.server)"
elif command -v npx >/dev/null 2>&1; then
  echo "OK: npx available (serve with: npx serve)"
else
  echo "WARN: no static file server tooling found (python3 or npx)" >&2
fi
