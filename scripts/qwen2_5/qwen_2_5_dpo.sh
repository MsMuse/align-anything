#!/usr/bin/env bash
#
# Copyright 2025 PKU-Alignment Team. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

MODEL_NAME_OR_PATH="/mnt/file2/models2/Qwen2.5-0.5B-Instruct"  # 模型绝对路径

TRAIN_DATASETS="/mnt/file2/shiyi/homework2/local_dir"          # 训练数据绝对路径

TRAIN_TEMPLATE="PKUSafeRLHF"
TRAIN_SPLIT="train"

OUTPUT_ROOT_DIR="/mnt/file2/shiyi/homework2/outputs"  

if [ -z "$OUTPUT_ROOT_DIR" ]; then
    echo "OUTPUT_ROOT_DIR is not set"
    OUTPUT_ROOT_DIR="../outputs"
fi

OUTPUT_DIR="${OUTPUT_ROOT_DIR}/qwen_2_5_dpo" # output dir

# For wandb online logging
export WANDB_API_KEY=""

# Source the setup script
# source /home/shiyi/align-anything/setup.sh


# Execute deepspeed command
deepspeed \
     --master_port ${MASTER_PORT} \
     --module align_anything.trainers.text_to_text.dpo \
     --model_name_or_path ${MODEL_NAME_OR_PATH} \
     --train_template ${TRAIN_TEMPLATE} \
     --train_datasets ${TRAIN_DATASETS} \
     --train_split ${TRAIN_SPLIT} \
     --output_dir ${OUTPUT_DIR} \
     --epochs 1 
