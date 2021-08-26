" Leaderkey
let mapleader = "\<Space>"
let maplocalleader = ','

set nocompatible
filetype off

colorscheme evening

"--- Plugins ---"
call plug#begin(stdpath('config') . '/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

filetype plugin indent on

" Nerd comments

" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Cursors
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
" Reset cursor after exiting vim
au VimLeave * set guicursor=a:ver10-blinkon0


"--- Remaps and functions ---"
" easyalign maps
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"
noremap <leader>u :w<Home>silent <End> !urlview<CR>
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
nnoremap ; :
nnoremap Y y$
" Edit .vimrc
nnoremap <leader>ev :e i<cr>
" Reload ~/.vimrc present in buffer
nmap <leader>sop :w<cr>:source %<cr>
" Rename a variable
nnoremap <leader>ren *:%s/<c-r>///g<left><left>
" Save
nmap <silent> <leader>w :w<CR>
" Quit
nmap <silent> <leader>q :q<CR>
" Rainbow parentheses plugin
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" Navigation between panes and windows
nnoremap <leader>vne :vne<cr>
nnoremap H <c-w>h
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap L <c-w>l
" Change buffers
nnoremap <leader>l :ls<cr>:b<space>
" Relesct when using ">" or "<" in vmode
vnoremap < <gv
vnoremap > >gv

"--- Other configurations ---"
syntax enable

" Esquema de cores
let g:kolor_italic=1                    " Enable italic. Default: 1
let g:kolor_bold=1                      " Enable bold. Default: 1
let g:kolor_underlined=0                " Enable underline. Default: 0
let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0

" Remove white spaces when saving
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
autocmd BufWritePre * :call StripWhitespace()

"set textwidth=79
"set colorcolumn=+1

set encoding=utf8
set fileencoding=utf8
set ffs=unix,dos,mac
set number

set relativenumber

set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Ident
set si
set wrap

set path+=**
set wildmenu

set hidden

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 1
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set incsearch

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

autocmd FileType tex :NoMatchParen
au FileType tex setlocal nocursorline

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
