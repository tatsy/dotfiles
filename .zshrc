# Terminal color
export TERM=xterm-256color

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Aliases
if [ "$(uname)" = "Darwin" ]; then
    alias ls='ls -G'
    alias la='ls -la -G'
    alias ll='ls -la -G'
else
    alias ls='ls --color=auto'
    alias la='ls -la --color=auto'
    alias ll='ls -la --color=auto'
fi

alias bd='cd ..'
alias vim=nvim

# Clang
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Paths
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Sheldon
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
SHELDON_CACHE="${CACHE_DIR}/sheldon.zsh"
SHELDON_TOML="${HOME}/.config/sheldon/plugins.toml"

if [[ ! -r "${SHELDON_CACHE}" || "${SHELDON_TOML}" -nt "${SHELDON_CACHE}" ]]; then
    mkdir -p "${CACHE_DIR}"
    sheldon source > "${SHELDON_CACHE}"
fi
source "${SHELDON_CACHE}"
unset CACHE_DIR SHELDON_CACHE SHELDON_TOML

# zsh auto-suggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# Enhancd
export ENHANCD_FILTER="peco:fzf"
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HOME=1

# Peco
function peco-history-selection() {
    if ! command -v tac &>/dev/null; then
        alias tac="tail -r"
    fi

    BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# GHQ
setopt hist_ignore_all_dups

function ghq-list-search() {
    local ghq_select_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$ghq_select_dir" ]; then
        BUFFER="cd ${ghq_select_dir}"
        zle accept-line
    fi
    zle reset-prompt
}

zle -N ghq-list-search
bindkey '^G' ghq-list-search

# bashautocompinit
autoload -Uz bashcompinit && bashcompinit

