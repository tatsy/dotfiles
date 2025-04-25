# zsh/zplug settings
source "${HOME}/.zplug/init.zsh"

zplug "sorin-ionescu/prezto"

zplug "modules/prompt", from:prezto
zplug "modules/git", from:prezto
zplug "modules/autosuggestions", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/command-not-found", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/environment", from:prezto
zplug "modules/fasd", from:prezto
zplug "modules/history", from:prezto

zplug "mafredri/zsh-async"
zplug "rimraf/k"
zplug "b4b4r07/enhancd", use:init.sh
zplug "mollifier/cd-gitroot"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "modules/history-substring-search", from:prezto, defer:2

zstyle ":prezto:module:prompt" theme "pure" 

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

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

# Vim
alias vim=nvim

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tatsuya/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tatsuya/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tatsuya/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tatsuya/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

(( ! ${+functions[p10k]} )) || p10k finalize
