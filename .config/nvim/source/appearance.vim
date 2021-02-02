" UI
set termguicolors
colorscheme dracula
set guifont=NotoSansMono\ Nerd\ Font\ 11
set cmdheight=2
set noshowmode
set number relativenumber
set nu rnu
set wrap
set confirm
set ruler
set scl=no
set shortmess+=c
set pumheight=5
syntax on
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" Brackets
set showmatch

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
