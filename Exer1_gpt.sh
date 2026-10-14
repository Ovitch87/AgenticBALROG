#!/usr/bin/env bash

for env in babyai crafter babaisai; do
  case "$env" in
    babyai) seeds=25 ;;
    crafter) seeds=10 ;;
    babaisai) seeds=5 ;;
  esac

  for seed in $(seq 1 "$seeds"); do
    time python eval.py \
      agent.type=naive \
      agent.max_image_history=0 \
      agent.max_text_history=16 \
      envs.names=$env \
      envs.env_kwargs.seed=$seed \
      eval.num_episodes.babyai=1 \
      eval.num_episodes.crafter=1 \
      eval.num_episodes.babaisai=1 \
      eval.num_workers=4 \
      eval.max_steps_per_episode=null \
      client.client_name=openai \
      client.model_id=gpt-4.1-mini-2025-04-14 \
      client.generate_kwargs.temperature=1.0 \
      client.generate_kwargs.max_tokens=128 \
      eval.output_dir=results/full_${env}_gpt41mini/seed_$seed
  done
done
