#!/bin/bash

# インストール
echo "Install boost"

if type "brew" > /dev/null 2>&1 ; then
  # brewがつかえるならbrewでインストール
  brew install boost
else
  wget ${libevent_url} -O boost.tar.xz

  mkdir boost-temp

  tar xvf lboost.tar.xz -C boost-temp --strip-components 1

  cd boost-temp

  sh bootstrap.sh

  ./b2 install -j2 --prefix=${HOME}/.local
fi
