# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and function

# locale
export LC_ALL=ja_JP.UTF-8

# path
export PATH="$HOME/.local/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

# zsh
if [ "$SSH_TTY" != "" ] || [ "$SSH_CONNECTION" == "" ]; then
	exec zsh
fi
