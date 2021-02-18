# Path
set -x GOPATH $HOME
set -x PATH $PATH $GOPATH

# Alias
alias vim=/usr/local/bin/nvim

# Peco
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# GHQ
set -g GHQ_SELECTOR peco

