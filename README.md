```
┌─┐┬ ┬┌─┐┌┬┐┬ ┬┬─┐┌┐ ┌─┐┌┬┐┌─┐  ┌─┐┬─┐┌─┐┌┐ ┌┐ ┌─┐┬─┐
│  ├─┤├─┤ │ │ │├┬┘├┴┐├─┤ │ ├┤───│ ┬├┬┘├─┤├┴┐├┴┐├┤ ├┬┘
└─┘┴ ┴┴ ┴ ┴ └─┘┴└─└─┘┴ ┴ ┴ └─┘  └─┘┴└─┴ ┴└─┘└─┘└─┘┴└─
8===================================================D
A shell script to cpture live stream from chaturbate.
```

## Usage：

First of all, clone the repo to your local:

```shell
git clone https://github.com/KFERMercer/chaturbate-grabber.git && cd chaturbate-grabber
```

Now you neeo choose whether to use docker or a host environment,

I suggest you use [docker](#docker-recommended).

### Docker (recommended):

First install some Docker-like products.

Custome your own docker-compose file:

```shell
cat ./docker-compose.yml.sample > ./compose.yml
```

Then edit `./compose.yml` to configure.

Deploy the compose service:

```shell
# If you wish to run in the front of the terminal:
docker compose up

# If you want run and create to background daemon:
docker compose up -d
```

Unload the compose service:

```shell
docker compose down
```

### Host environment:

First make sure your linux shell is `bash`, and get install `git`, `ffmpeg`, `curl`. Follow this command to install them:

```shell
# apt: 
apt-get install -y git ffmpeg curl
# yum:
yum -y install git ffmpeg curl
# apk:
apk add install git ffmpeg curl
```

Use the following command to run:

```shell
./ctbcap <model-name>
```

If you just want to get the m3u link of stream:

```shell
./ctbcap <your-favorite-model-name> -s
```

You can add this script to system path:

```shell
ln -s ~/chaturbate-grabber/ctbcap /sbin/ctbcap
```

Next time you can simply run `ctbcap` to execute the script.

#### If you don't want to leave your trail on localmachine:

```shell
    bash <(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)
# ^ There's a space at the beginning.
```

### Get follow-up updates:

Go to local git repo:

```shell
cd chaturbate-grabber
```

Update repo to newest commit:

```shell
git pull
```

Restart the compose service (when use docker):

```shell
docker compose down

docker compose up -d
```

---

### have fun : )
