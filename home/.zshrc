# .zshrc

# zsh
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

# Prezto
if [ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# fzf
if [ -f ~/.fzf.zsh ]; then
   source ~/.fzf.zsh
fi

