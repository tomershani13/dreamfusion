#!/usr/bin/env bash
# Run the DreamFusion Docker container with GPU and mounted volumes
set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
IMAGE_NAME="dreamfusion:cu121"

docker run --rm -it --gpus all \
    -v "$REPO_ROOT/models":/models \
    -v "$REPO_ROOT/workspace":/workspace \
    "$IMAGE_NAME" "$@"
