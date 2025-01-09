# 
# Copyright (C) 2019-2025 KFERMercer <https://github.com/KFERMercer>
# 
# This Dockerfile will build a minimal FFmpeg tailored for ctbcap.
# By doing so, it will significantly reduce the size of final image. ( 140MB -> 18MB )
# Requires 1GB of free space on file system to build.
# 
# If you don't want to compile FFmpeg:
# `docker build --build-arg BUILD_TARGET=fat --target fat -t <name:tag> .\`
# 

# Universal base for ctbcap and FFmpeg building.
FROM alpine:latest AS mother

RUN apk add --no-cache curl


# Big brother of the final product.
FROM mother AS heir

LABEL org.opencontainers.image.authors="KFERMercer <https://github.com/KFERMercer>"
LABEL org.opencontainers.image.description="A simple webcam capturer for CB & SC."
LABEL org.opencontainers.image.title="ctbcap"
LABEL org.opencontainers.image.url="https://github.com/KFERMercer/chaturbate-grabber"
LABEL org.opencontainers.image.source="https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/refs/heads/master/Dockerfile"
LABEL org.opencontainers.image.licenses="GPL-3.0-or-later"

ARG BUILD_TARGET

ARG CUID=1000
ARG CGID=1000

ENV TZ="UTC"
ENV LOG_PATH="/log"
ENV SAVE_PATH="/save"
ENV MODEL=""
ENV PLATFORM="chaturbate"
ENV CUT_TIME=3600
ENV EDGING_MODE="uncle makes me pee white"
ENV DEBUG_MODE="your mom is so hot"

RUN apk add --no-cache tini tzdata

RUN mkdir -p -m 777 /save /log

HEALTHCHECK \
    --interval=300s \
    --timeout=30s \
    --start-period=300s \
    --start-interval=300s \
    --retries=3 \
    CMD ["ctbcap-healthcheck"]

ENTRYPOINT ["tini", "-g", "--", "ctbcap"]


# Fatty product using pre-built FFmpeg.
FROM heir AS fat

USER ${CUID}:${CGID}

RUN <<EOT
    [ ${BUILD_TARGET} = "fat" ] || {
        echo "Skipping fat build"
        exit 0
    }
    apk add --no-cache ffmpeg
EOT

COPY ./ctbcap-healthcheck /usr/bin/
COPY ./ctbcap /usr/bin/


# FFmpeg Build Machine.
FROM mother AS builder

RUN <<EOT
    apk add --no-cache \
        build-base coreutils \
        openssl-dev nasm \
        zlib-dev
EOT

WORKDIR /tmp/ffmpeg_source

RUN <<EOT
    curl "https://ffmpeg.org/releases/"$( \
        curl -s -L "https://ffmpeg.org/releases/" \
            | grep -oE 'ffmpeg-[0-9]+.*.tar.xz' \
            | sed 's|\.tar.xz.*||' \
            | sort -V \
            | tail -n 1 \
    )".tar.xz" -o ffmpeg.tar.xz
    tar -xf ffmpeg.tar.xz --strip-components 1
EOT

WORKDIR /tmp/ffmpeg_bin

RUN <<EOT
    /tmp/ffmpeg_source/configure \
        --disable-everything \
        --disable-autodetect \
        --disable-avdevice \
        --disable-swscale \
        --disable-postproc \
        --disable-doc \
        --disable-programs --enable-ffmpeg \
        --disable-shared --enable-static \
        --enable-zlib \
        --enable-openssl \
        --enable-decoder=h264,hevc,av1,aac \
        --enable-parser=h264,hevc,av1,aac \
        --enable-demuxer=hls,h264,hevc,av1,mp4,m4v,mpegts \
        --enable-muxer=h264,hevc,av1,segment,matroska \
        --enable-bsf=extract_extradata \
        --enable-protocol=hls,http,https,file
EOT

RUN <<EOT
    make -j$(nproc)
    [ -e ./ffmpeg ] || {
        echo "Failed to build FFmpeg!"
        exit 1
    }
EOT


# Minimal product using live-built FFmpeg.
FROM heir AS minimal

USER ${CUID}:${CGID}

COPY --from=builder /tmp/ffmpeg_bin/ffmpeg /usr/bin/
COPY ./ctbcap-healthcheck /usr/bin/
COPY ./ctbcap /usr/bin/
