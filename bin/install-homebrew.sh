#!/bin/bash

# すでにインストールされているか確認
if type "brew" > /dev/null 2>&1 ; then
  echo "Already installed Homebrew ✔︎"
  exit 0
fi

echo "Install homebrew"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
