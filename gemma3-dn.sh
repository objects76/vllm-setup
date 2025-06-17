#!/bin/bash

# Hugging Face token should be set as environment variable
# export HF_TOKEN="your_token_here"
if [ -z "$HF_TOKEN" ]; then
    echo "Error: HF_TOKEN environment variable is not set"
    echo "Please set your Hugging Face token: export HF_TOKEN='your_token_here'"
    exit 1
fi

base_url="https://huggingface.co/google/gemma-3-27b-it/resolve/main"

files=(
  "README.md"
  "added_tokens.json"
  "chat_template.json"
  "config.json"
  "generation_config.json"
  "model.safetensors.index.json"
  "preprocessor_config.json"
  "processor_config.json"
  "special_tokens_map.json"
  "tokenizer.json"
  "tokenizer.model"
  "tokenizer_config.json"
)

# Add model weight shards
for i in $(seq -w 1 12); do
  size="model-000$i-of-00012.safetensors"
  files+=("$size")
done

# Create output directory
mkdir -p gemma-3-27b-it && cd gemma-3-27b-it

for file in "${files[@]}"; do
  echo "Downloading $file..."
  wget --header="Authorization: Bearer $HF_TOKEN" "$base_url/$file"
done


# with huggingface-cli
# pip install huggingface_hub
# export HF_TOKEN="your_huggingface_token_here"
# huggingface-cli login --token $HF_TOKEN
# huggingface-cli download google/gemma-3-27b-it