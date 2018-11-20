# Created by newuser for 5.6.2

# PATH
export PATH="$HOME/.local/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
export PYTHONPATH="$HOME/.local/lib/python3.6/site-packages:$PYTHONPATH"

# Core
ulimit -c unlimited

# OpenMP
export OMP_NUM_THREADS=32

# module
export MODULEPATH=/gs/hs0/tga-ishidalab/share/modulefiles:$MODULEPATH

# aliase
alias get_node="qrsh -l f_node=1 -l h_rt=0:10:00"

# PowerLine Shell
export XDG_CONFIG_HOME="$HOME/.config"
powerline-daemon -q
. ~/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# 補完
autoload -U compinit
compinit
