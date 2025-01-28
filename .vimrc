if &compatible
    set nocompatible
endif
filetype plugin indent on
syntax enable
set t_Co=256
set fileformats=unix

set smarttab
set expandtab
set virtualedit=block

set ignorecase
set smartcase
set incsearch
set nohlsearch
set wrapscan

set list
set number
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:␣

set ambiwidth=double
if has('path_extra')
    set tags& tag+=.tags,tags
endif
set laststatus=2
set showtabline=2

set clipboard=unnamed

set backspace=eol,indent,start

set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll
let g:python_highlight_all = 1

set smartindent
set autoindent
set hidden
set shiftwidth=4
set showmatch
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]
set nowrapscan
