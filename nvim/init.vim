"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('/Users/kouf/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Required:
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " Let dein manage dein
    " Required:

    " call dein#add('Shougo/deoplete.nvim')
    " if !has('nvim')
    "    call dein#add('roxma/nvim-yarp')
    "    call dein#add('roxma/vim-hug-neovim-rpc')
    " endif
    " let g:deoplete#enable_at_startup = 1

    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    call dein#add('tpope/vim-dispatch')

    let s:toml_dir = expand('~/.config/nvim')
    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

set number
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
" set laststatus=0
let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif
colorscheme darkblue
