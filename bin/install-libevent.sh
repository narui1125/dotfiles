#!/bin/bash

libevent_url="https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz"

echo "\e[1;34mInstall libevent\e[0m\n"

wget ${libevent_url} -O libevent.tar.xz

mkdir libevent-temp

tar xvf libevent.tar.xz -C libevent-temp --strip-components 1

cd libevent-temp

./configure --prefix=${HOME}/.local --disable-shared

make
make install

cd ..

rm -rf libevent-temp
