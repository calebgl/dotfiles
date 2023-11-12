export EDITOR='nvim'
export VISUAL='nvim'
export DISPLAY=:0
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="$PATH:$HOME/bin:/usr/local/bin"
export PATH="$PATH:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

zstyle ':omz:update' mode auto

plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/.go"
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

export PNPM_HOME="/home/caleb/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export GDK_BACKEND="wayland"

bindkey -v
