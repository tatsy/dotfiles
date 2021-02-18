# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

zplug "romkatv/powerlevel10k", as:theme, depth:1

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "modules/history-substring-search", from:prezto, defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

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

# Enhancd
export ENHANCD_FILTER="peco:fzf"
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HOME=1

# Peco
function peco-history-selection() {
    if which tac >/dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# Vim
alias vim=/usr/local/bin/nvim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
