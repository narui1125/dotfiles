#!/bin/bash

tmux_url="https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz"

# すでにインストールされているか確認
if type "tmux" > /dev/null 2>&1 ; then
  echo "Already installed tmux ✔︎"
  exit 0
fi

# インストール
echo "Install tmux"

if type "brew" > /dev/null 2>&1 ; then
  # brewがつかえるならbrewでインストール
  brew install tmux
else
  # 依存
  sh ${BIN_DIR}/install-libevent.sh
  sh ${BIN_DIR}/install-ncurses.sh

  wget ${tmux_url} -O tmux.tar.xz
  mkdir tmux-temp
  tar xvf tmux.tar.xz -C tmux-temp --strip-components 1

  cd tmux-temp
  ./configure --prefix=${HOME}/.local --disable-shared

  make
  make install

  cd ..
  rm -rf tmux-temp
fi
