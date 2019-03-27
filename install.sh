#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0);pwd)

HOME_DIR="${SCRIPT_DIR}/home"
BIN_DIR="${SCRIPT_DIR}/bin"
ETC_DIR="${SCRIPT_DIR}/etc"

# アプリケーションのインストール
deploy(){
	printf "\e[1;34m=== Install Package Manager ===\e[0m \n"

	if [ "$(uname)" == "Darwin" ]; then
		source "${BIN_DIR}/install-homebrew.sh"
	elif [ "$(uname)" == "Linux" ]; then
		source "${BIN_DIR}/install-linuxbrew.sh"
	else
		printf "\e[1;31m Do not support \e[0m \n"
		exit 1
	fi

	printf "\e[1;34m=== Install Applications ===\e[0m \n"

	if [ "$1" == "full" ]; then
		brew update
		brew bundle --file="${ETC_DIR}/Brewfile"
	elif [ "$1" == "develop" ]; then
		brew update
		brew bundle --file="${ETC_DIR}/Brewfile-develop"
	elif [ "$1" == "server" ]; then
		brew update
		brew bundle --file="${ETC_DIR}/Brewfile-server"
	else
		printf "\e[1;31m not brew \e[0m \n"
	fi

	printf "\e[1;34m=== Install non Package Manager Applications ===\e[0m \n"

	source "${BIN_DIR}/install-prezto.sh"
	source "${BIN_DIR}/install-nerd-fonts.sh"
}

# 設定ファイルの展開
initialize(){
	local DOTPATH="${HOME_DIR}"

	printf "\e[1;34m=== Create dotfile symbolic links ===\e[0m \n"

	cd ${DOTPATH}
	for f in .??*
	do
		[[ "$f" == ".git" ]] && continue
		[[ "$f" == ".DS_Store" ]] && continue

		ln -snf "${DOTPATH}/$f" "${HOME}/$f"
		if [ $? -eq 0 ]; then
			printf "%-25s -> %s\n" "${DOTPATH}/$f" "${HOME}/$f"
		fi
	done
}

# アプリケーションの個別設定
configure(){
	printf "\e[1;34m=== Configure Applications ===\e[0m \n"

	# zshrcコンパイル
	if type "zcompile" > /dev/null 2>&1 ; then
		zcompile ~/.zshrc
	fi

	# anyenv
	if type "anyenv" > /dev/null 2>&1 ; then
		anyenv install --init
		anyenv install pyenv
		anyenv install plenv

		eval "$(anyenv init -)"
	fi

	# pyenv
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
	fi

	# powerline-status
	if type "pip" > /dev/null 2>&1 ; then
		pip install --user powerline-status
	fi

	# plenv
	if type "plenv" > /dev/null 2>&1 ; then
		plenv install 5.28.0
		plenv global 5.28.0
	fi

	# tex
	if type "tlmgr" > /dev/null 2>&1 ; then
		sudo tlmgr update --self --all
		sudo tlmgr paper a4
		sudo tlmgr install collection-langjapanese
		sudo tlmgr install latexmk
	fi
}

while getopts dic OPT
do
  case $OPT in
    "t" ) INSTALL_TYPE="$OPTARG" ;;
  esac
done

deploy $INSTALL_TYPE
initialize
configure
