export EDITOR='nvim'
export VISUAL='nvim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"

export BAT_THEME="Nord"
export FZF_DEFAULT_OPTS='
    --color=gutter:-1
'

export GDK_BACKEND="wayland"
export SDL_VIDEODRIVER="wayland"

export GOPATH="$HOME/.go"
export PNPM_HOME="$HOME/.local/share/pnpm"
export BUN_INSTALL="$HOME/.bun"

export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOBIN"
export PATH="$PATH:$PNPM_HOME"
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="$PATH:$HOME/.config/emacs/bin"
export PATH="$PATH:$BUN_INSTALL/bin"


if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi

if [[ -f "$HOME/.bun/_bun" ]]; then
    . "$HOME/.bun/_bun"
fi

