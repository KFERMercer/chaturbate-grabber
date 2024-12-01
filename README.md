<br>

```text
     ┌─┐┬ ┬┌─┐┌┬┐┬ ┬┬─┐┌┐ ┌─┐┌┬┐┌─┐  ┌─┐┬─┐┌─┐┌┐ ┌┐ ┌─┐┬─┐
     │  ├─┤├─┤ │ │ │├┬┘├┴┐├─┤ │ ├┤───│ ┬├┬┘├─┤├┴┐├┴┐├┤ ├┬┘
     └─┘┴ ┴┴ ┴ ┴ └─┘┴└─└─┘┴ ┴ ┴ └─┘  └─┘┴└─┴ ┴└─┘└─┘└─┘┴└─
    8=====================================================D
                  Simping Stream from CB & SC
```

<br>

<div align="center"><h3><code>Chaturbate-Grabber</code> / <code>CtbCap</code> is a Easy to use, Extremely lightweight, yet Functional and Reliable <code>Chaturbate</code> & <code>StripChat</code> Recorder and watch bot.</h3></div>

<div align="center"><p><a href="#command-examples">Command Examples</a></p></div>

<br>

<div align="center"><h2>Key Advantages:</h2></div>

<br>

- ### **Lightweight.** [Pythonless](https://m.media-amazon.com/images/I/71CmeuB3XXL._AC_UF1000,1000_QL80_.jpg), but far superior Performance and Energy efficiency. Written by most basic `sh` syntax with full POSIX compatibility.

- ### **All platforms available.** All functions are available with just require `curl` & `ffmpeg`.

    #### Considering all the things mentioned and their platform versatility, this pretty much means you can run it on any device with only need internet connection: your Phone, Refrigerator, Slipper, TV remote, [Buttplug](https://news.berkeley.edu/wp-content/uploads/2017/10/SaguaroCardon750.jpg), even [your boss's wig](https://m.media-amazon.com/images/I/71+B81wFylL._SX466_.jpg).

- ### **Multifunction.** Auto Recording, Auto Monitoring, Auto Stopping, Large-scale deploy... Just find by yourself.

<br>

<div align="center"><h2>Usage | Deploy:</h2></div>

<br>

### One-Command to GO:

> Yeah, 1 Line, Just Crazy.

  1. Open your whatever terminal & drop this:

      ```shell
      sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -h
      ```
      > Options follows @. e.g `sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -el -f ~ yourwife`

<br>

##

<br>

### Raw Environment:

> Traditional way to run. All platforms available. - running directly on naked system environment, dependencies are loaded in the system.

> **Termux are Supported!!**

   1. Make sure your OS has `curl` and `ffmpeg` command.

   2. Clone this repo to your local:

      ```shell
      git clone https://github.com/KFERMercer/chaturbate-grabber.git && cd chaturbate-grabber
      ```

   3. Takeoff:

      ```shell
      ./ctbcap
      ```

<br>

##

<br>

### Docker Container (Recommend):

> if you're using `x86`- and such platforms that have good support for Docker and similar, I highly recommend this method. More serious, High-Availability, Everything runs in containers / easily configures a lot of models at the same time.

  1. Clone this repo to your local:

      ```shell
      git clone https://github.com/KFERMercer/chaturbate-grabber.git && cd chaturbate-grabber
      ```

  2. Install & trigger some Docker-like shit in your OS.

      ```shell
      # <https://www.google.com/search?q=please+tell+me+how+to+use+docker+I+will+do+anything>
      ```

  3. Build | Rebuild the docker image:

      ```shell
      docker build -t ctbcap ./
      ```

  4. RUN SIMP RUN!

     - Run once:

        ```shell
        docker run -it --rm \
        -v /path/to/recdir:/save \
        -v /path/to/logdir:/log \
        ctbcap -h
        ```
        > For more Container Parameters, See: [Container Parameters](#container-parameters)

     - **Run as Daemon (man!!)**:

       1. Custome your own docker-compose file:

          ```shell
          cat ./docker-compose.yml.sample > ./compose.yml
          ```
          Then edit `./compose.yml` to configure.

       2. Deploy the compose service:

          ```shell
          # Run by background daemon:
          docker compose up -d --remove-orphans

          # stop the daemon:
          docker compose down
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

  3. Rebuild image & upgrade container :

      ```shell
      # Rebuild image
      docker build -t ctbcap ./

      # Upgrade container
      docker compose up -d --remove-orphans
      ```

<br>

### Container Variables

|  Variable | Value Type | Value Examples | Default | Necessary to Change |
| :-: | :-: | :- | :-: | :-: |
| MODEL | Streamer's username <br> or <br> stream link | `tri80085` <br> `s1mp_L0r3-87` <br> `https://chaturbate.com/your_sister` <br> `https://stripchat.com/dicklessman` <br> ... | - | Yes |
| PLATFORM | `chaturbate`  <br> or <br> `stripchat` | `chaturbate` <br> `stripchat` | `chaturbate` | Yes <br> if not Chaturbate |
| TZ | [TZ identifier](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) | `UTC` <br> `Asia/Shanghai` <br> `Africa/Harare` <br> ... | `UTC` | No <br> if you [live in Greenwich](https://www.royalgreenwich.gov.uk/info/200258/parking_transport_and_streets/810/find_a_public_toilet_in_royal_greenwich) |
| SAVE_PATH | Path of stream saves | `/path/to/savedir` | `/recdir` | No <br> if runs in Docker |
| LOG_PATH | Path of logs | `/path/to/logdir` | `/logdir` | No <br> if runs in Docker |
| EDGING_MODE | Inactive if not <br> `1` | `1` <br> `0` <br> ... | `uncles make me pee white` | No <br> if simping <br> less ~5 sluts |
| DEBUG_MODE | Inactive if not <br> `1` | `1` <br> `-999` <br> `i was born form my sis` <br> `Whatever` | `your mom is so hot` | No |

<br>

<div align="center"><h2>Command Examples</h2></div>

<br>

> Get Help for Commands:

```shell
# Raw ENV
catbcap -h

# In One-Command run:
sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -h

# Docker run
docker run -it --rm ctbcap -h
```

<br>
<br>

> Simping your girl with nonstop:

```shell
# Raw ENV
catbcap -f /path/to/recdir your_girl

# In One-Command run:
sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -f /path/to/recdir your_girl

# Docker run
docker run -it --rm -v /path/to/recdir:/save ctbcap your_girl
```

<br>
<br>

> Just wanna check if your girl is online:

```shell
# Raw ENV
catbcap -l your_girl

# In One-Command run:
sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -l your_girl

# Docker run
docker run -it --rm ctbcap -l your_girl
```

##

<p align="center"><code>(. Y .)</code></p>
