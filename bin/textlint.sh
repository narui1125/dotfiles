#!/bin/bash


# インストール
install_textlint(){
  if type "textlint" > /dev/null 2>&1 ; then
    printf "\e[1;32mAlready installed textlint ✔︎\e[0m\n"
  else
    printf "\e[1;34mInstall textlint\e[0m\n"
    npm install --global textlint
    npm install --global textlint-plugin-latex2e
    npm install --global \
        textlint-rule-preset-ja-technical-writing \
        textlint-rule-preset-jtf-style \
        textlint-rule-preset-ja-spacing
  fi
}