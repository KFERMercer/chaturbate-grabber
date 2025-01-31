<div align="center"><h1>Chaturbate-Grabber | CtbCap</h1></div>

<div align="center"><p>Chaturbate-Grabber/CtbCap is a Functional, Reliable, Easy to Use, yet Extremely Lightweight <strong>Recorder</strong>/<strong>Watchbot</strong> for Chaturbate|StripChat.</p></div>

<div align="center"><p><strong><a href="#official-ctbcap-container-registry">Official Container Registry</a></strong></p></div>

<div align="center"><h2>Key Advantages</h2></div>

- **Lightweight** - Written by most basic Shell Scripts with full POSIX compatibility. [Pythonless](https://m.media-amazon.com/images/I/71CmeuB3XXL._AC_UF1000,1000_QL80_.jpg), but far superior performance and energy efficiency.

- **All platforms available** - All functions are available with just require `curl` & `ffmpeg`.

    > Considering all the things mentioned and their platform versatility, this pretty much means you can run it on any device with only need internet connection: your phone, refrigerator, slipper, TV remote, [buttplug](https://news.berkeley.edu/wp-content/uploads/2017/10/SaguaroCardon750.jpg), even [your boss's wig](https://m.media-amazon.com/images/I/71+B81wFylL._SX466_.jpg).

- **Multifunction** - Auto Recording; Auto Monitoring; Auto Stopping; Large-Scale Deployment... Just find by yourself.

<div align="center"><h2>Usage | Deploy</h2></div>

### **Launch with One-Command:**

> Yeah, 1 Line, Just Crazy.

> **Termux is Supported.**

  - Open your whatever terminal & drop this:

    ```shell
    sh -c "$(curl -sL https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -h
    ```
    > Put the options after `@` . e.g:\
    > `sh -c <...curl...stuff...> @ -ef ~/rec your_mom`

    > You can also choose to download | upgrade CtbCap to your local:\
    > `curl -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap -o ctbcap && chmod +x ctbcap`\
    > After its done, run `./ctbcap` to launch CtbCap.

##

### **Docker Container (Recommend) :**

> If you're using such platforms that have good support for Docker or similar, I highly recommend to use this method: More serious; High-Availability; Everything runs in containers; Easily configures lot of chatrooms at the same time.

#### **Official CtbCap Container Registry:**

  - [Docker Hub](https://hub.docker.com/r/kfermercer/ctbcap): `docker pull kfermercer/ctbcap:latest`

  - [GitHub Package](https://github.com/KFERMercer/chaturbate-grabber/pkgs/container/ctbcap): `docker pull ghcr.io/kfermercer/ctbcap:latest`

| Platform | Available |
| :-: | :-: |
| x86 | ✅ |
| x86_64 | ✅ |
| armhf | ✅ |
| armv7 | ✅ |
| aarch64 | ✅ |
| loongarch64 | ✅ |
| ppc64le | ✅ |
| riscv64 | ✅ |
| s390x | ✅ |
> **CtbCap will always deliver on the [Compatibility Promise](https://news.berkeley.edu/wp-content/uploads/2017/10/SaguaroCardon750.jpg).**

#### **Run As Compose Daemon (Recommend)** :

  1. Custom your own compose file:

     ```shell
     curl -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/docker-compose.sample.yml -o ctbcap-compose.yml
     ```
     Then edit `./ctbcap-compose.yml` to configure.

  2. Deploy the compose daemon:

     ```shell
     # Run as background daemon:
     docker compose -f ./ctbcap-compose.yml up -d --remove-orphans

     # Check the status of the daemon:
     docker compose -f ./ctbcap-compose.yml logs -f

     # Stop & remove the daemon:
     docker compose -f ./ctbcap-compose.yml down --remove-orphans
     ```

#### **Run with Docker CLI:**

```shell
docker run -t --rm \
-u $(id -u):$(id -g) \
-v </path/to/recdir>:/save \
-v </path/to/logdir>:/log \
-e TZ=Asia/Shanghai \
-e <ARG>=<value> \
... \
kfermercer/ctbcap -h
```

> Option `-u <UID>:<GID>` allows you to specify the user (UID) and group (GID) that the container will run as. For example, `-u 65534:65534` will run the container as the 'nobody'. If you don't specify `-u`, the container will running as `1000:1000`.\
> `-u $(id -u):$(id -g)` Will use your current UID and GID.

> For more container arguments, see: [Container Arguments](#container-arguments)

#### **Update the Container Image:**

> See [Official CtbCap Container Registry](#official-ctbcap-container-registry).

### **Container Arguments:**

| Arguments | Value Type | Value Examples | Default | Necessary to Change |
| :-: | :-: | :- | :- | :-: |
| MODEL | Streamer's Username <br> or <br> Chatroom URL | `3rd8008` <br> `s1mp_L0r3-87` <br> `https://chaturbate.com/your_sister` <br> `https://stripchat.com/dicklessman` <br> ... | - | Yes |
| PLATFORM | `chaturbate` <br> or <br> `stripchat` | `chaturbate` <br> `stripchat` | `chaturbate` | Yes <br> if not Chaturbate |
| CUT_TIME | INT | `0` <br> `911` <br> `6324` <br> ... | `3600` | No |
| TZ | [TZ identifier](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) | `UTC` <br> `Asia/Shanghai` <br> `Africa/Harare` <br> ... | `UTC` | No <br> if you [live in Greenwich](https://www.royalgreenwich.gov.uk/info/200258/parking_transport_and_streets/810/find_a_public_toilet_in_royal_greenwich) |
| EDGING_MODE | Inactive if not `1` | `1` <br> `12306` <br> ... | `uncles make me pee white` | No |
| DEBUG_MODE | Inactive if not `1` | `1` <br> `-999` <br> `i was born from my sis` <br> ... | `your mom is so hot` | No |

<div align="center"><h2>Command Examples</h2></div>

#### Get help for commands:

```shell
# Local:
./ctbcap -h

# One-Command Run:
sh -c "$(curl -sL https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -h

# Docker CLI:
docker run -t --rm kfermercer/ctbcap -h
```

#### Simping your girl with nonstop:

```shell
# Local:
./ctbcap -f </path/to/recdir> your_girl

# One-Command Run:
sh -c "$(curl -sL https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -f </path/to/recdir> your_girl

# Docker CLI:
docker run -t --rm -u <UID>:<GID> -v </path/to/recdir>:/save kfermercer/ctbcap your_girl
```

#### Grab stream URL and generating FFmpeg command, but don't start recording:

```shell
# Local:
./ctbcap -l your_girl

# One-Command Run:
sh -c "$(curl -sL https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -l your_girl

# Docker CLI:
docker run -t --rm kfermercer/ctbcap -l your_girl
```

#### Simping your girl's stream and don't cut the file (cut the files every 3600 seconds by default) :

```shell
# Local:
./ctbcap -f </path/to/recdir> -c 0 your_girl

# One-Command Run:
sh -c "$(curl -sL https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -f </path/to/recdir> -c 0 your_girl

# Docker CLI:
docker run -t --rm -u <UID>:<GID> -v </path/to/recdir>:/save kfermercer/ctbcap -c 0 your_girl
```

#### Simping your girl's stream and cut the files by every 1800 seconds (30 min) :

```shell
# Local:
./ctbcap -f </path/to/recdir> -c 1800 your_girl

# One-Command Run:
sh -c "$(curl -sL https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -f </path/to/recdir> -c 1800 your_girl

# Docker CLI:
docker run -t --rm -u <UID>:<GID> -v </path/to/recdir>:/save kfermercer/ctbcap -c 1800 your_girl
```

#### Show version & runtime info:

```shell
# Local:
./ctbcap -v

# One-Command Run:
sh -c "$(curl -sL https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -v

# Docker CLI:
docker run -t --rm -u <UID>:<GID> kfermercer/ctbcap -v
```

<div align="center"><h2>Branch Description</h2></div>

[`master`](https://github.com/KFERMercer/chaturbate-grabber/tree/master): Main Branch. Use this branch for practical purposes.

[`dev`](https://github.com/KFERMercer/chaturbate-grabber/tree/dev): Development Branch. Includes latest features and optimizations. But it may be unstable.

##

<p align="center"><code>(. )( .)</code></p>
