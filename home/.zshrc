# .zshrc

# zsh
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

# Prezto
if [ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
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
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Added by Krypton
export GPG_TTY=$(tty)
