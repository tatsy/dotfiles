# Path
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Alias
alias vim=/usr/local/bin/nvim

# bobthefish
set -g theme_nerd_fonts yes
set -g theme_title_display_path yes
set -g theme_title_use_abbreviated_path no
set -g theme_project_dir_length 0
set -g fish_prompt_pwd_dir_length 0

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

#
if status is-interactive
  set PATH /opt/homebrew/bin $PATH
end

# conda initialize
status is-interactive && eval /Users/tatsuya/miniconda3/bin/conda "shell.fish" "hook" $argv | source

