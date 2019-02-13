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
initalize(){
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

	# zsh
	if [ "$(uname)" == "Darwin" ]; then
		chsh -s /bin/zsh
	elif [ "$(uname)" == "Linux" ]; then
		chsh /bin/zsh
	else
		printf "\e[1;31m Do not support \e[0m \n"
		exit 1
	fi

	# シェルの再起動
	exec $SHELL -l

	# anyenv
	anyenv install --init
	anyenv install pyenv

	exec $SHELL -l

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

	# basictex
	sudo tlmgr update --self --all
	sudo tlmgr paper a4
	sudo tlmgr install collection-langjapanese
	sudo tlmgr install latexmk
}

# main
deploy
initalize
configure
