#!/bin/bash

WORK=${HOME}/temp

## download
download(){
	GIT_URL=""

	if has "git"; then
	    git clone --recursive "${GIT_URL}" "${WORK}"
	
	else
		die "git required"
	fi
}

## install
deploy(){
	BIN_DIR="${WORK}/bin"

	sh ${BIN_DIR}/install-libevent.sh
	sh ${BIN_DIR}/install-ncurses.sh
	sh ${BIN_DIR}/install-zsh.sh
	sh ${BIN_DIR}/install-tmux.sh
	sh ${BIN_DIR}/install-powerline-status.sh
}

## configure
initalize(){
	DOT_DIR="${WORK}/home"

	cd ${DOT_DIR}

	for f in .??*
	do
	    [[ "$f" == ".git" ]] && continue
	    [[ "$f" == ".DS_Store" ]] && continue
	
	    ln -s "${DOT_DIR}/$f" "${HOME}/$f"
	done
}

if "$1" = "deploy" then
    deploy
elif "$1" = "init" then
    initalize
fi