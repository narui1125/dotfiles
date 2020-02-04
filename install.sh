#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0);pwd)

HOME_DIR="${SCRIPT_DIR}/home"
BIN_DIR="${SCRIPT_DIR}/bin"
ETC_DIR="${SCRIPT_DIR}/etc"

deploy_darwin(){
	# Homebrew
	source "${BIN_DIR}/homebrew.sh" && install_homebrew && brew update 
	brew bundle --file="${ETC_DIR}/Brewfile"
}

deploy_linux(){
	# Linuxbrew
	source "${BIN_DIR}/linuxbrew.sh" && install_linuxbrew && brew update
	brew bundle --file="${ETC_DIR}/Brewfile"
}

deploy_manual(){
	# Manual install
	source "${BIN_DIR}/zsh.sh" && install_zsh
	source "${BIN_DIR}/vim.sh" && install_vim
	source "${BIN_DIR}/tmux.sh" && install_tmux
	source "${BIN_DIR}/fzf.sh" && install_fzf
}

# アプリケーションのインストール
deploy(){
	printf "\e[1;34m=== Install Applications ===\e[0m \n"

	# パッケージマネージャ対応ソフトのインストール
	if [ "$(uname)" == "Darwin" ]; then
		printf "\e[1;34m=== Darwin ===\e[0m \n"
		deploy_darwin
	elif [ "$(uname)" == "Linux" ]; then
		printf "\e[1;34m=== Linux ===\e[0m \n"
		deploy_linux
	else
		printf "Manual install? [Y/n]" && read answer
		case $answer in
			[yY])
				deploy_manual;;
			*)
				printf "cancelled.";;
		esac
	fi

	# パッケージマネージャ非対応ソフトのインストール
	source "${BIN_DIR}/prezto.sh" && install_prezto
	source "${BIN_DIR}/nerd-fonts.sh" && install_nerdfonts
}

# 設定ファイルの展開
initialize(){
	local DOTPATH="${HOME_DIR}"

	printf "\e[1;34m=== Create dotfile symbolic links ===\e[0m \n"

	cd ${DOTPATH}
	for f in .??*
	do
		[[ "$f" == ".git" ]] && continue
		[[ "$f" == ".DS_Store" ]] && continue

		ln -snf "${DOTPATH}/$f" "${HOME}"
		if [ $? -eq 0 ]; then
			printf "%-25s -> %s\n" "${DOTPATH}/$f" "${HOME}/$f"
		fi
	done
}

# アプリケーションの個別設定
configure(){
	printf "\e[1;34m=== Configure Applications ===\e[0m \n"

	# zshrcコンパイル
	if type "zcompile" > /dev/null 2>&1 ; then
		zcompile ~/.zshrc
	fi
}

# main
deploy
initialize
configure
