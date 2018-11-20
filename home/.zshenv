

# PATH
export PATH="$HOME/.local/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

# TSUBAME
if [ "${MACHINE_TYPE}" = "TSUBAME" ]; then
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
export POWERLINE_ROOT="${HOME}/.pyenv/versions/3.7.0/lib/python3.7/site-packages/powerline"
export PYTHONPATH="${HOME}/.pyenv/versions/3.7.0/lib/python3.7/site-packages:${PYTHONPATH}"