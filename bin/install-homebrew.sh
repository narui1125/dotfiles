#!/bin/bash

homebrew_url="https://raw.githubusercontent.com/Homebrew/install/master/install"

# すでにインストールされているか確認
if type "brew" > /dev/null 2>&1 ; then
  echo "Already installed Homebrew ✔︎"
else
  # インストール
  printf "\e[1;34mInstall homebrew\e[0m\n"
  
  /usr/bin/ruby -e "$(curl -fsSL ${homebrew_url})"
fi
