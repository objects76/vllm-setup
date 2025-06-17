# h100

- H100 장비 비번 : root / rsup4430

# uv setup
- curl -LsSf https://astral.sh/uv/install.sh | sh

## 설치 및 실행

uv init gemma3 --python=3.11
uv pip install vllm openai
uv pip install vllm --torch-backend=auto openai

python -c "import vllm, openai; print(vllm.__version__, openai.__version__)"


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

