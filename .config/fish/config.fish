# Path
set -x GOPATH $HOME
set -x PATH $PATH $GOPATH

# Alias
alias vim=/usr/local/bin/nvim

# bobthefish
set -g theme_nerd_fonts yes
set -g theme_title_display_path yes
set -g theme_title_use_abbreviated_path no

# Peco
function peco_select_history
  history|peco|read foo
  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# GHQ
set -g GHQ_SELECTOR peco


# conda initialize
status is-interactive && eval /Users/tatsuya/miniconda3/bin/conda "shell.fish" "hook" $argv | source

