#!/bin/bash


# インストール
install_homebrew(){
  if type "brew" > /dev/null 2>&1 ; then
    printf "\e[1;32mAlready installed Homebrew ✔︎\e[0m\n"
  else
    printf "\e[1;34mInstall homebrew\e[0m\n"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Path
    if [ -d "/opt/homebrew" ]; then
      eval $(/opt/homebrew/bin/brew shellenv)
    elif [[ -d "$HOME/.linuxbrew" ]]; then
      eval $(~/.linuxbrew/bin/brew shellenv)
    elif [[ -d /home/linuxbrew/.linuxbrew ]]; then
      eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    fi
    
	  brew update && brew bundle --file="${DOTFILES_DIR}/etc/Brewfile"
  fi
}