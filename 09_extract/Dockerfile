FROM alpine:latest as build

RUN apk add --no-cache tree
RUN tree --charset=ascii -x / > /tree.txt


FROM scratch as dist
COPY --from=build /tree.txt /
