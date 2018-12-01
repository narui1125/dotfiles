#!/bin/bash

boost_url="https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz"

# インストール
echo "\e[1;34mInstall boost\e[0m\n"

if type "brew" > /dev/null 2>&1 ; then
  # brewがつかえるならbrewでインストール
  brew install boost
else
  wget ${boost_url} -O boost.tar.xz

  mkdir boost-temp

  tar xvf lboost.tar.xz -C boost-temp --strip-components 1

  cd boost-temp

  sh bootstrap.sh

  ./b2 install -j2 --prefix=${HOME}/.local
fi
