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
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
