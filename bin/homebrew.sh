#!/bin/bash


# インストール
install_homebrew(){
  if type "brew" > /dev/null 2>&1 ; then
    echo "Already installed Homebrew ✔︎"
  else
    printf "\e[1;34mInstall homebrew\e[0m\n"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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
