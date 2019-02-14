#!/bin/bash

brew_sh="https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh"

# すでにインストールされているか確認
if type "brew" > /dev/null 2>&1 ; then
  echo "Already installed linuxbrew ✔︎"
else
  # インストール
  printf "\e[1;34mInstall linuxbrew\e[0m\n"

  sh -c "$(curl -fsSL ${brew_sh})"

  # Path
  eval $(~/.linuxbrew/bin/brew shellenv)
fi
