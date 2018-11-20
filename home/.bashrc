# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and function

# zsh
if [ "$SSH_TTY" != "" ]; then
	exec $HOME/.local/bin/zsh
fi

