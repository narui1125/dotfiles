#!/bin/bash


# すでにインストールされているか確認
if type "cmake" > /dev/null 2>&1 ; then
  echo "Already installed cmake ✔︎"
else
  # インストール
  printf "\e[1;34mInstall cmake\e[0m\n"

  OS=$(uname)

  if [ "${OS}" == "Darwin" ]; then
    #macOS
    brew install cmake
  elif [ "${OS}" == "Linux" ]; then
    #Linux
    brew install cmake
  else
    echo "${OS} is not supported"
  fi
fi
