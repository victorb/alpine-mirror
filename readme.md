## alpine-mirror

> Provides mirrors for packages in 3.4 version of Alpine-linux

## Usage

### Mirror

To update the mirror, use the `./mirror.sh` script.

It'll do the following steps:

* Create lock file
* Create a `downloads/` directory relative to `mirror.sh`
* Add that directory to IPFS

### Use with Alpine-linux

Once you have a hash, you can use it by executing the following command:

```
export HASH=QmRsvEpJggeu4HhoafzRFobV4sbwVVTXMrdb2p8XWv7bCS
RUN sed -i -- "s/http:\/\/dl-cdn.alpinelinux.org\/alpine/https:\/\/ipfs.io\/ipfs\/$HASH/g" /etc/apk/repositories
```

That'll use the public gateways. If you have an IPFS daemon running, you can change ipfs.io to localhost:8000

### Test

To make sure you mirror is working, you can use the `./test.sh` script

It'll do the following steps:

* Create docker image based on the `Dockerfile`
* Run the installed bash program with echo
* If you see `Everything is working just fine` in the bottom, everything is working just fine
* Otherwise, you should open up an issue here: github.com/victorbjelkholm/alpine-mirror/issues/new

## License

MIT 2017 Victor Bjelkholm
