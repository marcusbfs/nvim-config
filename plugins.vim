call plug#begin(stdpath('config') . '/plugged')

" Colorschemes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

" UI
Plug 'machakann/vim-highlightedyank'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Navigation
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Auto-completion
" Plug 'nvim-lua/completion-nvim'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'

" Lang
" Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Utils
Plug 'scrooloose/nerdcommenter'

call plug#end()

" === Set colorscheme ===
colorscheme gruvbox

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
nnoremap <leader>nt :NERDTree<cr>

" === Easy Align ===
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"

" === Fzf ===
nnoremap <leader>bo :Buffers <cr>
nnoremap <leader>fo :Files <cr>

