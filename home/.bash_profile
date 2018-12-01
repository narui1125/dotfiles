# .bash_profile

# locale
export LC_ALL=ja_JP.UTF-8

# path
export PATH="$HOME/.local/bin:$PATH"
export C_INCLUDE_PATH="$HOME/.local/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$HOME/.local/include:$CPLUS_INCLUDE_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

if [ "$(uname)" == "Linux" ]; then
  #Linux
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export C_INCLUDE_PATH="$HOME/.linuxbrew/include:$C_INCLUDE_PATH"
  export CPLUS_INCLUDE_PATH="$HOME/.linuxbrew/include:$CPLUS_INCLUDE_PATH"
  export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
  export PKG_CONFIG_PATH="$HOME/.linuxbrew/lib/pkgconfig:$PKG_CONFIG_PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"

	eval($HOME/.linuxbrew/bin/brew shellenv)
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
