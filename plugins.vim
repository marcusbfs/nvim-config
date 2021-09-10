call plug#begin(stdpath('config') . '/plugged')

" Colorschemes
" Plug 'dracula/vim', { 'as': 'dracula' }

" UI
Plug 'liuchengxu/vim-which-key'
Plug 'machakann/vim-highlightedyank'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'akinsho/bufferline.nvim'

" Edit
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " ctrl-n
Plug 'scrooloose/nerdcommenter'

" Depends on termcolor
if has('termguicolors')
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'sainnhe/gruvbox-material'
endif

" Navigation
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' 
Plug 'junegunn/vim-easy-align' " ga[ENTER]
Plug 'justinmk/vim-sneak' " s/S

Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Auto-completion

" Lang
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Utils
Plug 'famiu/bufdelete.nvim'
Plug 'AckslD/nvim-neoclip.lua'

call plug#end()

" === Set colorscheme ===
" colorscheme gruvbox

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

" === Telescope ===
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" === which key ===
set timeout 
set timeoutlen=1000
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

" === bufdelete ===
nnoremap <leader>bd :Bdelete <cr>

" === Color stuff ===
if has('termguicolors')
    " === colorizer ===  
    lua require'colorizer'.setup()
    " ===  ===  
    set background=dark
    let g:gruvbox_material_background = 'medium'
    let g:gruvbox_material_palette = 'original'
    colorscheme gruvbox-material
endif

" === Bufferline ===
lua << EOF
require("bufferline").setup{}
EOF

nnoremap <silent> <A-.>  ::BufferLineCycleNext<CR>
nnoremap <silent> <A-,>  :BufferLineCyclePrev<CR>
nnoremap <silent> <A-1> <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent> <A-2> <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent> <A-3> <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent> <A-4> <Cmd>BufferLineGoToBuffer 4<CR>

" === Dev Icons ===
lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF

" === neoclip ===
lua require('neoclip').setup()
nnoremap <silent> <leader>fy :Telescope neoclip <cr>
