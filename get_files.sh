#!/bin/bash

export target_dir=/home/jjkim/vllm-setup/gemma3-4b
mkdir -p $target_dir

cd ~/.cache/huggingface/hub/models--google--gemma-3-4b-it/snapshots/093f9f388b31de276ce2de164bdc2081324b9767

for f in *.json *.model *.safetensors; do
    echo copy "$f"
    cp --dereference "$f" "$target_dir/"
done
