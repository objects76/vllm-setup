# h100

- H100 장비 비번 : root / rsup4430

## 환경 변수 설정

보안을 위해 Hugging Face 토큰은 환경변수로 설정하세요:

```bash
# Hugging Face 토큰 설정 (https://huggingface.co/settings/tokens 에서 발급)
export HF_TOKEN="your_huggingface_token_here"

# 영구적으로 설정하려면 ~/.bashrc 또는 ~/.zshrc에 추가
echo 'export HF_TOKEN="your_huggingface_token_here"' >> ~/.bashrc
source ~/.bashrc
```

## 설치 및 실행

uv init gemma3 --python=3.11
uv pip install vllm openai
uv pip install vllm --torch-backend=auto openai

python -c "import vllm, openai; print(vllm.__version__, openai.__version__)"



####
pip install huggingface_hub

#!/bin/bash
# Set your Hugging Face token as environment variable first:
# export HF_TOKEN="your_huggingface_token_here"
huggingface-cli login --token $HF_TOKEN
huggingface-cli download google/gemma-3-27b-it



$ cat pyproject.toml
[project]
name = "gemma3"
version = "0.1.0"
description = "gemma3 hosting with vllm"
readme = "README.md"
requires-python = ">=3.11"
dependencies = [
    "setuptools>=79.0.0",
    "vllm>=0.8.4",
    "openai>=1.75.0",
]





$ cat gemma-3-it.yaml


# vllm serve --config google/gemma-3-it.yaml

# server things______________________________
port: 8000
host: "0.0.0.0"
model: google/gemma-3-27b-it

# gpu-memory-utilization: 0.81

max-model-len: 32768
swap-space: 32

# uv setup
- curl -LsSf https://astral.sh/uv/install.sh | sh
