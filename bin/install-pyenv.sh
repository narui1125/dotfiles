#!/bin/bash

pyenv_url="https://github.com/pyenv/pyenv.git"

# すでにインストールされているか確認
if type "pyenv" > /dev/null 2>&1 ; then
  echo "Already installed pyenv ✔︎"
  exit 0
fi

echo "Install pyenv"

# TSUBAME
if [ "$1" == "TSUBAME" ]; then
  git clone ${pyenv_url} ~/.pyenv
  exit 0

# Local
elif [ "$1" == "Local" ]; then
  if [ ! type "brew" > /dev/null 2>&1 ]; then
    sh install-homebrew.sh
  fi
  brew install pyenv

  exit 0

# その他
else
  echo "Unkown Platform"

  exit 1
fi
