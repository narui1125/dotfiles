#!/bin/bash

flann_url="https://www.cs.ubc.ca/research/flann/uploads/FLANN/flann-1.8.4-src.zip"

# インストール
printf "\e[1;34mInstall flann\e[0m\n"

if type "brew" > /dev/null 2>&1 ; then
  # brewがつかえるならbrewでインストール
  brew install flann
else
  wget ${flann_url} -O flann.tar.xz

  mkdir flann-temp

  tar xvf flann.tar.xz -C flann-temp --strip-components 1

  cd flann-temp

  mkdir build
  cd build/

  cmake -DCMAKE_INSTALL_PREFIX=$HOME/.local ..
  make
  make install
fi
