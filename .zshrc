# Paths
typeset -U path PATH

path=(
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/go/bin"
    $path
)

# Clang
case "$OSTYPE" in
    darwin*)
        LLVM_PREFIX="/opt/homebrew/opt/llvm"
        if [[ -d "$LLVM_PREFIX/bin" ]]; then
            path=("$LLVM_PREFIX/bin" $path)
            export CC="$LLVM_PREFIX/bin/clang"
            export CXX="$LLVM_PREFIX/bin/clang++"
            export CPPFLAGS="-I$LLVM_PREFIX/include"
            export LDFLAGS="-L$LLVM_PREFIX/lib -L$LLVM_PREFIX/lib/c++"
        fi
        unset LLVM_PREFIX
    ;;
esac

# History
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# Completion
autoload -Uz compinit
compinit

# Sheldon
if (( $+commands[sheldon] )); then
    CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
    SHELDON_CACHE="${CACHE_DIR}/sheldon.zsh"
    SHELDON_TOML="${HOME}/.config/sheldon/plugins.toml"

    if [[ ! -r "${SHELDON_CACHE}" || "${SHELDON_TOML}" -nt "${SHELDON_CACHE}" ]]; then
        mkdir -p "${CACHE_DIR}"

        if sheldon source > "${SHELDON_CACHE}.tmp"; then
            mv "${SHELDON_CACHE}.tmp" "${SHELDON_CACHE}"
        else
            rm -f "${SHELDON_CACHE}.tmp"
        fi
    fi
    source "${SHELDON_CACHE}"
    unset CACHE_DIR SHELDON_CACHE SHELDON_TOML
fi

# Aliases
if (( $+commands[eza] )); then
    alias ls='eza'
    alias la='eza -la'
    alias ll='eza -la --git'
else
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
fi

if (( $+commands[nvim] )); then
    alias vim=nvim
fi

# Zoxide
if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
fi

# Zsh auto-suggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# Peco
if (( $+commands[peco] )); then
    function peco-history-selection() {
        BUFFER=$(fc -lnr 1 | awk '!a[$0]++' | peco)
        CURSOR=$#BUFFER
        zle reset-prompt
    }

    zle -N peco-history-selection
    bindkey '^R' peco-history-selection
fi

# GHQ
if (( $+commands[ghq] && $+commands[peco] )); then
    function ghq-list-search() {
        local ghq_select_dir
        ghq_select_dir=$(ghq list -p | peco --query "$LBUFFER")

        if [[ -n "$ghq_select_dir" ]]; then
            cd -- "$ghq_select_dir"
        fi

        zle reset-prompt
    }

    zle -N ghq-list-search
    bindkey '^G' ghq-list-search
fi

# Starship
if (( $+commands[starship] )); then
    eval "$(starship init zsh)"
fi

# Local overrides
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

