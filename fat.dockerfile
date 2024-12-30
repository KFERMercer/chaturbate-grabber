# 
# Install FFmpeg package from repository instead of compiling it.
# This will significantly increase the size of final image.
# 
# Use this Dockerfile with:
# `docker build -t ctbcap . -f fat.dockerfile`
# 

FROM alpine:latest

RUN apk add --no-cache curl ffmpeg tini tzdata

RUN <<EOT
    mkdir -p /save /log
    chmod 777 /save /log
EOT

COPY ./ctbcap-healthcheck /usr/bin/
COPY ./ctbcap /usr/bin/

USER 1000:1000

ENV TZ="UTC"
ENV LOG_PATH="/log"
ENV SAVE_PATH="/save"
ENV MODEL=""
ENV PLATFORM="chaturbate"
ENV CUT_TIME=3600
ENV EDGING_MODE="uncle makes me pee white"
ENV DEBUG_MODE="your mom is so hot"

HEALTHCHECK \
    --interval=300s \
    --timeout=30s \
    --start-period=300s \
    --start-interval=300s \
    --retries=3 \
    CMD ["ctbcap-healthcheck"]

ENTRYPOINT ["tini", "-g", "--", "ctbcap"]
