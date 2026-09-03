# Aliases
case "$OSTYPE" in
    darwin*)
        alias ls='ls -G'
        alias la='ls -la -G'
        alias ll='ls -la -G'
    ;;
    linux*)
        alias ls='ls --color=auto'
        alias la='ls -la --color=auto'
        alias ll='ls -la --color=auto'
    ;;
esac

alias bd='cd ..'
alias vim=nvim

# Clang
case "$OSTYPE" in
    darwin*)
        [[ -d /opt/homebrew/opt/llvm/bin ]] &&
            path=(/opt/homebrew/opt/llvm/bin $path)
        ;;
esac

# Paths
typeset -U path PATH

path=(
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/go/bin"
    $path
)

# Sheldon
if (( $+commands[sheldon] )); then
    CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
    SHELDON_CACHE="${CACHE_DIR}/sheldon.zsh"
    SHELDON_TOML="${HOME}/.config/sheldon/plugins.toml"

    if [[ ! -r "${SHELDON_CACHE}" || "${SHELDON_TOML}" -nt "${SHELDON_CACHE}" ]]; then
        mkdir -p "${CACHE_DIR}"
        sheldon source > "${SHELDON_CACHE}"
    fi
    source "${SHELDON_CACHE}"
    unset CACHE_DIR SHELDON_CACHE SHELDON_TOML
fi

# zsh auto-suggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# Enhancd
export ENHANCD_FILTER="peco:fzf"
export ENHANCD_DISABLE_DOT="false"
export ENHANCD_DISABLE_HOME="false"
export ENHANCD_DISABLE_DOUBLE_DOT="false"

# Peco
if (( $+commands[peco] )); then
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
fi

# GHQ
if (( $+commands[ghq] )); then
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
fi

# bashautocompinit
autoload -Uz bashcompinit && bashcompinit

