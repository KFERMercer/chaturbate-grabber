# 
# This Dockerfile will build a minimal FFmpeg tailored for ctbcap.
# By doing so, it will significantly reduce the size of final image. ( 140MB -> 18MB )
# Requires 1GB of free space on file system to build.
# 
# If you don't want to compile FFmpeg:
# `docker build --build-arg BUILD_TARGET=fat --target fat -t ctbcap .`
# 

FROM alpine:latest AS mother

RUN apk add --no-cache curl tini tzdata

RUN <<EOT
    mkdir -p /save /log
    chmod 777 /save /log
EOT

FROM mother AS fat

ARG BUILD_TARGET

RUN <<EOT
    [ ${BUILD_TARGET} = "fat" ] || {
        echo "Skipping fat build"
        exit 0
    }
    apk add --no-cache ffmpeg
EOT

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

COPY ./ctbcap-healthcheck /usr/bin/
COPY ./ctbcap /usr/bin/

ENTRYPOINT ["tini", "-g", "--", "ctbcap"]

FROM mother AS builder

RUN <<EOT
    apk add --no-cache \
        build-base coreutils curl \
        openssl-dev nasm zlib-dev
EOT

WORKDIR /tmp/ffmpeg_source

RUN <<EOT
    curl "https://ffmpeg.org/releases/"$( \
        curl -s -L "https://ffmpeg.org/releases/" \
            | grep -oE 'ffmpeg-[0-9]+.*.tar.xz' \
            | sed 's|\.tar.xz.*||' \
            | sort \
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

RUN make -j$(nproc)

FROM mother AS minimal

COPY --from=builder /tmp/ffmpeg_bin/ffmpeg /usr/bin/

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

COPY ./ctbcap-healthcheck /usr/bin/
COPY ./ctbcap /usr/bin/

ENTRYPOINT ["tini", "-g", "--", "ctbcap"]
