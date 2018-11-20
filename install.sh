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
		sh ${BIN_DIR}/install-libevent.sh
		sh ${BIN_DIR}/install-ncurses.sh
		sh ${BIN_DIR}/install-zsh.sh
		sh ${BIN_DIR}/install-tmux.sh
		sh ${BIN_DIR}/install-powerline-status.sh

	# Local
	elif [ "$1" == "Local" ]; then
		if type "brew" > /dev/null 2>&1 ; then
			echo "Already installed Homebrew ✔︎"
		else
			echo "Install homebrew"
			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		fi

		if type "zsh" > /dev/null 2>&1 ; then
		  echo "Already installed zsh ✔︎"
		else
			echo "install zsh"
			brew install zsh
		fi

		if type "tmux" > /dev/null 2>&1 ; then
		  echo "Already installed tmux ✔︎"
		else
			echo "install tmux"
			brew install tmux
		fi
		
		echo "Cleanup Homebrew"
		brew cleanup

		sh ${BIN_DIR}/install-powerline-status.sh

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

initalize
deploy "Local"
