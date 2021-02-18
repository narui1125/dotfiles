#!/bin/bash


# インストール
install_homebrew(){
  if type "brew" > /dev/null 2>&1 ; then
    printf "\e[1;32mAlready installed Homebrew ✔︎\e[0m\n"
  else
    printf "\e[1;34mInstall homebrew\e[0m\n"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" < /dev/null

    if [ ! "$(uname)" == "Linux" ] 
      eval $($HOME/.linuxbrew/bin/brew shellenv)
    
	  brew update && brew bundle --file="${DOTFILES_DIR}/etc/Brewfile"
  fi
}