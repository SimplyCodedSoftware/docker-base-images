#!/bin/bash
set -euo pipefail

if [ -f "$HOME/.claude.host.json" ]; then
    jq '.installMethod = "npm"' "$HOME/.claude.host.json" > "$HOME/.claude.json"
fi

exec claude --dangerously-skip-permissions "$@"
