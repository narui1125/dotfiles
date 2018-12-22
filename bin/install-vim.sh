#!/bin/bash

boost_url="https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz"

# すでにインストールされているか確認
if type "vim" > /dev/null 2>&1 ; then
  echo "Already installed Vim ✔︎"
else
  # インストール
  printf "\e[1;34mInstall Vim\e[0m\n"

  OS=$(uname)

  if [ "${OS}" == "Darwin" ]; then
    if type "brew" > /dev/null 2>&1 ; then
      # brewがつかえるならbrewでインストール
      brew install macvim --with-override-system-vim
    fi

  elif [ "${OS}" == "Linux" ]; then
    if type "brew" > /dev/null 2>&1 ; then
      # brewがつかえるならbrewでインストール
      brew install vim
    fi

  fi
fi
