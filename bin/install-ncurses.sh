#!/bin/bash

ncurses_url="ftp://ftp.invisible-island.net/ncurses/ncurses.tar.gz"

wget ${ncurses_url} -O ncurses.tar.xz

mkdir ncurses-temp

tar xvf ncurses.tar.xz -C ncurses-temp --strip-components 1

cd ncurses-temp

./configure --prefix=$HOME/.local --disable-shared

make
make install

cd ..

rm -rf ncurses