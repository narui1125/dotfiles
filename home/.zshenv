# .zshenv

# うーん
setopt no_global_rcs
source /etc/profile

# PATH
export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
export INFOPATH="$HOME/.local/share/info:$INFOPATH"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH"

export C_INCLUDE_PATH="$HOME/.local/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$HOME/.local/include:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="$HOME/.local/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

# Linuxbrew
if [ "$(uname)" "==" "Linux" ]; then
  if [ -d "$HOME/.linuxbrew" ]; then
    export HOMEBREW_PREFIX="$HOME/.linuxbrew"
  elif [ -d "/home/linuxbrew/.linuxbrew" ]; then
    export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  fi

  export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
  export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX/Homebrew"

  export PATH="$HOMEBREW_PREFIX/bin:$HOME/.linuxbrew/sbin:$PATH"
  export MANPATH="$HOMEBREW_PREFIX/share/man:$MANPATH"
  export INFOPATH="$HOMEBREW_PREFIX/share/info:$INFOPATH"
  export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"

  export C_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$C_INCLUDE_PATH"
  export CPLUS_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$CPLUS_INCLUDE_PATH"
  export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"
fi

# brew cask
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# Pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"

# PowerLine
export POWERLINE_ROOT="${HOME}/.local/lib/python3.7/site-packages/powerline"
export PYTHONPATH="${HOME}/.local/lib/python3.7/site-packages:${PYTHONPATH}"

# TSUBAME
if [ "${MODULE_VERSION_STACK}" != "" ]; then
  # Core
  ulimit -c unlimited
  # OpenMP
  export OMP_NUM_THREADS=32
  # module
  . /etc/profile.d/modules.sh
  export MODULEPATH=/gs/hs0/tga-ishidalab/share/modulefiles:$MODULEPATH
  # aliase
  alias get_node="qrsh -l f_node=1 -l h_rt=0:10:00"
  alias get_h_node="qrsh -l h_node=1 -l h_rt=0:10:00"
  alias get_q_node="qrsh -l q_node=1 -l h_rt=0:10:00"
  alias get_s_core="qrsh -l s_core=1 -l h_rt=0:10:00"
fi
