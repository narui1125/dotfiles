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
}

# 設定ファイルの展開
initalize(){
	local DOTPATH="${HOME_DIR}"

	printf "\e[1;34m=== Created dotfile symbolic links ===\e[0m \n"

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

	# basictex
	tlmgr update --self --all
	tlmgr paper a4
	tlmgr install collection-langjapanese
	tlmgr install latexmk
}

# main
deploy
initalize
configure
