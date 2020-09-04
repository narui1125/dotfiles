# .zshenv

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

  # homebrew & linuxbrew
  if [[ ! -z $HOMEBREW_PREFIX ]]; then
    export C_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$C_INCLUDE_PATH"
    export CPLUS_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$CPLUS_INCLUDE_PATH"
    export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"
  fi

  # linuxbrew
  if [[ -f $HOME/.linuxbrew ]]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
  elif [[ -f /home/linuxbrew/.linuxbrew ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi
fi