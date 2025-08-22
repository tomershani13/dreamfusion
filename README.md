# DreamFusion Docker Setup

This repository provides scripts to build and run a Docker image for [ashawkey/stable-dreamfusion](https://github.com/ashawkey/stable-dreamfusion).

## Structure
```
dreamfusion/
├─ Dockerfile
├─ scripts/
│  ├─ build.sh
│  ├─ run_container.sh
│  ├─ download_models.sh
│  ├─ text2mesh.sh
│  ├─ image2mesh.sh
│  └─ image_text2mesh.sh
├─ models/
└─ workspace/
```

## Usage
1. **Build image**
   ```bash
   bash scripts/build.sh
   ```
2. **Run container**
   ```bash
   bash scripts/run_container.sh
   ```
3. Inside the container, download models:
   ```bash
   bash scripts/download_models.sh
   ```
4. Generate meshes using the provided scripts.
