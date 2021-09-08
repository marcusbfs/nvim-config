" Relative numbers
set number
set relativenumber
set ruler

" Tab
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" Syntax
syntax enable
filetype plugin indent on

" Colorscheme
" colorscheme evening

" Wrap test visually only - does not affects the buffer
set wrap

" Identantion
set autoindent

" Search
set incsearch

" Changed files
set autoread

" Cursors
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
" ... and reset cursor after exiting
au VimLeave * set guicursor=a:ver10-blinkon0

" Text width
"set textwidth=79
"set colorcolumn=+1

" Do I need this?
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

