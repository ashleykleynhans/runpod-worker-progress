FROM python:3.10-bookworm

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_PREFER_BINARY=1 \
    PYTHONUNBUFFERED=1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Upgrade apt packages and install required dependencies
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      python3-dev \
      python3.10-venv \
      rsync \
      jq \
      moreutils \
      wget \
      curl \
      procps && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean -y

WORKDIR /
RUN pip3 install runpod

# Start the container
CMD [ "python", "-u", "/rp_handler.py" ]
