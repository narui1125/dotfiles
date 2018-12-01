#!/bin/bash

zsh_url="https://sourceforge.net/projects/zsh/files/latest/download"

# すでにインストールされているか確認
if type "zsh" > /dev/null 2>&1 ; then
  echo "Already installed zsh ✔︎"
  exit 0
fi

# インストール
echo "\e[1;34mInstall zsh\e[0m\n"

if type "brew" > /dev/null 2>&1 ; then
  # brewがつかえるならbrewでインストール
  brew install zsh
else
  wget ${zsh_url} -O zsh.tar.xz
  mkdir zsh-temp
  tar xvf zsh.tar.xz -C zsh-temp --strip-components 1

  cd zsh-temp
  ./configure --prefix=${HOME}/.local --disable-shared

  make
  make install

  cd ..
  rm -rf zsh-temp
fi
