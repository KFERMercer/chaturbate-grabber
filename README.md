<div align="center"><h1>Chaturbate-Grabber - Simping Stream from CB & SC</h1></div>

<div align="center"><p><code>Chaturbate-Grabber</code> | <code>CtbCap</code> is a functional, reliable, yet extremely easy to use and lightweight <strong>Recorder</strong> and <strong>Watch bot</strong> for <code>Chaturbate</code> & <code>StripChat</code>.</p></div>

<div align="center"><p><strong><a href="#command-examples">Command Examples</a></strong></p></div>

<div align="center"><h2>Key Advantages:</h2></div>

- **Lightweight** - Written by most basic Shell Scripts with full POSIX compatibility. [Pythonless](https://m.media-amazon.com/images/I/71CmeuB3XXL._AC_UF1000,1000_QL80_.jpg), but far superior performance and energy efficiency.

- **All platforms available** - All functions are available with just require `curl` & `ffmpeg`.

    Considering all the things mentioned and their platform versatility, this pretty much means you can run it on any device with only need internet connection: your phone, refrigerator, slipper, TV remote, [buttplug](https://news.berkeley.edu/wp-content/uploads/2017/10/SaguaroCardon750.jpg), even [your boss's wig](https://m.media-amazon.com/images/I/71+B81wFylL._SX466_.jpg).

- **Multifunction** - Auto Recording; Auto Monitoring; Auto Stopping; Large-Scale Deploy... Just find by yourself.

<div align="center"><h2>Usage | Deploy:</h2></div>

### One-Command to GO:

> Yeah, 1 Line, Just Crazy.

  1. Open your whatever terminal & drop this:

      ```shell
      sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -h
      ```
      > Options follows @. e.g `sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -el -f ~ yourwife`

      > **Termux is Supported.**

##

### Raw Environment:

> Traditional way to run. All platforms available - Running directly on naked system environment, dependencies will load into your OS.

> **Termux is Supported.**

   1. Make sure your OS has `curl` and `ffmpeg` command.

   2. Clone this repo to your local:

      ```shell
      git clone https://github.com/KFERMercer/chaturbate-grabber.git && cd chaturbate-grabber
      ```

   3. Launch:

      ```shell
      ./ctbcap
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

##

### Docker Container (Recommend):

> If you're using such platforms that have good support for Docker or similar, I highly recommend to use this method: More serious; High-Availability; Everything runs in containers; Easily configures lot of chatrooms at the same time.

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
      > It will build a minimal FFmpeg tailored for ctbcap on-the-fly in Docker for minimizes the image size. (~ 18MB)

      > You can also chose Pre-built FFmpeg from Alpine repos to avoids compilation on low-power devices. But it will increases image size significantly. (~ 140MB)\
      > Use this command to use Pre-built FFmpeg:\
      > `docker build --build-arg BUILD_TARGET=fat --target fat -t ctbcap ./`

  4. RUN SIMP RUN!

     - Run once:

        ```shell
        docker run -t --rm \
        -v </path/to/recdir>:/save \
        -v </path/to/logdir>:/log \
        -e TZ=UTC \
        ctbcap -h
        ```
        > For more Container Arguments, See: [Container Arguments](#container-arguments)

     - **Run as Daemon (man!!)**:

       1. Custom your own docker-compose file:

          ```shell
          cat ./docker-compose.sample.yml > ./compose.yml
          ```
          Then edit `./compose.yml` to configure.

       2. Deploy the compose service:

          ```shell
          # Run by background daemon:
          docker compose up -d --remove-orphans

          # stop the daemon:
          docker compose down --remove-orphans
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

### Container Arguments:

|  Arguments | Value Type | Value Examples | Default | Necessary to Change |
| :-: | :-: | :- | :- | :-: |
| MODEL | Streamer's username <br> or <br> chatroom url | `tri80085` <br> `s1mp_L0r3-87` <br> `https://chaturbate.com/your_sister` <br> `https://stripchat.com/dicklessman` <br> ... | - | Yes |
| PLATFORM | `chaturbate`  <br> or <br> `stripchat` | `chaturbate` <br> `stripchat` | `chaturbate` | Yes <br> if not Chaturbate |
| CUT_TIME | INT | `0` <br> `911` <br> `6324` <br> ... | `3600` | No |
| TZ | [TZ identifier](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) | `UTC` <br> `Asia/Shanghai` <br> `Africa/Harare` <br> ... | `UTC` | No <br> if you [live in Greenwich](https://www.royalgreenwich.gov.uk/info/200258/parking_transport_and_streets/810/find_a_public_toilet_in_royal_greenwich) |
| EDGING_MODE | Inactive if not `1` | `1` <br> `12306` <br> ... | `uncles make me pee white` | No |
| DEBUG_MODE | Inactive if not `1` | `1` <br> `-999` <br> `i was born form my sis` <br> ... | `your mom is so hot` | No |

<div align="center"><h2>Command Examples</h2></div>

> Get Help for Commands:

```shell
# Raw ENV
./ctbcap -h

# In One-Command run:
sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -h

# Docker run
docker run -t --rm ctbcap -h
```

<br>

> Simping your girl with nonstop:

```shell
# Raw ENV
./ctbcap -f </path/to/recdir> your_girl

# In One-Command run:
sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -f </path/to/recdir> your_girl

# Docker run
docker run -t --rm -v </path/to/recdir>:/save ctbcap your_girl
```

<br>

> Simping your girl's stream and don't cut the file (cut the files every 3600 seconds by default):

```shell
# Raw ENV
./ctbcap -f </path/to/recdir> -c 0 your_girl

# In One-Command run:
sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -f </path/to/recdir> -c 0 your_girl

# Docker run
docker run -t --rm -v </path/to/recdir>:/save ctbcap -c 0 your_girl
```

<br>

> Simping your girl's stream and cut the files by every 1800 seconds (30 min):

```shell
# Raw ENV
./ctbcap -f </path/to/recdir> -c 1800 your_girl

# In One-Command run:
sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -f </path/to/recdir> -c 1800 your_girl

# Docker run
docker run -t --rm -v </path/to/recdir>:/save ctbcap -c 1800 your_girl
```

<br>

> Just wanna check if your girl is online:

```shell
# Raw ENV
./ctbcap -l your_girl

# In One-Command run:
sh -c "$(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -l your_girl

# Docker run
docker run -t --rm ctbcap -l your_girl
```

<br>

> Check the status of compose daemons:

```shell
# All daemons:
docker compose -f </path/to/local/repo/compose.yml> logs -f

# Single model:
docker compose -f </path/to/local/repo/compose.yml> logs -f your_girl
```

<div align="center"><h2>Branch Description</h2></div>

[`master`](https://github.com/KFERMercer/chaturbate-grabber/tree/master): Main Branch. Use this branch for practical purposes.

[`dev`](https://github.com/KFERMercer/chaturbate-grabber/tree/dev): Development Branch. Includes latest features and optimizations. But it may be unstable.

##

<p align="center"><code>(. Y .)</code></p>
