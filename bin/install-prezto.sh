#!/bin/bash

git_url="https://github.com/sorin-ionescu/prezto.git"

# インストール
printf "\e[1;34mInstall prezto\e[0m\n"

if type "prompt" > /dev/null 2>&1 ; then
  printf "Already installed prezto ✔︎"
else
  git clone --recursive ${git_url} "${ZDOTDIR:-$HOME}/.zprezto"

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi
