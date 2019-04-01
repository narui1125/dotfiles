#!/bin/bash

anyenv_url="https://github.com/anyenv/anyenv"

# インストール
install_anyenv(){
  if type "anyenv" > /dev/null 2>&1 ; then
    echo "Already installed Anyenv ✔︎"
  else
    printf "\e[1;34mInstall Anyenv\e[0m\n"

    git clone ${anyenv_url} ~/.anyenv

    eval "$($HOME/.anyenv/bin/anyenv init -)"
  fi
}

# 設定
configure_anyenv(){
  # PATH
  eval "$(anyenv init -)"

  if type "anyenv" > /dev/null 2>&1 ; then
    printf "\e[1;34mConfigure Anyenv\e[0m\n"

    # Anyenv
    anyenv install --init
		anyenv install pyenv
		anyenv install plenv

    # Pyenv
    if type "pyenv" > /dev/null 2>&1 ; then
  		pyenv install 2.7.15
  		pyenv install 3.7.2

  		# pyton2
  		pyenv global 2.7.15
  		pip install -U pip
  		pip install -r "${ETC_DIR}/requirements.txt"

  		# pyton3
  		pyenv global 3.7.2
  		pip install -U pip
  		pip install -r "${ETC_DIR}/requirements.txt"

      # powerline-status
    	if type "pip" > /dev/null 2>&1 ; then
    		pip install --user powerline-status
    	fi
  	fi

    # Plenv
    if type "plenv" > /dev/null 2>&1 ; then
      plenv install 5.28.0
      plenv global 5.28.0
    fi

  else
    echo "Not installed Anyenv. Skipped ✔︎"
  fi
}
