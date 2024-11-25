FROM alpine:latest

RUN \
    apk add --no-cache bash curl ffmpeg tini tzdata; \
    mkdir -p /log /save; \
    chmod 777 /log /save; \
    rm -rf /tmp/* /var/log/*

COPY ./ctbcap-healthcheck /usr/sbin/
COPY ./ctbcap /usr/sbin/

USER 1000:1000

ENV \
    TZ="UTC" \
    LOG_PATH="/log" \
    SAVE_PATH="/save" \
    MODEL="" \
    PLATFORM="chaturbate" \
    EDGING_MODE="uncle makes me pee white" \
    DEBUG_MODE="your mom is so hot"

HEALTHCHECK \
    --interval=30s \
    --timeout=10s \
    --retries=3 \
    --start-period=5s \
    CMD ["ctbcap-healthcheck"]

ENTRYPOINT ["tini", "-g", "--"]

CMD ["ctbcap"]
