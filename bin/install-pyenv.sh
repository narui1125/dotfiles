#!/bin/bash

pyenv_url="https://github.com/pyenv/pyenv.git"

# すでにインストールされているか確認
if type "pyenv" > /dev/null 2>&1 ; then
  echo "Already installed pyenv ✔︎"
  exit 0
fi

# インストール
echo "Install pyenv"

if type "brew" > /dev/null 2>&1 ; then
  # brewがつかえるならbrewでインストール
  brew install pyenv
else
  git clone ${pyenv_url} ~/.pyenv
fi
