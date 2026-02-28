#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="simplycodedsoftware/claude-sandbox:latest"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)

echo "Building and pushing $IMAGE_NAME..."
docker buildx build --builder mybuilder --platform linux/amd64 --push \
    --build-arg HOST_DOCKER_GID="$DOCKER_GID" \
    -t "$IMAGE_NAME" \
    "$SCRIPT_DIR"
