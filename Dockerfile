#
# Copyright (C) 2019-2025 KFERMercer <https://github.com/KFERMercer>
#
# This Dockerfile will build a minimal FFmpeg tailored for ctbcap in same time.
# By doing so, it will significantly reduce the size of final image. ( 140MB -> 18MB )
# Requires 1GB of free space on file system to build.
#
# Make a normal build:
# `docker build --tag ctbcap ./`
#
# If you don't want to compile FFmpeg:
# `docker build --build-arg BUILD_TARGET=fat --target fat --tag ctbcap ./`
#

# Universal base for ctbcap and FFmpeg building.
FROM alpine:latest AS mother

RUN apk add --no-cache curl


# Big brother of the final product.
FROM mother AS heir

LABEL org.opencontainers.image.authors="KFERMercer <https://github.com/KFERMercer>"
LABEL org.opencontainers.image.description="A simple webcam capturer for CB & SC."
LABEL org.opencontainers.image.title="ctbcap"
LABEL org.opencontainers.image.url="https://github.com/KFERMercer/chaturbate-grabber/blob/master/README.md"
LABEL org.opencontainers.image.source="https://github.com/KFERMercer/chaturbate-grabber"
LABEL org.opencontainers.image.licenses="GPL-3.0-or-later"

RUN <<EOT
	apk add --no-cache tini tzdata
	mkdir -p -m 777 /save /log
EOT

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

COPY --chmod=755 <<-'EOF' /usr/bin/ctbcap-healthcheck
	#!/usr/bin/env sh

	[ "${DEBUG_MODE}" = "1" ] && set -x # Debug Mode

	[ -z "${MODEL}" ] || [ -z "$(ps -ef | grep 'ctbcap' | grep -v grep | head -n 1)" ] && {
		echo "No ctbcap process. Exit."
		exit 0
	}

	# Process ${MODEL}
	# TODO: Model may change their name, consider using realtime name.
	MODEL="$(basename "${MODEL}" | head -n 1 | tr '[:upper:]' '[:lower:]' | grep -oE '^[a-z0-9_-]+$')"
	[ -z "${MODEL}" ] && { echo "(ERROR) Invalid Username or URL!"; exit 1; }

	# Process ${PLATFORM}
	PLATFORM=$(echo "${PLATFORM}" | tr '[:upper:]' '[:lower:]')
	case ${PLATFORM} in
	chaturbate|ctb|cb) PLATFORM=chaturbate ;;
	stripchat|stc|sc|st) PLATFORM=stripchat ;;
	*)
		echo "(ERROR) Invalid Platform!"
		exit 1
	;;
	esac

	# Is directories writable?
	[ ! -w "${SAVE_PATH}" ] && { echo "(ERROR) SAVE_PATH is unwritable!"; exit 1; }
	[ "${LOG_PATH}" = 0 ] || {
		[ ! -w "${LOG_PATH}" ] && { echo "(ERROR) LOG_PATH is unwritable!"; exit 1; }
	}

	FFMPEG_PROCESS="$(ps -ef | grep -oE "[f]fmpeg.*-i.*.m3u8.*${MODEL}.*.mkv" 2>/dev/null | head -n 1)"
	# If has FFmpeg process...
	[ -n "${FFMPEG_PROCESS}" ] && {
		STREAM_URL="$(echo "${FFMPEG_PROCESS}" | grep -oE 'http[s]?://[^ ]+\.m3u8')"
		UA="$(ctbcap -v | grep '^UA: ' | sed 's|UA: ||')"
		[ -z "${UA}" ] && { echo "(ERROR) UA does not exist!"; exit 1; }

		# Has FFmpeg process, but m3u8 URL is unavailable --> err
		M3U8_RESPONSE="$(curl "${STREAM_URL}" -4 -L -s -A "${UA}" --compressed --retry 3 --retry-delay 2 2>/dev/null | tr -d '\r')"
		[ -z "${M3U8_RESPONSE}" ] && { echo "(ERROR) FFMPEG process did not exit correctly!"; exit 1; }
	}

	echo "Everything is OK!"
	exit 0
EOF

HEALTHCHECK \
	--interval=300s \
	--timeout=30s \
	--start-period=300s \
	--start-interval=300s \
	--retries=3 \
	CMD ["ctbcap-healthcheck"]

ENTRYPOINT ["tini", "-g", "--", "ctbcap"]

ARG BUILD_TARGET


# Fatty product using pre-built FFmpeg.
FROM heir AS fat

RUN <<EOT
	[ ${BUILD_TARGET} = "fat" ] || {
		echo "Skipping fat build"
		exit 0
	}
	apk add --no-cache ffmpeg
EOT

COPY ./ctbcap /usr/bin/

USER ${CUID}:${CGID}


# FFmpeg Build Machine.
FROM mother AS builder

RUN apk add --no-cache build-base gnupg openssl-dev nasm zlib-dev

