#!/bin/bash

zsh_url="https://sourceforge.net/projects/zsh/files/latest/download"

# インストール
install_zsh(){
  if type "zsh" > /dev/null 2>&1 ; then
    echo "Already installed zsh ✔︎"
  else
    printf "\e[1;34mInstall zsh\e[0m\n"

    curl -L -o zsh.tar.gz ${zsh_url}
    mkdir zsh-temp
    tar -xvf zsh.tar.gz -C zsh-temp --strip-components 1

    cd zsh-temp
    ./configure --prefix=${HOME}/.local --disable-shared

    make
    make install

    cd ..
    rm -rf zsh-temp
  fi
}

# 設定
configure_zsh(){
  # PATH
  export PATH="$HOME/.local/bin:$PATH"

  if type "zsh" > /dev/null 2>&1 ; then
    printf "\e[1;34mConfigure zsh\e[0m\n"
  else
    echo "Not installed zsh. Skipped ✔︎"
  fi
}
