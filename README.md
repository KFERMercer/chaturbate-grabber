<div align="center"><h1>Chaturbate-Grabber | CtbCap</h1></div>

<div align="center"><p>Chaturbate-Grabber/CtbCap is a Functional, Reliable, Easy to Use, yet Extremely Lightweight <strong>Recorder</strong>/<strong>Watchbot</strong> for Chaturbate|StripChat.</p></div>

<div align="center"><h2>Key Advantages</h2></div>

- **Lightweight** - Written in most basic Shell Scripts to strive POSIX compatibility and energy efficiency.
  > Py is too heavy.

- **All platforms available** - All functions are available with just require `curl` & `ffmpeg`.
  > $0.1 Temu Phone? No problem.

- **Multifunction** - Auto Recording; Auto Monitoring; Auto Stopping; Large-Scale Deployment... Just find by yourself.
  > Lighter, yet more powerful.

<div align="center"><h2>Usage | Deploy</h2></div>

### **Launch with One-Command:**

**Open your whatever terminal & drop this:**

```shell
sh -c "$(curl -sL https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)" @ -h
```

> [!NOTE]
> Put the options after `@` like:\
> `sh -c <...curl...stuff...> @ -ef ~/rec your_mom`

> [!TIP]
> You can also choose to download/upgrade CtbCap to your local:\
> `curl -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap -o ctbcap && chmod +x ctbcap`\
> After its done, run `./ctbcap` to launch CtbCap.

> [!TIP]
> **Available on Termux.**

##

### **Docker Container (Recommend) :**

> [!NOTE]
> If you're using such platforms that have good support for Docker or similar, I highly recommend to use this method: More serious; High-Availability; Everything runs in containers; Easily configures lot of chatrooms at the same time.

#### **Official CtbCap Container Registry:**

| Registry | Docker CLI |
| :-: | :-: |
| [Docker Hub](https://hub.docker.com/r/kfermercer/ctbcap) | `docker pull kfermercer/ctbcap:latest` |
| [GitHub Package](https://github.com/KFERMercer/chaturbate-grabber/pkgs/container/ctbcap) | `docker pull ghcr.io/kfermercer/ctbcap:latest` |

<table>
<tr align="center">
<th>Platform</th>
<th>Build Status</th>
</tr>
<tr align="center">
<td>x86</td>
<td rowspan="9"><a href="https://github.com/KFERMercer/chaturbate-grabber/actions/workflows/Build-Push-Containers.yml"><img src="https://img.shields.io/github/actions/workflow/status/KFERMercer/chaturbate-grabber/Build-Push-Containers.yml"></a></td>
</tr>
<tr align="center">
<td>x86_64</td>
</tr>
<tr align="center">
<td>armhf</td>
</tr>
<tr align="center">
<td>armv7</td>
</tr>
<tr align="center">
<td>aarch64</td>
</tr>
<tr align="center">
<td>loongarch64</td>
</tr>
<tr align="center">
<td>ppc64le</td>
</tr>
<tr align="center">
<td>riscv64</td>
</tr>
<tr align="center">
<td>s390x</td>
</tr>
</table>

#### **Run As Compose Daemon (Recommend) :**

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
-e <VAR>=<value> \
... \
kfermercer/ctbcap -h
```

> [!NOTE]
> Option `-u <UID>:<GID>` allows you to specify the user (UID) and group (GID) that the container will run as. For example, `-u 0:0` will run the container as root.
> 
> - If you don't specify `-u`, the container will running as `1000:1000`.
> 
> - Use `-u $(id -u):$(id -g)` to use your current UID and GID.

> [!NOTE]
> For Container Variables, see: [Container Variables](#container-variables)

#### **Update the Container Image:**

See [Official CtbCap Container Registry](#official-ctbcap-container-registry).

#### **Container Variables:**

| Variables | Value Type | Value Examples | Default | Necessary to Change |
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
