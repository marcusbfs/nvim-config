call plug#begin(stdpath('config') . '/plugged')

" Colorschemes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

" UI
Plug 'liuchengxu/vim-which-key'
Plug 'machakann/vim-highlightedyank'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Edit
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " ctrl-n

" Navigation
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align' " ga[ENTER]
Plug 'justinmk/vim-sneak' " s/S

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Auto-completion

" Lang
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Utils
Plug 'scrooloose/nerdcommenter'

call plug#end()

" === Set colorscheme ===
colorscheme gruvbox

" === Airline ===
let g:airline_theme='base16'

" Plugins config

" === Vim sneak ===
let g:sneak#label = 1

" === Nerdcommenter ===
" Disables default mappings
let g:NERDCreateDefaultMappings = 0
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Mapping
nnoremap <leader>; :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <leader>; :call nerdcommenter#Comment(0,"toggle")<CR>

" === Nerdtree ===
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>ntt :NERDTreeToggle<CR>
nnoremap <leader>ntf :NERDTreeFind<CR>
" Some hotkeys in NERDTree buffer:
" o: open/unfold
" m: menu
" s: open in vertical split
" i: open in horizontal split

" === Easy Align ===
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"

" === Fzf ===
nnoremap <leader>bo :Buffers <cr>
nnoremap <leader>fo :Files <cr>

" === which key ===
set timeout 
set timeoutlen=500
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
