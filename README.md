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

### Docker (Recommended. CaaS, High Availability.):

1. Install some Docker-like product to your systeam.

2. Build (or rebuild after update) the docker image:

    ```shell
    docker build -t ctbcap .
    ```

3. Custome your own docker-compose file:

    ```shell
    cat ./docker-compose.yml.sample > ./compose.yml
    ```

    Then edit `./compose.yml` to configure.

4. Deploy the compose service:

    ```shell
    # build or rebuild the services:
    docker compose build

    # If you wish to run in the front of the terminal:
    docker compose up

    # If you want run and create to background daemon:
    docker compose up -d

    # Unload the compose service:
    docker compose down
    ```

### Host environment:

1. Make sure your shell is `bash`, and get install `git`, `ffmpeg`, `curl`. Follow this command to install them:

    ```shell
    # apt: 
    apt-get install -y git ffmpeg curl
    # yum:
    yum -y install git ffmpeg curl
    # apk:
    apk add install git ffmpeg curl
    ```

2. Use the following command to run:

    ```shell
    SAVE_PATH=/path/to/savedir \
    LOG_PATH=/path/to/logdir \
    ./ctbcap <model-name>
    ```

3. If you just want to get the m3u link of stream:

    ```shell
    ./ctbcap <your-favorite-model-name> -s
    ```

    You can add this script to system path:

    ```shell
    ln -s ~/chaturbate-grabber/ctbcap /sbin/ctbcap
    ```

    Then next time you can run the `ctpcap` directly without going into repo.

    #### If you don't want to leave your trail on localmachine:

    ```shell
        bash <(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap) <model-name>
    # ^ Should has space at the beginning.
    ```

### Get follow-up updates:

Go to local git repo:

```shell
cd chaturbate-grabber
```

Update repo to newest commit:

```shell
git pull --rebase
```

---

### have fun : )
