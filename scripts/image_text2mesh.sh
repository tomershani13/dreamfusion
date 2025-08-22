#!/usr/bin/env bash
# Generate 3D mesh from an image conditioned on text
set -e

IMAGE_PATH="$1"
PROMPT="$2"
ITERS="${3:-10000}"

if [ -z "$IMAGE_PATH" ] || [ -z "$PROMPT" ] || [ ! -f "$IMAGE_PATH" ]; then
    echo "Usage: $0 /path/to/image.png \"prompt\" [iters]"
    exit 1
fi

ZERO123_CKPT=/models/zero123/zero123-xl.ckpt
if [ ! -f "$ZERO123_CKPT" ]; then
    echo "Required checkpoint not found at $ZERO123_CKPT"
    echo "Run download_models.sh and place zero123-xl.ckpt accordingly."
    exit 1
fi

RUN_DIR=/workspace/runs/$(date +%Y%m%d_%H%M%S)

python /stable-dreamfusion/main.py \
    --image "$IMAGE_PATH" \
    --text "$PROMPT" \
    --zero123_ckpt "$ZERO123_CKPT" \
    --workspace "$RUN_DIR" \
    --save_mesh \
    --iters "$ITERS"

echo "Mesh and outputs -> $RUN_DIR"
