#!/bin/bash

homebrew_url="https://raw.githubusercontent.com/Homebrew/install/master/install"

# インストール
install_homebrew(){
  if type "brew" > /dev/null 2>&1 ; then
    echo "Already installed Homebrew ✔︎"
  else
    printf "\e[1;34mInstall homebrew\e[0m\n"

    /usr/bin/ruby -e "$(curl -fsSL ${homebrew_url})"
  fi
}

# 設定
configure_homebrew(){
  if type "brew" > /dev/null 2>&1 ; then
    printf "\e[1;34mConfigure homebrew\e[0m\n"
  else
    echo "Not installed homebrew. Skipped ✔︎"
  fi
}
