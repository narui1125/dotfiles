#!/bin/bash

zsh_url="https://sourceforge.net/projects/zsh/files/latest/download"

# すでにインストールされているか確認
if type "zsh" > /dev/null 2>&1 ; then
  echo "Already installed zsh ✔︎"
  exit 0
fi

echo "Install zsh"

# TSUBAME
if [ "$1" == "TSUBAME" ]; then
  wget ${zsh_url} -O zsh.tar.xz
  mkdir zsh-temp
  tar xvf zsh.tar.xz -C zsh-temp --strip-components 1
  cd zsh-temp

  ./configure --prefix=$HOME/.local --disable-shared

  make
  make install

  cd ..
  rm -rf zsh-temp

# Local
elif [ "$1" == "Local" ]; then
  if [ ! type "zsh" > /dev/null 2>&1 ]; then
    sh install-homebrew.sh
  fi
  brew install zsh

  exit 0

# その他
else
  echo "Unkown Platform"

  exit 1
fi
