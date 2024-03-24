export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="intheloop"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

zstyle ':omz:update' mode auto

plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

bindkey -v

alias cat="bat -p"
