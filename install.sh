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

	sh ${BIN_DIR}/install-zsh.sh
	sh ${BIN_DIR}/install-pyenv.sh
	sh ${BIN_DIR}/install-tmux.sh
	sh ${BIN_DIR}/install-powerline-status.sh
	sh ${BIN_DIR}/install-boost.sh
	sh ${BIN_DIR}/install-flann.sh
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
}

deploy

initalize
