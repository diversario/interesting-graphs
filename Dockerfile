FROM alpine:3.10

RUN apk --no-cache add parallel stress-ng
COPY scripts/* /app/scripts/
WORKDIR /app/scripts

ENTRYPOINT ["./run.sh"]
