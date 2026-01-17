FROM python:3.12-slim

RUN pip install uv

RUN apt update && \
    apt install -y --no-install-recommends \
        rsync \
        git && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/comfyanonymous/ComfyUI.git /src

COPY ./entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

COPY ./start.sh /bin/start.sh
RUN chmod +x /bin/start.sh

