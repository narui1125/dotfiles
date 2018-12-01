#!/bin/bash

homebrew_url="https://raw.githubusercontent.com/Homebrew/install/master/install"
linuxbrew_url="https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh"

# すでにインストールされているか確認
if type "brew" > /dev/null 2>&1 ; then
  echo "Already installed Homebrew ✔︎"
  exit 0
fi

# インストール
echo "Install homebrew"

OS=${uname}

if [ "${OS}" == "Darwin" ]; then
  #macOS
  /usr/bin/ruby -e "$(curl -fsSL ${homebrew_url})"
elif [ "${OS}" == "Linux" ]; then
  #Linux
  sh -c "$(curl -fsSL ${linuxbrew_url})"
else
  echo "${OS} is not supported"
fi
