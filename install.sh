#!/bin/bash

DOTFILES_REPOSITORY="git@github.com:narui1125/dotfiles.git"
DOTFILES_DIR="${HOME}/.dotfiles"

SCRIPT_DIR=$(cd $(dirname $0);pwd)

HOME_DIR="${DOTFILES_DIR}/home"
BIN_DIR="${DOTFILES_DIR}/bin"
ETC_DIR="${DOTFILES_DIR}/etc"

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

	cd ${HOME_DIR}
	for f in .??*
	do
		[[ "$f" == ".config" ]] && continue
		[[ "$f" == ".git" ]] && continue
		[[ "$f" == ".DS_Store" ]] && continue
		[[ "$f" == ".dotfiles" ]] && continue

		ln -snf "${HOME_DIR}/$f" "${HOME}/$f"
		if [ $? -eq 0 ]; then
			printf "%-25s -> %s\n" "${HOME_DIR}/$f" "${HOME}/$f"
		fi
	done

	# .config
	mkdir ${HOME}/.config
	
	cd ${HOME_DIR}/.config
	for f in ??*
	do
		[[ "$f" == ".DS_Store" ]] && continue

		ln -snf "${HOME_DIR}/.config/$f" "${HOME}/.config/$f"
		if [ $? -eq 0 ]; then
			printf "%-25s -> %s\n" "${HOME_DIR}/.config/$f" "${HOME}/.config/$f"
		fi
	done
}

# アプリケーションのインストール
initialize_darwin(){
	# Homebrew
	source "${BIN_DIR}/homebrew.sh" && install_homebrew
	
	eval $(/usr/local/bin/brew shellenv)
	brew update && brew bundle --file="${ETC_DIR}/Brewfile"

	# fix for zsh compinit
	chmod g-w /usr/local/share/zsh /usr/local/share/zsh/site-functions

	# crontab
	crontab ${ETC_DIR}/darwin.crontab

	# config
	source "${BIN_DIR}/darwin.sh"

	# change shell
	echo \\n# HomeBrew\\n$(which zsh) >> /etc/shells
	sudo chsh -s $(which zsh)

	# OpenJDK-8
	sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
}

initialize_linux(){
	# Homebrew
	source "${BIN_DIR}/homebrew.sh" && install_homebrew
	
	eval $($HOME/.linuxbrew/bin/brew shellenv)
	brew update && brew bundle --file="${ETC_DIR}/Brewfile"

	# fix for zsh compinit
	chmod g-w $HOME/.linuxbrew/share/zsh $HOME/.linuxbrew/share/zsh/site-functions
}

initialize(){
	printf "\e[1;34m=== Install Applications ===\e[0m \n"

	if [ "$(uname)" == "Darwin" ]; then
		printf "\e[1;34m=== Darwin ===\e[0m \n"
		initialize_darwin
	elif [ "$(uname)" == "Linux" ]; then
		printf "\e[1;34m=== Linux ===\e[0m \n"
		initialize_linux
	else
		printf "not Darwin or Linux\n"
		exit 1
	fi

	# PIP
	pip3 install --user -r ${ETC_DIR}/requirements.txt

	# textlint
	source "${BIN_DIR}/textlint.sh" && install_textlint
}

# main
install(){
	download
	deploy
	initialize
}

install