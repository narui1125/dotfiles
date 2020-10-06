#!/bin/bash

DOTFILES_REPOSITORY="https://github.com/narui1125/dotfiles.git"
DOTFILES_ARCHIVE="https://github.com/narui1125/dotfiles/archive/master.tar.gz"
DOTFILES_DIR="${HOME}/.dotfiles"

SCRIPT_DIR=$(cd $(dirname $0);pwd)

HOME_DIR="${DOTFILES_DIR}/home"
BIN_DIR="${DOTFILES_DIR}/bin"
ETC_DIR="${DOTFILES_DIR}/etc"

# ダウンロード
download(){
	printf "\e[1;34m=== Download dotfiles ===\e[0m \n"
	
	if [ -d "${DOTFILES_DIR}" ]; then
        printf "${DOTFILES_DIR} already exists"
        return
    fi

	if [ "$(uname)" == "Darwin" ]; then
		xcode-select --install
	fi

	if type "git" > /dev/null 2>&1 ; then
		printf "download with git"
		git clone --recursive "${DOTFILES_REPOSITORY}" "${DOTFILES_DIR}"
	elif type "curl" > /dev/null 2>&1 ; then
		printf "download with curl"

		if [ ! -e ${DOTFILES_DIR} ]; then
			mkdir -p ${DOTFILES_DIR}
		fi

		curl -L "${DOTFILES_ARCHIVE}" | tar xvz --strip=1 -C "${DOTFILES_DIR}"
	elif type "wget" > /dev/null 2>&1 ; then
		printf "download with wget"
		
		if [ ! -e ${DOTFILES_DIR} ]; then
			mkdir -p ${DOTFILES_DIR}
		fi

		wget -O - "${DOTFILES_ARCHIVE}" | tar xvz --strip=1 -C "${DOTFILES_DIR}"
	else
		printf "git or curl or wget not found"
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
	source "${BIN_DIR}/homebrew.sh" && install_homebrew && brew update 
	brew bundle --file="${ETC_DIR}/Brewfile"

	# fix for zsh compinit
	chmod g-w /usr/local/share/zsh /usr/local/share/zsh/site-functions
}

initialize_linux(){
	# Linuxbrew
	source "${BIN_DIR}/linuxbrew.sh" && install_linuxbrew && brew update
	brew bundle --file="${ETC_DIR}/Brewfile"

	# fix for zsh compinit
	chmod g-w $HOME/.linuxbrew/share/zsh $HOME/.linuxbrew/share/zsh/site-functions
}

initialize_manual(){
	# Manual install
	source "${BIN_DIR}/tmux.sh" && install_tmux
}

initialize(){
	printf "\e[1;34m=== Install Applications ===\e[0m \n"

	# パッケージマネージャ対応ソフトのインストール
	if [ "$(uname)" == "Darwin" ]; then
		printf "\e[1;34m=== Darwin ===\e[0m \n"
		initialize_darwin
	elif [ "$(uname)" == "Linux" ]; then
		printf "\e[1;34m=== Linux ===\e[0m \n"
		initialize_linux
	else
		printf "Manual install? [Y/n]" && read answer
		case $answer in
			[yY])
				initialize_manual;;
			*)
				printf "cancelled.";;
		esac
	fi

	# NVM
	nvm install --lts

	# textlint
	npm install textlint --global
}

# main
install(){
	download
	deploy
	initialize
}

install