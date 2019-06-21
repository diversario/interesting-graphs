FROM alpine:3.10

COPY scripts/* /app/scripts/
WORKDIR /app/scripts

ENTRYPOINT ["./run.sh"]
