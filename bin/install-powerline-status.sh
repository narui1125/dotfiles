#!/bin/bash

powerline_font_url="https://github.com/powerline/fonts.git"

# すでにインストールされているか確認
if type "powerline" > /dev/null 2>&1 ; then
  echo "Already installed PowerLine-status ✔︎"
  exit 0
fi

echo "Install PowerLine-status"

pip install powerline-status

git clone ${powerline_font_url}
cd fonts
sh install.sh

cd ..
rm -rf fonts
