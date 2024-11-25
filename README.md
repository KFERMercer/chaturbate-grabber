```
 ┌─┐┬ ┬┌─┐┌┬┐┬ ┬┬─┐┌┐ ┌─┐┌┬┐┌─┐  ┌─┐┬─┐┌─┐┌┐ ┌┐ ┌─┐┬─┐
 │  ├─┤├─┤ │ │ │├┬┘├┴┐├─┤ │ ├┤───│ ┬├┬┘├─┤├┴┐├┴┐├┤ ├┬┘
 └─┘┴ ┴┴ ┴ ┴ └─┘┴└─└─┘┴ ┴ ┴ └─┘  └─┘┴└─┴ ┴└─┘└─┘└─┘┴└─
8=====================================================D
              Simping Stream from CB & SC
```

# Usage：

  1. ### Clone this repo to your local:

      ```shell
      git clone https://github.com/KFERMercer/chaturbate-grabber.git && cd chaturbate-grabber
      ```

  2. ### Install & trigger some Docker-like shit in your OS.

      ```shell
      # <https://www.google.com/search?q=please+tell+me+how+to+use+docker+I+will+do+anything>
      ```

  3. ### Build (or rebuild after update) the docker image:

      ```shell
      docker build -t ctbcap ./
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
          docker compose up -d --remove-orphans

          # stop the daemon:
          docker compose down
          ```

     - ### Run once:

        ```shell
        docker run -it --rm \
        -e TZ=Asia/Shanghai \
        -e PLATFORM=chaturbate \
        -v /path/to/viddir:/save \
        -v /path/to/logdir:/log \
        ctbcap:latest [options...] <username or url>
        ```

        > Run `docker run -it --rm ctbcap:latest --help` to get help for commands.

     - ### Runs in non-container env:

       1. Make sure your shell is `bash`, and `curl`, `ffmpeg` is installed.

       2. Use the following command to run:

          ```shell
          SAVE_PATH=/path/to/savedir \
          LOG_PATH=/path/to/logdir \
          PLATFORM=chaturbate \
          ctbcap [options...] <username or url>
          ```

          > Run `ctbcap --help` to get help for commands.


### Container Variables

|  Variable | Value Type | Value Examples | Default | Necessary to Change |
| :-: | :-: | :- | :-: | :-: |
| MODEL | Streamer's username <br> or <br> stream link | `tri80085` <br> `s1mp_L0r3-87` <br> `https://chaturbate.com/your_sister` <br> `https://stripchat.com/dicklessman` <br> ... | - | Yes |
| PLATFORM | `chaturbate`  <br> or <br> `stripchat` | `chaturbate` <br> `stripchat` | `chaturbate` | Yes <br> if not Chaturbate |
| TZ | [TZ identifier](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) | `UTC` <br> `Asia/Shanghai` <br> `Africa/Harare` <br> ... | `UTC` | No <br> if you [live in Greenwich](https://www.royalgreenwich.gov.uk/info/200258/parking_transport_and_streets/810/find_a_public_toilet_in_royal_greenwich) |
| SAVE_PATH | Path of stream saves | `/path/to/savedir` | `/viddir` | No <br> if runs in Docker |
| LOG_PATH | Path of logs | `/path/to/logdir` | `/logdir` | No <br> if runs in Docker |
| EDGING_MODE | Inactive if not <br> `1` | `1` <br> `0` <br> ... | `uncles make me pee white` | No <br> if simping <br> less ~5 sluts |
| DEBUG_MODE | Inactive if not <br> `1` | `1` <br> `-999` <br> `i was born form my sis` <br> `Whatever` | `your mom is so hot` | No |

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

<p align="right"><code>(. Y .)</code></p>
