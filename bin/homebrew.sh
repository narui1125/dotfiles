#!/bin/bash


# インストール
install_homebrew(){
  if type "brew" > /dev/null 2>&1 ; then
    printf "\e[1;32mAlready installed Homebrew ✔︎\e[0m\n"
  else
    printf "\e[1;34mInstall homebrew\e[0m\n"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" < /dev/null
  fi
}