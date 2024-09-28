FROM alpine:latest

RUN \
    apk add --no-cache bash curl ffmpeg tzdata wget; \
    mkdir -p /log /save; \
    chmod 777 /log /save; \
    rm -rf /tmp/* /var/log/*

COPY ./ctbcap ./ctbcap-healthcheck /usr/sbin/

USER 1000:1000

ENV \
    TZ="UTC" \
    LOG_PATH="/log" \
    SAVE_PATH="/save" \
    MODEL=""

HEALTHCHECK \
    --interval=30s \
    --timeout=10s \
    --retries=3 \
    --start-period=5s \
    CMD ["ctbcap-healthcheck"]

ENTRYPOINT ["ctbcap"]
