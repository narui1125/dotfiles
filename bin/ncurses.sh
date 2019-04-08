#!/bin/bash

ncurses_url="https://invisible-mirror.net/archives/ncurses/ncurses.tar.gz"

# インストール
install_ncurses(){
  if [ -f "${HOME}/.local/lib/libncurses.a" ]; then
    echo "Already installed ncurses ✔︎"
  else
    printf "\e[1;34mInstall ncurses\e[0m\n"

    curl -L -o ncurses.tar.gz ${ncurses_url}
    mkdir ncurses-temp
    tar -xvf ncurses.tar.gz -C ncurses-temp --strip-components 1

    cd ncurses-temp
    ./configure --prefix=${HOME}/.local --disable-shared

    make
    make install

    cd ..
    rm -rf ncurses-temp
    rm -rf ncurses.tar.gz
  fi
}

# 設定
configure_ncurses(){
  if [ -f "${HOME}/.local/lib/libncurses.a" ]; then
    printf "\e[1;34mConfigure ncurses\e[0m\n"
  else
    echo "Not installed ncurses. Skipped ✔︎"
  fi
}
