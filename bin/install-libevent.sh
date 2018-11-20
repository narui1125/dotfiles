#!/bin/bash

libevent_url="https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz"

wget ${libevent_url} -O libevent.tar.xz

mkdir libevent-temp

tar xvf libevent.tar.xz -C libevent-temp --strip-components 1

cd libevent-temp

./configure --prefix=$HOME/.local --disable-shared

make
make install

cd ..

rm -rf libevent-temp