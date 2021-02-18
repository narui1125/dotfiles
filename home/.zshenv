# .zshenv

# Locale
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export VISUAL=vim
export EDITOR=vim

# Docker
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# PATH
if [[ -z $TMUX ]]; then
  if [ -d "/opt/homebrew" ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
  elif [[ -d "$HOME/.linuxbrew" ]]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
  elif [[ -d /home/linuxbrew/.linuxbrew ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi

  if [[ ! -z $HOMEBREW_PREFIX ]]; then
    export C_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$C_INCLUDE_PATH"
    export CPLUS_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$CPLUS_INCLUDE_PATH"
    export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"
  fi
fi