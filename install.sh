#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0);pwd)

HOME_DIR="${SCRIPT_DIR}/home"
BIN_DIR="${SCRIPT_DIR}/bin"
ETC_DIR="${SCRIPT_DIR}/etc"

# アプリケーションのインストール
deploy(){
	printf "\e[1;34m=== Install Applications ===\e[0m \n"

	if [ "$1" == "root" ]; then
		if [ "$(uname)" == "Darwin" ]; then
			printf "install with HOMEBREW package manager.\n"

			source "${BIN_DIR}/homebrew.sh"
			install_homebrew

			brew update
			brew bundle --file="${ETC_DIR}/Brewfile"
		
		elif [ "$(uname)" == "Linux" ]; then
			if type "apt" > /dev/null 2>&1 ; then
				printf "install with APT package manager.\n"
				
				sudo apt update
				sudo apt install -y vim tmux zsh

				# fzf
				source "${BIN_DIR}/fzf.sh"
				install_fzf

				printf "Do you install docker? [Y/n]"
				read answer
				case $answer in
					[yY])
						printf "install docker"

						# docker 
						sudo apt-get install \
    						apt-transport-https \
							ca-certificates \
							curl \
							gnupg-agent \
							software-properties-common
						curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
						sudo add-apt-repository \
							"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
							$(lsb_release -cs) \
							stable"
						sudo apt-get update
						sudo apt-get install docker-ce docker-ce-cli containerd.io

						# docker-compose
						source "${BIN_DIR}/docker.sh"
						install_docker_compose
						;;
					[nN])
						printf "not install docker"
						;;

					*)
						printf "cancelled."
						;;
				esac
			
			elif type "yum" > /dev/null 2>&1 ; then
				printf "install with YUM package manager.\n"
				
				sudo yum update
				sudo yum install -y vim tmux zsh

				# fzf
				source "${BIN_DIR}/fzf.sh"
				install_fzf

				printf "Do you install docker? [Y/n]"
				read answer
				case $answer in
					[yY])
						printf "install docker"

						# docker 
						sudo yum install -y yum-utils \
							device-mapper-persistent-data \
							lvm2
						sudo yum-config-manager \
							--add-repo \
							https://download.docker.com/linux/centos/docker-ce.repo
						sudo yum install docker-ce docker-ce-cli containerd.io
						sudo systemctl start docker

						# docker-compose
						source "${BIN_DIR}/docker.sh"
						install_docker_compose
						;;
					[nN])
						printf "not install docker"
						;;

					*)
						printf "cancelled."
						;;
				esac
			else
				printf "\e[1;31m not support \e[0m \n"
				exit 1
			fi
		else
			printf "\e[1;31m not support \e[0m \n"
			exit 1
		fi
	else
		if [ "$(uname)" == "Linux" ]; then
			printf "install with LINUXBREW package manager.\n"

			source "${BIN_DIR}/linuxbrew.sh"
			install_linuxbrew

			brew update
			brew bundle --file="${ETC_DIR}/Brewfile"
		else
			printf "install without package manager.\n"

			source "${BIN_DIR}/zsh.sh"
			install_zsh

			source "${BIN_DIR}/vim.sh"
			install_vim

			source "${BIN_DIR}/tmux.sh"
			install_tmux

			source "${BIN_DIR}/fzf.sh"
			install_fzf
		fi
	fi

	source "${BIN_DIR}/prezto.sh"
	install_prezto

	source "${BIN_DIR}/nerd-fonts.sh"
	install_nerdfonts
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

# rootチェック
printf "Do you have root password? [Y/n]"
read answer
case $answer in
	[yY])
		deploy "root"
		initialize
		configure "root"
		;;
	[nN])
		deploy "non-root"
		initialize
		configure "non-root"
		;;

    	*)
		printf "cancelled."
		;;
esac
