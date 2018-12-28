#!/bin/bash

pyenv_url="https://github.com/pyenv/pyenv.git"
SCRIPT_DIR=$(cd $(dirname $0);pwd)

# すでにインストールされているか確認
if type "pyenv" > /dev/null 2>&1 ; then
  echo "Already installed pyenv ✔︎"
else
  # インストール
  printf "\e[1;34mInstall pyenv\e[0m\n"

  if type "brew" > /dev/null 2>&1 ; then
    # brewがつかえるならbrewでインストール
    brew install pyenv
  else
    git clone ${pyenv_url} ~/.pyenv
  fi

  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"

  eval "$(pyenv init -)"

  # mojave zlib
  sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

  pyenv install 2.7.15
  pyenv install 3.7.0

  pyenv global 2.7.15

  pip install --upgrade pip
  pip install -r ${SCRIPT_DIR}/bin/requirements.txt

  pyenv global 3.7.0

  pip install --upgrade pip
  pip install -r ${SCRIPT_DIR}/bin/requirements.txt
fi
