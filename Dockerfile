FROM python:3.10-bookworm

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_PREFER_BINARY=1 \
    PYTHONUNBUFFERED=1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Upgrade apt packages and install required dependencies
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
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

COPY rp_handler.py /rp_hander.py

# Start the container
CMD [ "python", "-u", "/rp_handler.py" ]
