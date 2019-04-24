# .zshenv

# うーん
setopt no_global_rcs
source /etc/profile

# locale
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# PATH
if [[ -z $TMUX ]]; then
  export PATH="$HOME/.local/bin:$PATH"
  export MANPATH="$HOME/.local/share/man:$MANPATH"
  export INFOPATH="$HOME/.local/share/info:$INFOPATH"
  export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH"

  export C_INCLUDE_PATH="$HOME/.local/include:$C_INCLUDE_PATH"
  export CPLUS_INCLUDE_PATH="$HOME/.local/include:$CPLUS_INCLUDE_PATH"
  export LIBRARY_PATH="$HOME/.local/lib:$LIBRARY_PATH"
  export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

  # OS毎の個別設定
  case ${OSTYPE} in
    darwin*)
      source "${HOME}/.zsh/.zshenv_darwin"
      ;;
    linux*)
      source "${HOME}/.zsh/.zshenv_linux"
      ;;
  esac
fi
