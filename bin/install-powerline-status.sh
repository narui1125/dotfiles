#!/bin/bash

if type "powerline" > /dev/null 2>&1 ; then
  echo "Already installed PowerLine-status ✔︎"
else
  echo "Install PowerLine-status"

  pip install --user powerline-status

  git clone https://github.com/powerline/fonts.git
  cd fonts
  sh install.sh

  cd ..
  rm -rf fonts

fi
