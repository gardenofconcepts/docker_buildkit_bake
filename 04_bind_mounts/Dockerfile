# syntax=docker/dockerfile:1.2

FROM alpine:latest as stage1
ARG CHECKSUM_SHA256="76cccc9a8590efc268967a1843f41213bbc057c9a1d381d63d91da4ada913f51"
WORKDIR /images

RUN --mount=type=bind,rw,source=./images,target=/images \
    echo "${CHECKSUM_SHA256}  ubuntu.iso" | sha256sum -c - && \
    sha256sum ubuntu.iso >> /sha256sums.txt

FROM alpine:latest as stage2
WORKDIR /stage1
RUN --mount=type=bind,ro,from=stage1,source=.,target=. \
    ls -lah && \
    cat sha256sums.txt
