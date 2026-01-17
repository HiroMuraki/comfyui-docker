#!/bin/bash
set -e

# 将 /src 同步到 /app
rsync -av --delete \
    --exclude="/.venv" \
    --exclude="/.git" \
    --exclude="/models" \
    --exclude="/input" \
    --exclude="/output" \
    --exclude="/user" \
    /src/ \
    /app

cd /app

# 如果 pyproject.toml 不存在，进行初始化
if [ ! -f "pyproject.toml" ]; then
    uv init .
fi

# 添加 requirements.txt 中的包
if [ -f "requirements.txt" ]; then
    uv add -r requirements.txt
fi

# 同步依赖
uv sync

exec "$@"