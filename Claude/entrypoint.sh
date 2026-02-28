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
    WORKTREE_DIR="/worktrees/$(head -c 8 /dev/urandom | od -An -tx1 | tr -d ' \n')"
    git -C /repo worktree add "$WORKTREE_DIR" "$WORKTREE_BRANCH" 2>/dev/null \
        || git -C /repo worktree add -b "$WORKTREE_BRANCH" "$WORKTREE_DIR"
    ln -sfn "$WORKTREE_DIR" /workspace
fi

exec claude --dangerously-skip-permissions "$@"
