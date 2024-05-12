# docker build -t ctbcap .
# docker run -it --rm -v /path/to/cap:/cap ctbcap
# docker system prune

FROM bash:latest

RUN apk add --no-cache tzdata ffmpeg curl wget

COPY ctbcap /usr/sbin/

# see <https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List>
ENV TZ          "UTC"

ENV LOG_PATH    "/log"
ENV SAVE_PATH   "/save"

USER 1000:1000

ENTRYPOINT [ "ctbcap" ]

# CMD [ "bash" ]
