```
┌─┐┬ ┬┌─┐┌┬┐┬ ┬┬─┐┌┐ ┌─┐┌┬┐┌─┐  ┌─┐┬─┐┌─┐┌┐ ┌┐ ┌─┐┬─┐
│  ├─┤├─┤ │ │ │├┬┘├┴┐├─┤ │ ├┤───│ ┬├┬┘├─┤├┴┐├┴┐├┤ ├┬┘
└─┘┴ ┴┴ ┴ ┴ └─┘┴└─└─┘┴ ┴ ┴ └─┘  └─┘┴└─┴ ┴└─┘└─┘└─┘┴└─
8===================================================D
             Simping Stream from CB & SC
```

# Usage：

  1. ### Clone the repo to your local:

      ```shell
      git clone https://github.com/KFERMercer/chaturbate-grabber.git && cd chaturbate-grabber
      ```

  2. ### Install & trigger some Docker-like shit in your OS.

      ```shell
      # <https://www.google.com/search?q=please+tell+me+how+to+use+docker+I+will+do+anything>
      ```

  3. ### Build (or rebuild after update) the docker image:

      ```shell
      docker build -t ctbcap .
      ```

  4. ### RUN SIMP RUN!

     - ### Run as daemon:

       1. ### Custome your own docker-compose file:

          ```shell
          cat ./docker-compose.yml.sample > ./compose.yml
          ```
          Then edit `./compose.yml` to configure.

       2. ### Deploy the compose service:

          ```shell
          # Run by background daemon:
          docker compose up -d

          # stop the daemon:
          docker compose down
          ```

     - ### Run once:

        ```shell
        docker run -it --rm \
        -e TZ=Asia/Shanghai \
        -e PLATFORM=chaturbate <or stripchat> \
        -v /path/to/viddir:/save \
        -v /path/to/logdir:/log \
        ctbcap:latest <modelname> <--stream>[m3u8 url only]
        ```
     - ### Run in non-container env:

       1. Make sure your shell is `bash`, and `curl`, `ffmpeg` is installed.

       2. Use the following command to run:

          ```shell
          SAVE_PATH=/path/to/savedir \
          LOG_PATH=/path/to/logdir \
          PLATFORM=chaturbate <or stripchat> \
          ./ctbcap <modelname> <--stream>[m3u8 url only]
          ```

### Follow update:

1. Go to local repo:

    ```shell
    cd chaturbate-grabber
    ```

2. Update repo to newest commit:

    ```shell
    git pull --rebase
    ```

- **Once successfully update, you all need to [rebuild the image](#build-or-rebuild-after-update-the-docker-image).**

---

`(. )( .)`
