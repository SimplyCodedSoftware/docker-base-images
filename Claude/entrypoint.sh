#!/bin/bash
set -euo pipefail

if [ -f "$HOME/.claude.host.json" ]; then
    if [ "${CLAUDE_STRIP_AUTH:-}" = "1" ]; then
        jq '.installMethod = "npm" | del(.primaryApiKey, .oauthAccount, .customApiKeyResponses)' "$HOME/.claude.host.json" > "$HOME/.claude.json"
    else
        jq '.installMethod = "npm"' "$HOME/.claude.host.json" > "$HOME/.claude.json"
    fi
fi

exec claude --dangerously-skip-permissions "$@"
