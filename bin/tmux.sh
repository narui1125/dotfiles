#!/bin/bash

tmux_url="https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz"

# インストール
install_tmux(){
  if type "tmux" > /dev/null 2>&1 ; then
    echo "Already installed tmux ✔︎"
  else
    printf "\e[1;34mInstall tmux\e[0m\n"

    # 依存
    source ${BIN_DIR}/libevent.sh
    install-libevent

    source ${BIN_DIR}/ncurses.sh
    install-ncurses

    curl -o tmux.tar.xz ${tmux_url}
    mkdir tmux-temp
    tar xvf tmux.tar.xz -C tmux-temp --strip-components 1

    cd tmux-temp
    ./configure --prefix=${HOME}/.local --disable-shared

    make
    make install

    cd ..
    rm -rf tmux-temp
  fi
}

# 設定
configure_tmux(){
  # PATH
  export PATH="$HOME/.local/bin:$PATH"

  if type "tmux" > /dev/null 2>&1 ; then
    printf "\e[1;34mConfigure tmux\e[0m\n"
  else
    echo "Not installed tmux. Skipped ✔︎"
  fi
}