RUN <<EOT
	cat <<-EOK | gpg --import # FFmpeg public PGP key
		-----BEGIN PGP PUBLIC KEY BLOCK-----

		mQENBE22rV0BCAC3DzRmA2XlhrqYv9HKoEvNHHf+PzosmCTHmYhWHDqvBxPkSvCl
		ipkbvJ4pBnVvcX6mW5QyKhspHm5j1X5ibe9Bt9/chS/obnIobmvF8shSUgjQ0qRW
		9c1aWOjvT26SxYQ1y9TmYCFwixeydGFHYKjAim+evGUccni5KMlfPoT3VTPtim78
		ufkr3E9Nco/Mobn/8APO0NmLEGWAM6ln/8J/c9h6a1QKnQyBqWfT0YnAaebafFaZ
		YwOtRdDG54VbJ4xwcHbCj5cKhTABk/QtBzDvnW4bG+uSpqdHbFZEY2JpURDuj/T3
		NudKQGzn0bYNpY1XY2l0pqs/btKHnBW0fVMjABEBAAG0NEZGbXBlZyByZWxlYXNl
		IHNpZ25pbmcga2V5IDxmZm1wZWctZGV2ZWxAZmZtcGVnLm9yZz6JATgEEwECACIF
		Ak22rV0CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJELQyLwTWdljYKxUH
		/1fqzl7SKie2g4t4PJbqUbkLuMsC+CP6gp0dcVZOHkuUYAoD3PM3iVxpLBVyKIXI
		g7wMSTAtlIcYnzhWIpnoCBes6/O2Mrq6xHgGeTp6CDcm3LmmSYR1f5KdD8KUaA+l
		c/M/1fEnwrSs/UGDk6R6iUmbqwxPsbozlOvmUHOLbDZBnKrk9XfAJdUhAuFACrSA
		T+KF1jniz0OfNGd23SaHWRCphoRW9pXDc5FfkdaueBUvBvGv19ZNcDhcxT3/u6z2
		DaUFC0rLWqk8obo951jVvi/zOhB94Pw6u1SLvcTq3V1q5URWJtgSbpih9VRqxUbQ
		NbXduKGzbHz6Vwpkupz4JRe5AQ0ETbatXQEIANjYrygJi/fn1nlSg5Mz0l9KHDm4
		yfWtaOrXUjJcyiGe4G0XXJLGh45qxJ0DOKzi9id+9W4jby+kKuzG9O6Vn0iDeODO
		aOGnz4ua7Vu6d0AbYfNXZPWge/GCodo/ZD/qri1tPkLmRtT/sniahwy6LruPNHfF
		SRoNIjwbcD/IL+EbY1pL1/IFSzEAA1ZZamgmHgB7o9pwDIkK6HuvHMR/Y5MsoMfV
		fWV3ZGtA6v9z51CvnHsHPsADRSnUp7aYtR412SiAO4XodMLTA92L3LxgYhI4ma7D
		XZ8jgKg4JkKO+DXmoU63HtRdq/HZjeXJKk1JGJF3zCvP3DyIzZ8LWIjN8t0AEQEA
		AYkBHwQYAQIACQUCTbatXQIbDAAKCRC0Mi8E1nZY2LS8B/0bMoUAl4X9D0WQbL4l
		U0czCIOKOsvbHpIxivjCnOQxU23+PV5WZdoCCpSuAHGv+2OHzhNrij++P9BNTJeQ
		skxdS9FH4MZwy1IRSPrxegSxbCUpBI1rd0Zf7qb9BNPrHPTueWFV1uExOSB2Apsv
		WrKo2D8mR0uZAPYfYl2ToFVoa5PR7/+ii9WiJr/flF6qm7hoLpI5Bm4VcZh2GPsJ
		9Vo/8x/qOGwtdWHqBykYloKsrwD4U69rjn+d9feLoPBRgoVroXWQttt0sUnyoudz
		+x8ETJgPoNK3kQoDagApj4qAt83Ayac3HzNIuEJ7LdvfINIOprujnJ9vH4n04XLg
		I4EZ
		=Rjbw
		-----END PGP PUBLIC KEY BLOCK-----
	EOK
	echo "FCF986EA15E6E293A5644F10B4322F04D67658D8:6:" | gpg --import-ownertrust
	rm -rf ~/.gnupg/public-keys.d/pubring.db.lock
EOT

WORKDIR /tmp/ffmpeg_source

RUN <<EOT
	FFMPEG_TARBALL="$( \
		curl -s -L -k --connect-timeout 5 --retry 3 \
			"https://ffmpeg.org/releases/" \
			| grep -oE 'ffmpeg-[0-9]+.*.tar.xz' \
			| sed 's|\.tar.xz.*||' \
			| sort -V \
			| tail -n 1 \
	).tar.xz"

	curl -L -k --connect-timeout 5 --retry 3 \
		"https://ffmpeg.org/releases/${FFMPEG_TARBALL}" \
		-o ffmpeg.tar.xz

	curl -L -k --connect-timeout 5 --retry 3 \
		"https://ffmpeg.org/releases/${FFMPEG_TARBALL}.asc" \
		-o ffmpeg.tar.xz.asc

	gpg --verify ffmpeg.tar.xz.asc ffmpeg.tar.xz || {
		echo "Failed to verify FFmpeg signature!"
		exit 1
	}

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
		--enable-zlib --enable-openssl \
		--enable-decoder=h264,hevc,av1,aac \
		--enable-parser=h264,hevc,av1,aac \
		--enable-demuxer=hls,mp4,m4v,mpegts \
		--enable-muxer=segment,matroska \
		--enable-protocol=hls,http,https,file \
		--enable-bsf=extract_extradata
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

COPY --from=builder /tmp/ffmpeg_bin/ffmpeg /usr/bin/
COPY ./ctbcap /usr/bin/

USER ${CUID}:${CGID}
