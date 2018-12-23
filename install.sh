#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0);pwd)

## download
download(){
	local GIT_URL="https://github.com/narui1125/dotfiles"

	printf "\e[1;34m=== Download Repository ===\e[0m\n"

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

	#install CUI Applications
	source ${BIN_DIR}/install-homebrew.sh
	source ${BIN_DIR}/install-zsh.sh
	source ${BIN_DIR}/install-pyenv.sh
	source ${BIN_DIR}/install-vim.sh
	source ${BIN_DIR}/install-tmux.sh
	source ${BIN_DIR}/install-powerline-status.sh
	source ${BIN_DIR}/install-boost.sh

	# install GUI Applications via brew cask
	if [ "$(uname)" == "Darwin" ]; then
		# install dir = Home/Applications
		export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
		brew bundle --file="${BIN_DIR}/Brewfile"
	fi
}

## configure
initalize(){
	local DOTPATH="${SCRIPT_DIR}/home"

	printf "\e[1;34m=== Created dotfile symbolic links ===\e[0m \n"

	cd ${DOTPATH}

	# backup & make links
	for f in .??*
	do
		[[ "$f" == ".git" ]] && continue
		[[ "$f" == ".DS_Store" ]] && continue

		BACKUP_PATH="${HOME}/.dotbackup/`date "+%Y-%m-%d_%H:%M:%S"`"
		if [ -e "${HOME}/$f" ]; then
			if [ ! -e "${BACKUP_PATH}" ]; then
					mkdir -p ${BACKUP_PATH}
			fi
			mv ${HOME}/$f ${BACKUP_PATH}/$f
		fi

		ln -snf "${DOTPATH}/$f" "${HOME}/$f"
		if [ $? -eq 0 ]; then
			printf "%-25s -> %s\n" "${DOTPATH}/$f" "${HOME}/$f"
		fi
	done

	cd

	source ~/.bashrc

	# basictex
	sudo tlmgr update --self --all
	sudo tlmgr paper a4
	sudo tlmgr install collection-langjapanese
	sudo tlmgr install latexmk
}

deploy

initalize
