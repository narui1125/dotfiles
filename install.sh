#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0);pwd)

## download
download(){
	local GIT_URL="https://github.com/narui1125/dotfiles"

	printf "\e[1;34m=== Download Repository ===\e[0m \n"

	if has "git"; then
		git clone --recursive "${GIT_URL}"

	else
		die "git required"
	fi
}

## install
deploy(){
	local BIN_DIR="${SCRIPT_DIR}/bin"

	printf "\e[1;34m=== Install Applications ===\e[0m \n"

	# Install from source
	if [ "$1" == "no-root" ]; then
		# ライブラリ
		sh ${BIN_DIR}/install-libevent.sh "$1"
		sh ${BIN_DIR}/install-ncurses.sh "$1"

		sh ${BIN_DIR}/install-zsh.sh "$1"
		sh ${BIN_DIR}/install-pyenv.sh "$1"
		sh ${BIN_DIR}/install-tmux.sh "$1"
		sh ${BIN_DIR}/install-powerline-status.sh "$1"

	# Install with Homebrew
	elif [ "$1" == "homebrew" ]; then
		sh ${BIN_DIR}/install-zsh.sh "$1"
		sh ${BIN_DIR}/install-pyenv.sh "$1"
		sh ${BIN_DIR}/install-tmux.sh "$1"
		sh ${BIN_DIR}/install-powerline-status.sh "$1"

	# Error
	else
		echo "error"
	fi
}

## configure
initalize(){
	local DOTPATH="${SCRIPT_DIR}/home"

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

	cd

	source ~/.bashrc
}

deploy "homebrew"

initalize
