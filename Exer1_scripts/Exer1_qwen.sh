#!/usr/bin/env bash

for seed in {1..25}; do
  time python eval.py \
    agent.type=naive \
    agent.max_image_history=0 \
    agent.max_text_history=16 \
    envs.names=babyai \
    envs.env_kwargs.seed=$seed \
    eval.num_episodes.babyai=1 \
    eval.num_workers=1 \
    eval.max_steps_per_episode=null \
    client.client_name=vllm \
    client.base_url=http://127.0.0.1:11434/v1 \
    client.model_id=qwen3.5:2b \
    client.generate_kwargs.temperature=1.0 \
    client.generate_kwargs.max_tokens=128 \
    +client.generate_kwargs.reasoning_effort=none \
    eval.output_dir=results/full_babyai_qwen/seed_$seed
done
