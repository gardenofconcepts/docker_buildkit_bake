# syntax=docker/dockerfile:1.6

ARG ALPINE_VERSION=latest

FROM alpine:${ALPINE_VERSION}

RUN <<EOT
  set -ex
  apk add git python3
EOT

RUN <<EOT
#!/usr/bin/python3
import os
print("Hey, Meetup, Python is here!")
EOT
