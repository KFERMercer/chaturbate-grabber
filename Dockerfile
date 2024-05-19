# docker build -t ctbcap .
# docker run -it --rm -v /path/to/cap:/cap ctbcap
# docker system prune

FROM bash:latest

RUN \
    apk add --no-cache tzdata ffmpeg curl wget; \
    mkdir -p /log /save; \
    chmod 777 /log /save; \
    rm -rf /tmp/* /var/log/*

COPY ./ctbcap /usr/sbin/

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
    CMD \
        [[ ! $(ps -ef | grep -oE "[f]fmpeg -i.*${MODEL}.*\.m3u8*") ]] && exit 0 || \
        [[ $(ps -ef | grep -oE "[f]fmpeg -i.*${MODEL}.*\.m3u8*") ]] && [ $(curl -4 -I -s $(cat ${LOG_PATH}/${MODEL}.online) -w %{http_code} 2>/dev/null | tail -n1) -lt 400 ] && exit 0 || \
        exit 1

ENTRYPOINT ["ctbcap"]
