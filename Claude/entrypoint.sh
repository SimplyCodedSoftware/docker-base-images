#!/bin/bash
set -euo pipefail

if [ -f "$HOME/.claude.host.json" ]; then
    if [ "${CLAUDE_STRIP_AUTH:-}" = "1" ]; then
        jq '.installMethod = "npm" | del(.primaryApiKey, .oauthAccount, .customApiKeyResponses)' "$HOME/.claude.host.json" > "$HOME/.claude.json"
    else
        jq '.installMethod = "npm"' "$HOME/.claude.host.json" > "$HOME/.claude.json"
    fi
fi

if [ -n "${WORKTREE_BRANCH:-}" ]; then
    echo "Creating worktree for branch: $WORKTREE_BRANCH"
    git -C /repo worktree add /workspace "$WORKTREE_BRANCH" 2>/dev/null \
        || git -C /repo worktree add -b "$WORKTREE_BRANCH" /workspace
fi

exec claude --dangerously-skip-permissions "$@"
