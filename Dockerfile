# docker build -t ctbcap .
# docker run -it --rm -v /path/to/cap:/cap ctbcap
# docker system prune

FROM bash:latest

RUN apk add ffmpeg curl wget

COPY ctbcap /usr/sbin/

ENV LOG_PATH    "/log"
ENV SAVE_PATH   "/cap"

USER 1000:1000

ENTRYPOINT [ "ctbcap" ]

# CMD [ "bash" ]
