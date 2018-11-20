#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0);pwd)

## download
download(){
	local GIT_URL="https://github.com/narui1125/dotfiles"

	if has "git"; then
		git clone --recursive "${GIT_URL}"

	else
		die "git required"
	fi
}

## install
deploy(){
	BIN_DIR="${SCRIPT_DIR}/bin"

	# TSUBAME
	if [ "$1" == "TSUBAME" ]; then
		sh ${BIN_DIR}/install-libevent.sh "$1"
		sh ${BIN_DIR}/install-ncurses.sh "$1"
		sh ${BIN_DIR}/install-zsh.sh "$1"
		sh ${BIN_DIR}/install-tmux.sh "$1"
		sh ${BIN_DIR}/install-powerline-status.sh "$1"

	# Local
	elif [ "$1" == "Local" ]; then
		sh ${BIN_DIR}/install-zsh.sh "$1"
		sh ${BIN_DIR}/install-tmux.sh "$1"
		sh ${BIN_DIR}/install-powerline-status.sh "$1"

	# Error
	else
		echo "error"
	fi
}

## configure
initalize(){
	DOTPATH="${SCRIPT_DIR}/home"

	echo "Created dotfile symbolic links."

	cd ${DOTPATH}

	for f in .??*
	do
		[[ "$f" == ".git" ]] && continue
		[[ "$f" == ".DS_Store" ]] && continue

		ln -snf "${DOTPATH}/$f" "${HOME}/$f"
		if [ $? -eq 0 ]; then
			printf "\t%-25s -> %s\n" "${DOTPATH}/$f" "${HOME}/$f"
		fi
	done
}

deploy "Local"

initalize
