```
┌─┐┬ ┬┌─┐┌┬┐┬ ┬┬─┐┌┐ ┌─┐┌┬┐┌─┐  ┌─┐┬─┐┌─┐┌┐ ┌┐ ┌─┐┬─┐
│  ├─┤├─┤ │ │ │├┬┘├┴┐├─┤ │ ├┤───│ ┬├┬┘├─┤├┴┐├┴┐├┤ ├┬┘
└─┘┴ ┴┴ ┴ ┴ └─┘┴└─└─┘┴ ┴ ┴ └─┘  └─┘┴└─┴ ┴└─┘└─┘└─┘┴└─
8===================================================D
A shell script to cpture live stream from chaturbate.
```

## Usage：

By first, make sure your linux shell is `bash`, at the same time, you need `git`, `ffmpeg`, `curl` and `screen`. Follow the command below to install them:

```shell
# apt: 
apt-get install -y git ffmpeg curl screen
# yum:
yum -y install git ffmpeg curl screen
```

Then use git to get the script library, which is convenient for subsequent updates:

```shell
git clone https://github.com/KFERMercer/chaturbate-grabber.git ~/chaturbate-grabber
```

If necessary, you can modify [line 16](https://github.com/KFERMercer/chaturbate-grabber/blob/master/ctbcap#L16), [line 19](https://github.com/KFERMercer/chaturbate-grabber/blob/master/ctbcap#L19), [line 22](https://github.com/KFERMercer/chaturbate-grabber/blob/master/ctbcap#L22) and [line 25](https://github.com/KFERMercer/chaturbate-grabber/blob/master/ctbcap#L25) in the `./ctbcap` file to modify the default log file path, the path saved after capture, the default model, and the default server node code.

After that, you can use the following command to run:

```shell
~/chaturbate-grabber/ctbcap <your-favorite-model-name>
```

If you just want to get the link of stream:

```shell
~/chaturbate-grabber/ctbcap <your-favorite-model-name> -s
```

You can add this script to system path:

```shell
ln -s ~/chaturbate-grabber/ctbcap /sbin/ctbcap
```

Then you can simply run `ctbcap` to execute the script.

### If you don't want to leave your trail:

```shell
 bash <(curl -s -L https://raw.githubusercontent.com/KFERMercer/chaturbate-grabber/master/ctbcap)
```

The above command has a space at the beginning.

---

### have fun : )
