#!/bin/bash
set -e

# 确保数据目录存在
mkdir -p data/models \
    data/output \
    data/input \
    data/user

# 检查 .venv 文件，该文件中定义了内网穿透的配置信息
if [ ! -f ".env" ]; then
    echo "错误：当前目录下缺少 .env 文件" >&2
    exit 1
fi

# 下载模型文件
export HF_ENDPOINT=https://hf-mirror.com


echo "环境检查通过，继续执行后续操作..."