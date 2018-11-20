#!/bin/bash

tmux_url="https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz"

if type "tmux" > /dev/null 2>&1 ; then
  echo "Already installed tmux ✔︎"
else
  echo "Install tmux"

  wget ${tmux_url} -O tmux.tar.xz
  mkdir tmux-temp
  tar xvf tmux.tar.xz -C tmux-temp --strip-components 1

  cd tmux-temp
  ./configure --prefix=$HOME/.local --disable-shared

  make
  make install

  cd ..
  rm -rf tmux-temp
fi
