#!/usr/bin/env bash

python eval.py \
  agent.type=naive \
  agent.max_image_history=0 \
  agent.max_text_history=16 \
  envs.names=babyai \
  'tasks.babyai_tasks=[BabyAI-MixedTrainLocal-v0/goto]' \
  eval.num_episodes.babyai=1 \
  eval.num_workers=1 \
  eval.max_steps_per_episode=30 \
  envs.env_kwargs.seed=0 \
  client.client_name=openai \
  client.model_id=gpt-4o-mini-2024-07-18 \
  client.generate_kwargs.temperature=1.0 \
  client.generate_kwargs.max_tokens=128 \
  eval.output_dir=results/setup_check

