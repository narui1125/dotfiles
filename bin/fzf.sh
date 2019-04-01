#!/bin/bash

fzf_url="https://github.com/junegunn/fzf.git"

# インストール
install_fzf(){
  if [ -f "${HOME}/.fzf" ]; then
    echo "Already installed fzf ✔︎"
  else
    printf "\e[1;34mInstall fzf\e[0m\n"

    git clone --depth 1 ${fzf_url} ${HOME}/.fzf
    ${HOME}/.fzf/install
  fi
}

# 設定
configure_fzf(){
  if [ -f "${HOME}/.fzf" ]; then
    printf "\e[1;34mConfigure fzf\e[0m\n"
  else
    echo "Not installed fzf. Skipped ✔︎"
  fi
}
