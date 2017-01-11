#!/bin/sh

set -ex

# make sure we never run 2 rsync at the same time
lockfile="/tmp/alpine-mirror.lock"
if [ -z "$flock" ] ; then
	exec env flock=1 flock -n $lockfile "$0" "$@"
fi

src=rsync://rsync.alpinelinux.org/alpine/v3.4
dest=downloads

mkdir -p "$dest"
/usr/bin/rsync \
	--archive \
	--update \
	--info=progress2 \
	--hard-links \
	--timeout=600 \
	"$src" "$dest"

ipfs add -r --local downloads
