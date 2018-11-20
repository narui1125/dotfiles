#!/bin/bash

tmux_url="https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz"

# すでにインストールされているか確認
if type "tmux" > /dev/null 2>&1 ; then
  echo "Already installed tmux ✔︎"
  exit 0
fi

echo "Install tmux"

# TSUBAME
if [ "$1" == "TSUBAME" ]; then
  wget ${tmux_url} -O tmux.tar.xz
  mkdir tmux-temp
  tar xvf tmux.tar.xz -C tmux-temp --strip-components 1

  cd tmux-temp
  ./configure --prefix=$HOME/.local --disable-shared

  make
  make install

  cd ..
  rm -rf tmux-temp

  exit 0

# Local
elif [ "$1" == "Local" ]; then
  if [ ! type "brew" > /dev/null 2>&1 ]; then
    sh install-homebrew.sh
  fi
  brew install tmux

  exit 0

# その他
else
  echo "Unkown Platform"

  exit 1
fi
