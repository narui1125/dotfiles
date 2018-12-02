# .zshenv

# PATH
export PATH="$HOME/.local/bin:$PATH"
export C_INCLUDE_PATH="$HOME/.local/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$HOME/.local/include:$CPLUS_INCLUDE_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
export INFOPATH="$HOME/.local/share/info:$INFOPATH"

if [ "$(uname)" "==" "Linux" ]; then
  #Linux
  export HOMEBREW_PREFIX="$HOME/.linuxbrew"
  export HOMEBREW_CELLAR="$HOME/.linuxbrew/Cellar"
  export HOMEBREW_REPOSITORY="$HOME/.linuxbrew/Homebrew"
  export PATH="$HOMEBREW_PREFIX/bin:$HOME/.linuxbrew/sbin:$PATH"
  export MANPATH="$HOMEBREW_PREFIX/share/man:$MANPATH"
  export INFOPATH="$HOMEBREW_PREFIX/share/info:$INFOPATH"
  export C_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$C_INCLUDE_PATH"
  export CPLUS_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$CPLUS_INCLUDE_PATH"
fi

# TSUBAME
if [ "${MODULE_VERSION_STACK}" != "" ]; then
  # Core
  ulimit -c unlimited
  # OpenMP
  export OMP_NUM_THREADS=32
  # module
  export MODULEPATH=/gs/hs0/tga-ishidalab/share/modulefiles:$MODULEPATH
  # aliase
  alias get_node="qrsh -l f_node=1 -l h_rt=0:10:00"
fi

# Pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"

# PowerLine
export POWERLINE_ROOT="${HOME}/.local/lib/python3.7/site-packages/powerline"
export PYTHONPATH="${HOME}/.local/lib/python3.7/site-packages:${PYTHONPATH}"
