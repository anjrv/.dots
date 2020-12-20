" Load plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/bundle')
  Plug 'neoclide/coc.nvim'
  Plug 'dracula/vim'
  Plug 'lervag/vimtex'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'conornewton/vim-pandoc-markdown-preview'
  Plug 'RRethy/vim-hexokinase'
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

filetype plugin indent on
set clipboard+=unnamedplus
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set noswapfile

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Brackets
set showmatch

" Movement
autocmd InsertEnter * norm zz

" Pmenu
func! s:pmenu_colors() abort
  highlight Normal guibg=NONE ctermbg=NONE
endfunc

augroup colorscheme_coc_setup | au!
  au ColorScheme * call s:pmenu_colors()
augroup END

" UI
set termguicolors
colorscheme dracula
set guifont=DroindSansMono\ Nerd\ Font\ 11
set cmdheight=2
set noshowmode
set number relativenumber
set nu rnu
set wrap
set confirm
set ruler
set cursorline
set scl=no
set shortmess+=c
set pumheight=5
syntax on

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

" Providers
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python'

" Latex editing stuff
let g:vimtex_view_method = 'mupdf'
let g:vimtex_compiler_progname = 'nvr'
" Automatically update latex files
augroup TexAutoWrite
  autocmd FileType tex :autocmd! TexAutoWrite InsertLeave <buffer> :update
augroup END

" Keybinds
nmap <C-f> :NERDTreeToggle<CR>

" NERDTree
let g:NERDTreeIgnore = ['^node_modules$']


" Statusline
" Define mode names
let g:currentmode={
  \ 'n' : 'Normal ',
  \ 'no' : 'N-Operator Pending',
  \ 'v' : 'Visual ',
  \ 'V' : 'Visual ',
  \ 'x22' : 'Visual ',
  \ 's' : 'Select ',
  \ 'S' : 'Select ',
  \ 'x19' : 'Select ',
  \ 'i' : 'Insert ',
  \ 'R' : 'Replace',
  \ 'Rv' : 'Replace',
  \ 'c' : 'Command ',
  \ 'cv' : 'Vim Exp ',
  \ 'ce' : 'Exp',
  \ 'r' : 'Prompt ',
  \ 'rm' : 'More ',
  \ 'r?' : 'Confirm',
  \ '!' : 'Shell ',
  \ 't' : 'Terminal '
  \}

set laststatus=2
set statusline=
set statusline+=%#number#\ %{toupper(g:currentmode[mode()])} " Current mode
set statusline+=%#keyword#\ %F " Absolute filepath
set statusline+=%#comment#\ >> " Filler delimiters
set statusline+=%= " Shift right
set statusline+=\ << " Filler delimiters
set statusline+=%#keyword#\ %c:%l " Column:Line
set statusline+=%#comment#\ :: " Filler delimiters
set statusline+=%#keyword#\ %p%% " Location percent

" Coc requirements
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
