# syntax=docker/dockerfile:1.6

FROM alpine:latest as base

ENV PATH="/app/venv/bin:$PATH"
WORKDIR /app

RUN \
  apk add --no-cache openssh-client git python3 py3-pip && \
  ssh-keyscan -t rsa gitlab.com >> /etc/ssh/ssh_known_hosts && \
  python3 -m venv /app/venv


FROM base as setup

WORKDIR /app

COPY --from=app_src requirements.txt .

RUN --mount=type=ssh \
  pip install -r requirements.txt

COPY --from=app_src cli.py .


FROM alpine:3.19 as app
WORKDIR /app

ENV PATH="/app/venv/bin:$PATH"

RUN apk add --no-cache python3

COPY --from=setup /app .

RUN ls -la && ./cli.py --help

CMD ["python3", "cli.py"]
