" ###########################
"    Basic settings
" ###########################

set sh=zsh
set encoding=utf-8
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
set listchars=tab:»-,trail:-

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

set hidden
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set nowrapscan

" ###########################
"    Tabs
" ###########################
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent
autocmd FileType html,css,javascript,ruby,json,toml,yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" ###########################
"    Move between splits
" ###########################
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" ###########################
" Python
" ###########################
let s:python_path = trim(system('which python'))
let s:python3_path = trim(system('which python3'))
if strlen(s:python_path) > 0
    let g:python_host_prog = s:python_path
    let g:loaded_python_provider = 0
else
    let g:loaded_python_provider = 0
endif

if strlen(s:python3_path) > 0
    let g:python3_host_prog = s:python3_path
else
    let g:loaded_python3_provider = 0
endif

" ###########################
"    dein
" ###########################
if &compatible
    set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:nvim_dir = expand('$HOME/.config/nvim')
let s:dein_dir = expand('$HOME/.cache/dein')
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#load_toml('~/.config/nvim/dein.toml',            {'lazy': 0})
    call dein#load_toml('~/.config/nvim/dein_lazy.toml',       {'lazy': 1})
    call dein#load_toml('~/.config/nvim/dein_cpp.toml',        {'lazy': 1})
    call dein#load_toml('~/.config/nvim/dein_python.toml',     {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable
