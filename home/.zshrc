# Created by newuser for 5.6.2

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# PowerLine
powerline-daemon -q
. ${POWERLINE_ROOT}/bindings/zsh/powerline.zsh

# zsh

## 補完
autoload -U compinit
compinit

## History

### 履歴ファイルの保存先
export HISTFILE=${HOME}/.zhistory
### メモリに保存される履歴の件数
export HISTSIZE=1000
### 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
### 重複を記録しない
setopt hist_ignore_dups
### 開始と終了を記録
setopt EXTENDED_HISTORY
### historyを共有
setopt share_history
