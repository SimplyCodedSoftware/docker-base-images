#!/bin/bash
set -euo pipefail

if [ -f "$HOME/.claude.host.json" ]; then
    if [ "${CLAUDE_STRIP_AUTH:-}" = "1" ]; then
        jq '.installMethod = "npm" | del(.primaryApiKey, .oauthAccount, .customApiKeyResponses)' "$HOME/.claude.host.json" > "$HOME/.claude.json"
    else
        jq '.installMethod = "npm"' "$HOME/.claude.host.json" > "$HOME/.claude.json"
    fi
fi

cd "${HOST_PROJECT_DIR:-/workspace}"

if [ -n "${ENTRYPOINT_PROMPT:-}" ]; then
    echo "Running entrypoint prompt: $ENTRYPOINT_PROMPT"
    claude --dangerously-skip-permissions -p "$ENTRYPOINT_PROMPT" || true
    echo ""
    echo "Entrypoint prompt completed. Starting interactive session..."
fi

exec claude --dangerously-skip-permissions "$@"
