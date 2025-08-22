#!/usr/bin/env bash
# Build the DreamFusion Docker image
set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
IMAGE_NAME="dreamfusion:cu121"

docker build -t "$IMAGE_NAME" -f "$REPO_ROOT/Dockerfile" "$REPO_ROOT"
