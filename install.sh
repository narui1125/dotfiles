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

	printf "\e[1;34m=== Install CUI Applications ===\e[0m \n"

	brew update
	brew tap caskroom/cask

	brew bundle --file="${ETC_DIR}/Brewfile"

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

	# anyenv
	anyenv install --init
	anyenv install pyenv
	anyenv install plenv

	eval "$(anyenv init -)"

	# pyenv
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
	pip install --user powerline-status

	# plenv
	plenv install 5.10.0
	plenv global 5.10.0

	plenv install-cpanm

	cpan local/lib.pm

	if [ "$(uname)" == "Darwin" ]; then
		# basictex
		sudo tlmgr update --self --all
		sudo tlmgr paper a4
		sudo tlmgr install collection-langjapanese
		sudo tlmgr install latexmk
	fi
}

while getopts dic OPT
do
  case $OPT in
    "d" ) FLG_DEPLOY="TRUE" ;;
    "i" ) FLG_INIT="TRUE" ;;
    "c" ) FLG_CONF="TRUE" ;;
  esac
done

if [ $# -e 0 ]; then
	FLG_DEPLOY="TRUE"
	FLG_INIT="TRUE"
	FLG_CONF="TRUE"
fi

if [ "$FLG_DEPLOY" = "TRUE" ]; then
	deploy
fi

if [ "$FLG_INIT" = "TRUE" ]; then
	initialize
fi

if [ "$FLG_CONF" = "TRUE" ]; then
	configure
fi
