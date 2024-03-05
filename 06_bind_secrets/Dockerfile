# syntax=docker/dockerfile:1.6

FROM alpine:latest

ENV PATH="/app/venv/bin:$PATH"

RUN \
  apk add --no-cache openssh-client git python3 py3-pip && \
  ssh-keyscan -t rsa gitlab.com >> /etc/ssh/ssh_known_hosts && \
  python3 -m venv /app/venv

WORKDIR /app

COPY requirements.txt .

RUN --mount=type=ssh \
  pip install -r requirements.txt

COPY cli.py .

RUN --mount=type=secret,id=MY_TOKEN <<EOF
  export MY_TOKEN=$(cat /run/secrets/MY_TOKEN)
  ./cli.py
EOF
