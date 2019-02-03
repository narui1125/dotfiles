#!/bin/bash

linuxbrew_url="https://github.com/Linuxbrew/brew"

# すでにインストールされているか確認
if type "brew" > /dev/null 2>&1 ; then
  echo "Already installed linuxbrew ✔︎"
else
  # インストール
  printf "\e[1;34mInstall linuxbrew\e[0m\n"

  #Linux
  git clone ${linuxbrew_url} ~/.linuxbrew/Homebrew

  mkdir ~/.linuxbrew/bin
  ln -s ../Homebrew/bin/brew ~/.linuxbrew/bin

  eval $(~/.linuxbrew/bin/brew shellenv)

  test -d ~/.linuxbrew && export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
fi
