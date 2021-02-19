# .zshrc

# ===== alias =====

alias aws="docker run --rm -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli"
alias gcloud="docker run --rm -v ~/.config/gcloud:/root/.config/gcloud -w $(pwd):/gcloud -w /gcloud google/cloud-sdk:slim gcloud"
alias gsutil="docker run --rm -v ~/.config/gcloud:/root/.config/gcloud -w $(pwd):/gcloud -w /gcloud google/cloud-sdk:slim gsutil"

# Trash-cli
if type trash-put > /dev/null 2>&1 ; then
    alias rm=trash-put
fi

# ===== secrets =====

if [[ -f $HOME/.secrets ]]; then
    source $HOME/.secrets
fi

# ===== ZSH =====

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# 保存するヒストリ数
export HISTSIZE=1024
export SAVEHIST=1024
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
zinit silent wait light-mode from:gh-r as"program" for \
    mv:"bat* -> bat" pick"bat/bat" @sharkdp/bat \
    mv:"fd* -> fd" pick"fd/fd" @sharkdp/fd \
    mv:"exa* -> exa" ogham/exa \
    junegunn/fzf-bin

# Plugins
zinit silent wait light-mode for \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions

# KeyBindings
zinit silent for \
    https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh

# Completions
zinit silent wait as"completion" for \
    https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
    https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose \
    https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh

# TMUX auto start
zstyle ":prezto:module:tmux:session" name "default"
zstyle ":prezto:module:tmux:auto-start" remote "yes"

zinit snippet PZT::modules/tmux/init.zsh