#!/usr/bin/env bash
# Generate 3D mesh from text using Stable Diffusion backend
set -e

PROMPT="$1"
ITERS="${2:-10000}"

if [ -z "$PROMPT" ]; then
    echo "Usage: $0 \"prompt\" [iters]"
    exit 1
fi

RUN_DIR=/workspace/runs/$(date +%Y%m%d_%H%M%S)

python /stable-dreamfusion/main.py \
    --text "$PROMPT" \
    --workspace "$RUN_DIR" \
    --save_mesh \
    --iters "$ITERS"

echo "Mesh and outputs -> $RUN_DIR"
