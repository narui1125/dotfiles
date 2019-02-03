# .zshrc

# Locale
export LC_ALL=ja_JP.UTF-8

# Anyenv
eval "$(anyenv init -)"

# Prezto
if [ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
