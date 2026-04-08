# Claude Docker

Run Claude Code in a sandboxed Docker container with full tooling support.

## Quick Install

### Linux

```bash
sudo curl -fsSL https://raw.githubusercontent.com/SimplyCodedSoftware/docker-base-images/master/Claude/claude-docker -o /usr/local/bin/claude-docker && sudo chmod +x /usr/local/bin/claude-docker
```

### macOS

```bash
curl -fsSL https://raw.githubusercontent.com/SimplyCodedSoftware/docker-base-images/master/Claude/claude-docker -o /usr/local/bin/claude-docker && chmod +x /usr/local/bin/claude-docker
```

## Usage

```bash
# Run in current directory
claude-docker

# Run in a specific project
claude-docker ~/projects/my-app

# Create a git worktree for isolated work
claude-docker -w feature-foo -d /tmp/claude-worktrees ~/projects/my-app

# Restore a previously detached worktree
claude-docker -w feature-foo -d /tmp/claude-worktrees --restore ~/projects/my-app

# Run a setup prompt before starting interactive session
claude-docker --entrypoint-prompt="Add .env file in the root of the project" .

# Use a custom Claude config directory
CLAUDE_CONFIG_DIR=~/.claude-personal claude-docker .

# Pass extra arguments to Claude
claude-docker . -- --continue
```

## Options

| Option | Description |
|---|---|
| `--worktree, -w <name>` | Create a git worktree on the given branch |
| `--worktree-dir, -d <path>` | Host directory for worktrees (required with `--worktree`) |
| `--restore` | Restore a previously detached worktree |
| `--entrypoint-prompt <text>` | Run a Claude prompt to set up the environment before starting |
| `--help` | Show help |

## Requirements

- Docker
- `gh` CLI (optional, for GitHub authentication passthrough)
