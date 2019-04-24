#!/bin/bash

vim_url="https://github.com/vim/vim.git"

# インストール
install_vim(){
  if type "vim" > /dev/null 2>&1 ; then
    echo "Already installed vim ✔︎"
  else
    printf "\e[1;34mInstall vim\e[0m\n"

    git clone ${vim_url} vim-tmp

    cd vim-tmp
    ./configure --prefix=${HOME}/.local --with-features=huge --enable-perlinterp --enable-pythoninterp --enable-python3interp --enable-rubyinterp --enable-luainterp --enable-fail-if-missing

    make
    make install

    cd ..
    rm -rf vim-tmp
  fi
}

# 設定
configure_vim(){
  # PATH
  export PATH="$HOME/.local/bin:$PATH"

  if type "brew" > /dev/null 2>&1 ; then
    printf "\e[1;34mConfigure vim\e[0m\n"
  else
    echo "Not installed vim. Skipped ✔︎"
  fi
}
