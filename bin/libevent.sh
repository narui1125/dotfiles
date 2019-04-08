#!/bin/bash

libevent_url="https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz"

# インストール
install_libevent(){
  if [ -f "${HOME}/.local/lib/libevent.a" ]; then
    echo "Already installed libevent ✔︎"
  else
    printf "\e[1;34mInstall libevent\e[0m\n"

    curl -oL libevent.tar.gz ${libevent_url}
    mkdir libevent-temp
    tar -xvf libevent.tar.gz -C libevent-temp --strip-components 1

    cd libevent-temp
    ./configure --prefix=${HOME}/.local --disable-shared

    make
    make install

    cd ..
    rm -rf libevent-temp
  fi
}

# 設定
configure_libevent(){
  if [ -f "${HOME}/.local/lib/libevent.a" ]; then
    printf "\e[1;34mConfigure libevent\e[0m\n"
  else
    echo "Not installed libevent. Skipped ✔︎"
  fi
}
