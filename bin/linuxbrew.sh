#!/bin/bash

linuxbrew_url="https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh"

# インストール
install_linuxbrew(){
  if type "brew" > /dev/null 2>&1 ; then
    echo "Already installed linuxbrew ✔︎"
  else
    printf "\e[1;34mInstall linuxbrew\e[0m\n"

    sh -c "$(curl -fsSL ${linuxbrew_url})"

    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi
}

# 設定
configure_linuxbrew(){
  # PATH
  test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
  test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

  if type "brew" > /dev/null 2>&1 ; then
    printf "\e[1;34mConfigure linuxbrew\e[0m\n"
  else
    echo "Not installed linuxbrew. Skipped ✔︎"
  fi
}
