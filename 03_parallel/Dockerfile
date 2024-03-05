# syntax=docker/dockerfile:1.6

FROM alpine:latest as base
RUN apk add --no-cache git
RUN git --version

FROM base as python
RUN apk add --no-cache python3 py3-pip
RUN pip install --break-system-packages pipx
RUN pipx --version

FROM base as node
ENV PATH /usr/local/bin:$PATH
RUN apk add --no-cache nodejs npm
RUN npm install -g @angular/cli@latest
RUN ng version
