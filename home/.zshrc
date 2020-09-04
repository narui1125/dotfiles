# .zshrc

# ===== alias =====

alias aws="docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli"
alias jupyter="docker run --rm -it -v $(pwd):/home/jovyan/work -p 8888:8888 -e NB_UID=$UID -e NB_GID=$GID --user root jupyter/tensorflow-notebook"


# ===== ZSH =====

# 保存するヒストリ数
HISTSIZE=1024
SAVEHIST=1024
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

# Theme
zinit ice compile:"(pure|async).zsh" pick:"async.zsh" src:"pure.zsh"
zinit light sindresorhus/pure

# Programs
zinit silent wait light-mode from:gh-r as:"program" for \
    mv:"bat* -> bat" @sharkdp/bat \
    mv:"fd* -> fd" @sharkdp/fd \
    mv:"exa* -> exa" ogham/exa \
    junegunn/fzf-bin

# Completions
zinit silent wait light-mode for \
    atinit:"zicompinit; zicdreplay" zsh-users/zsh-syntax-highlighting \
    atload:"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
    atpull:"zinit creinstall -q ." blockf zsh-users/zsh-completions

zinit silent for \
    https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh \
    https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh

# Completion Files
zinit silent wait as:"completion" for \
    https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
    https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose

# TMUX auto start
zstyle ":prezto:module:tmux:session" name "default"
zstyle ":prezto:module:tmux:auto-start" remote "yes"

zinit snippet PZT::modules/tmux/init.zsh


# ===== Other =====

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