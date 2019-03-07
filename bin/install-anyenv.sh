#!/bin/bash

anyenv_url="https://github.com/anyenv/anyenv"

# インストール
printf "\e[1;34mInstall boost\e[0m\n"

if type "anyenv" > /dev/null 2>&1 ; then
  echo "Already installed Anyenv ✔︎"
else
  git clone ${anyenv_url} ~/.anyenv

  export PATH="$HOME/.anyenv/bin:$PATH"

  eval "$($HOME/.anyenv/bin/anyenv init -)"
fi
