#!/bin/bash

zsh_url="https://sourceforge.net/projects/zsh/files/latest/download"

wget ${zsh_url} -O zsh.tar.xz

mkdir zsh-temp

tar xvf zsh.tar.xz -C zsh-temp --strip-components 1

cd zsh-temp

./configure --prefix=$HOME/.local --disable-shared

make
make install

cd ..

rm -rf zsh-temp