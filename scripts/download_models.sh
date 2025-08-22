#!/usr/bin/env bash
# Download required model weights
set -e

MODEL_DIR=/models
SD_DIR=$MODEL_DIR/sd21

# Download Stable Diffusion 2.1 base
if [ ! -d "$SD_DIR" ]; then
    if [ -z "$HF_TOKEN" ]; then
        echo "HF_TOKEN environment variable not set."
        echo "Please export HF_TOKEN with access to stabilityai/stable-diffusion-2-1-base."
        exit 1
    fi
    mkdir -p "$SD_DIR"
    echo "Downloading Stable Diffusion 2.1 base..."
    huggingface-cli download --token "$HF_TOKEN" --cache-dir "$SD_DIR" \
        stabilityai/stable-diffusion-2-1-base --local-dir "$SD_DIR" \
        --local-dir-use-symlinks False
else
    echo "Stable Diffusion 2.1 already exists at $SD_DIR"
fi

# Check for zero123 checkpoint
ZERO123_CKPT=$MODEL_DIR/zero123/zero123-xl.ckpt
if [ ! -f "$ZERO123_CKPT" ]; then
    echo "zero123-xl.ckpt not found at $ZERO123_CKPT"
    echo "Please manually download zero123-xl.ckpt and place it at this path."
else
    echo "Found zero123-xl.ckpt"
fi

echo "Model setup complete."
