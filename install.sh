#!/bin/bash

DOTFILES_REPOSITORY="git@github.com:narui1125/dotfiles.git"
DOTFILES_DIR="${HOME}/.dotfiles"

SCRIPT_DIR=$(cd $(dirname $0);pwd)

# ダウンロード
download(){
	printf "\e[1;34m=== Download dotfiles ===\e[0m \n"
	
	if [ -d "${DOTFILES_DIR}" ]; then
		printf "${DOTFILES_DIR} already exists \n"
		return
    fi

	if [ "$(uname)" == "Darwin" ]; then
		xcode-select --install
	fi

	if type "git" > /dev/null 2>&1 ; then
		git clone --recursive "${DOTFILES_REPOSITORY}" "${DOTFILES_DIR}"
	else
		printf "git not found"
		exit 1
	fi
}

# 設定ファイルの展開
deploy(){
	printf "\e[1;34m=== Create dotfile symbolic links ===\e[0m \n"

	cd "${DOTFILES_DIR}/home"
	for f in .??*
	do
		[[ "$f" == ".dotfiles" ]] && continue

		ln -snf "${DOTFILES_DIR}/home/$f" "${HOME}/$f"
		if [ $? -eq 0 ]; then
			printf "%-25s -> %s\n" "${DOTFILES_DIR}/home/$f" "${HOME}/$f"
		fi
	done
}

# アプリケーションのインストール
initialize(){
	printf "\e[1;34m=== Install Applications ===\e[0m \n"

	if !["$(uname)" == "Darwin" || "$(uname)" == "Linux"]; then
		printf "not Darwin or Linux\n"
		exit 1
	fi

	# Homebrew
	source "${DOTFILES_DIR}/bin/homebrew.sh" && install_homebrew
	
	eval $($HOME/.linuxbrew/bin/brew shellenv)
	brew update && brew bundle --file="${DOTFILES_DIR}/etc/Brewfile"
}

# main
install(){
	download
	deploy
	initialize
}

install