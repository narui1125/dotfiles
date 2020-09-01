#!/bin/bash

prezto_url="https://github.com/sorin-ionescu/prezto.git"

# インストール
install_prezto(){
  if [ -e "${HOME}/.zprezto" ]; then
    echo "Already installed prezto ✔︎"
  else
    printf "\e[1;34mInstall prezto\e[0m\n"

    git clone --recursive ${prezto_url} "${ZDOTDIR:-$HOME}/.zprezto"

    # 外部モジュール
    git clone https://github.com/Aloxaf/fzf-tab ${ZPREZTODIR}/contrib/fzf-tab
  fi
}

# 設定
configure_prezto(){
  # PATH
  export PATH="$HOME/.local/bin:$PATH"

  if [ -e "${HOME}/.zprezto" ]; then
    printf "\e[1;34mConfigure prezto\e[0m\n"
  else
    echo "Not installed prezto. Skipped ✔︎"
  fi
}
