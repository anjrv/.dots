if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/bundle')
  Plug 'easymotion/vim-easymotion'
  Plug 'neoclide/coc.nvim'
  Plug 'dracula/vim'
  Plug 'vimwiki/vimwiki'
  Plug 'lervag/vimtex'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'mattn/emmet-vim'
  Plug 'conornewton/vim-pandoc-markdown-preview'
  Plug 'RRethy/vim-hexokinase', { 'do' : 'make hexokinase' }
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
call plug#end()
