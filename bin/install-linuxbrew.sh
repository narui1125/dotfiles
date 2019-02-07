#!/bin/bash

linuxbrew_url="https://github.com/Linuxbrew/brew"

# すでにインストールされているか確認
if type "brew" > /dev/null 2>&1 ; then
  echo "Already installed linuxbrew ✔︎"
else
  # インストール
  printf "\e[1;34mInstall linuxbrew\e[0m\n"

  #Linux
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

  # Path
  eval $(~/.linuxbrew/bin/brew shellenv)
fi
