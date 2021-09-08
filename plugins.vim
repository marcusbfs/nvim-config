call plug#begin(stdpath('config') . '/plugged')

" Colorschemes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

" UI
Plug 'machakann/vim-highlightedyank'

" Navigation
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/vim-easy-align'

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'
Plug 'andymass/vim-matchup'

" Lang
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'

" Utils
Plug 'scrooloose/nerdcommenter'

call plug#end()

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
vnoremap <leader>; :call nerdcommenter#Comment(0,"toggle")<CR> gv

" === Easy Align ===
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"

" === Fzf ===
nnoremap <leader>bo :Buffers <cr>
nnoremap <leader>fo :Files <cr>

" === Rust ===
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" === Set colorscheme ===
colorscheme gruvbox
