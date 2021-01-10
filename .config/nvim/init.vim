source ~/.config/nvim/source/plugins.vim
source ~/.config/nvim/source/binds.vim
source ~/.config/nvim/source/appearance.vim
source ~/.config/nvim/source/coc.vim

filetype plugin indent on

" Use system clipboard
set clipboard+=unnamedplus
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set nocompatible

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

" No editing swap file
set noswapfile

" Whether mouse is enabled
set mouse=a

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Movement
autocmd InsertEnter * norm zz

" Faster update time
set updatetime=300

" Backspace beyond insert
set backspace=indent,eol,start

" Search options
set wildmenu
set incsearch
set hlsearch
set ignorecase
set smartcase

" History
set history=100
set undolevels=1000

" Latex editing stuff
let g:vimtex_view_method = 'mupdf'
let g:vimtex_compiler_progname = 'nvr'
" Automatically update latex files
augroup TexAutoWrite
  autocmd FileType tex :autocmd! TexAutoWrite InsertLeave <buffer> :update
augroup END

" NERDTree
let g:NERDTreeIgnore = ['^node_modules$']
