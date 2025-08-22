#!/usr/bin/env bash
# Generate 3D mesh from a single RGBA image using Zero-1-to-3 backend
set -e

IMAGE_PATH="$1"
ITERS="${2:-10000}"

if [ -z "$IMAGE_PATH" ] || [ ! -f "$IMAGE_PATH" ]; then
    echo "Usage: $0 /path/to/image.png [iters]"
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
    --zero123_ckpt "$ZERO123_CKPT" \
    --workspace "$RUN_DIR" \
    --save_mesh \
    --iters "$ITERS"

echo "Mesh and outputs -> $RUN_DIR"
