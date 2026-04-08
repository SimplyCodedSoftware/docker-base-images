#!/bin/bash
set -euo pipefail

if [ -S /var/run/docker.sock ]; then
    SOCK_GID=$(stat -c '%g' /var/run/docker.sock)
    sudo groupmod -g "$SOCK_GID" hostdocker 2>/dev/null || true
    sudo usermod -aG hostdocker claude 2>/dev/null || true
fi

# Create symlink so plugin paths from host resolve inside the container
# (installed_plugins.json references /home/<host-user>/.claude/... paths)
if [ -d "$HOME/.claude/plugins" ] && [ -n "${HOST_HOME:-}" ] && [ "$HOST_HOME" != "$HOME" ]; then
    sudo mkdir -p "$(dirname "$HOST_HOME")"
    sudo ln -sfn "$HOME/.claude" "$HOST_HOME/.claude"
fi

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
