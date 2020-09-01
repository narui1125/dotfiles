# .zshrc

# ===== ZSH =====

# シェルの終了を待たずにファイルにコマンド履歴を保存
setopt inc_append_history
# historyコマンドをヒストリに保存しない
setopt hist_no_store 
# ヒストリに保存する時空白を除去する
setopt hist_reduce_blanks
# 重複をヒストリに保存しない
setopt hist_ignore_all_dups
# ヒストリをシェル間で共有
setopt share_history


# ===== Zinit =====

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Load the pure theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# junegunn/fzf-bin
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf-bin

# sharkdp/bat, replacement for cat
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# ogham/exa, replacement for ls
zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zinit light ogham/exa

# 補完
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# シンタックスハイライト
zinit light zsh-users/zsh-syntax-highlighting
# コマンド履歴検索
zinit light zdharma/history-search-multi-word


# ===== Other =====

# fzf
if type fzf > /dev/null 2>&1 ; then
  export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
fi

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