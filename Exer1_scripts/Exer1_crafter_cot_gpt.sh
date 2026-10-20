#!/usr/bin/env bash

for seed in {1..10}; do
  time python eval.py \
    agent.type=cot \
    agent.remember_cot=true \
    agent.max_cot_history=1 \
    agent.max_image_history=0 \
    agent.max_text_history=16 \
    envs.names=crafter \
    envs.env_kwargs.seed="$seed" \
    eval.num_episodes.crafter=1 \
    eval.num_workers=4 \
    eval.max_steps_per_episode=null \
    client.client_name=openai \
    client.model_id=gpt-6-luna \
    client.generate_kwargs.temperature=1.0 \
    client.generate_kwargs.max_tokens=512 \
    client.generate_kwargs.thinking_budget=null \
    ++client.generate_kwargs.reasoning_effort=none \
    eval.output_dir="results/full_crafter_cot_gpt6luna_none/seed_$seed"
done
