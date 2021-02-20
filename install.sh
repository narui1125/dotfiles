#!/bin/bash

DOTFILES_REPOSITORY="git@github.com:narui1125/dotfiles.git"
DOTFILES_DIR="${HOME}/.dotfiles"

SCRIPT_DIR=$(cd $(dirname $0);pwd)

# ダウンロード
download(){
	# 確認
	[ -d "${DOTFILES_DIR}" ] && return

	printf "\e[1;34m=== Download dotfiles ===\e[0m \n"

	# Command Line Tools for Xcode
	[ "$(uname)" == "Darwin" ] && xcode-select --install

	if type "git" > /dev/null 2>&1 ; then
		printf "Download dotfiles...\n"
		git clone --recursive "${DOTFILES_REPOSITORY}" "${DOTFILES_DIR}"
	else
		printf "git not found"
		exit 1
	fi
}

# 設定ファイルの展開
deploy(){
	# 確認
	[ ! -d "${DOTFILES_DIR}" ] && return

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
	# 確認
	[ ! -d "${DOTFILES_DIR}" ] && return

	printf "\e[1;34m=== Install Applications ===\e[0m \n"

	# Homebrew
	source "${DOTFILES_DIR}/bin/homebrew.sh" && install_homebrew

	# macOS config
	[ "$(uname)" == "Darwin" ] && source "${DOTFILES_DIR}/bin/darwin.sh"
}


# Main
while getopts c OPT
do
  case $OPT in
     c) MODE="compact";;
  esac
done

if [ "$MODE" == "compact" ]; then
	download
	deploy
else
	download
	initialize
	deploy
fi