#!/bin/bash

font_url="https://github.com/ryanoasis/nerd-fonts/patched-fonts/SourceCodePro/Regular/complete/Sauce Code Pro Nerd Font Complete.ttf"

# インストール

if [ "$(uname)" == "Darwin" ]; then
  if [ -f "${HOME}/Library/Fonts/Sauce Code Pro Nerd Font Complete.ttf" ]; then
    printf "Already installed Nerd Fonts ✔︎"
  else
    printf "\e[1;34mInstall Nerd Fonts\e[0m\n"
    cd "${HOME}/Library/Fonts" && curl -fLo "Sauce Code Pro Nerd Font Complete.ttf" ${font_url}
  fi
elif [ "$(uname)" == "Linux" ]; then
  if [ -f "${HOME}/.local/share/fonts/Sauce Code Pro Nerd Font Complete.ttf" ]; then
    printf "Already installed Nerd Fonts ✔︎"
  else
    printf "\e[1;34mInstall Nerd Fonts\e[0m\n"
    mkdir -p ~/.local/share/fonts
    cd "${HOME}/.local/share/fonts" && curl -fLo "Sauce Code Pro Nerd Font Complete.ttf" ${font_url}
  fi
else
  printf "\e[1;31m Do not support \e[0m \n"
fi
