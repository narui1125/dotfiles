# .zshrc

# zsh
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

# History
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# Prezto
if [ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# fzf
if type fzf > /dev/null 2>&1 ; then
  export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git/*'"
  export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
  export PATH="${PATH:+${PATH}:}/$(brew --prefix)/opt/fzf/bin"
  source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi

# OS毎の個別設定
case ${OSTYPE} in
  darwin*)
    source "${HOME}/.zsh/.zshrc_darwin"
    ;;
  linux*)
    source "${HOME}/.zsh/.zshrc_linux"
    ;;
esac

# Pyenv
if type pyenv > /dev/null 2>&1 ; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Krypton
if type kr > /dev/null 2>&1 ; then
  export GPG_TTY=$(tty)
fi

# Trash-cli
if type trash-put > /dev/null 2>&1 ; then
    alias rm=trash-put
fi
