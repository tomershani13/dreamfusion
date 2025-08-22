FROM nvidia/cuda:12.1.1-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    wget \
    curl \
    ca-certificates \
    python3 \
    python3-pip \
    python3-venv \
    build-essential \
    ninja-build \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Clone stable-dreamfusion repository
RUN git clone https://github.com/ashawkey/stable-dreamfusion.git /stable-dreamfusion
WORKDIR /stable-dreamfusion

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install torch==2.1.0 torchvision==0.16.0 --index-url https://download.pytorch.org/whl/cu121 && \
    pip install -r requirements.txt && \
    pip install xformers==0.0.22.post7 && \
    pip install git+https://github.com/NVlabs/nvdiffrast.git && \
    pip install git+https://github.com/NVlabs/tiny-cuda-nn.git

# Hugging Face cache location
ENV HF_HOME=/models/hf

CMD ["/bin/bash"]
