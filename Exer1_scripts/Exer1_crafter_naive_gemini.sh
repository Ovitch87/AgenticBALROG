#!/usr/bin/env bash
# Run from the BALROG folder with the balrog conda environment active.
# 10 seeds x 1 Crafter episode = 10 episodes.

for seed in {1..10}; do
  time python eval.py \
    agent.type=naive \
    agent.max_image_history=0 \
    agent.max_text_history=16 \
    envs.names=crafter \
    envs.env_kwargs.seed=$seed \
    eval.num_episodes.crafter=1 \
    eval.num_workers=4 \
    eval.max_steps_per_episode=null \
    client.client_name=gemini \
    client.model_id=gemini-3.5-flash-lite \
    client.generate_kwargs.temperature=null \
    client.generate_kwargs.max_tokens=128 \
    client.generate_kwargs.thinking_budget=null \
    eval.output_dir=results/full_crafter_naive_gemini35flashlite/seed_$seed
done

