# .zshrc

# Locale
export LC_ALL=ja_JP.UTF-8

# Prezto
if [ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
