#!/bin/bash

homebrew_url="https://raw.githubusercontent.com/Homebrew/install/master/install"
linuxbrew_url="https://github.com/Linuxbrew/brew"

# すでにインストールされているか確認
if type "brew" > /dev/null 2>&1 ; then
  echo "Already installed Homebrew ✔︎"
else
  # インストール
  printf "\e[1;34mInstall homebrew\e[0m\n"

  OS=$(uname)

  if [ "${OS}" == "Darwin" ]; then
    #macOS
    /usr/bin/ruby -e "$(curl -fsSL ${homebrew_url})"
  elif [ "${OS}" == "Linux" ]; then
    #Linux
    git clone ${linuxbrew_url} ~/.linuxbrew/Homebrew

    mkdir ~/.linuxbrew/bin
    ln -s ../Homebrew/bin/brew ~/.linuxbrew/bin

    eval $(~/.linuxbrew/bin/brew shellenv)

    test -d ~/.linuxbrew && export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
  else
    echo "${OS} is not supported"
  fi
fi
