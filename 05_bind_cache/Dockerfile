# syntax=docker/dockerfile:1.2

FROM alpine:latest as base

RUN apk add --no-cache nodejs npm

RUN time npm install -g @angular/cli@latest

RUN --mount=type=cache,target=/root/.npm \
  time npm install -g @angular/cli@latest

RUN --mount=type=cache,target=/root/.npm \
  time npm install -g @angular/cli@latest jquery
