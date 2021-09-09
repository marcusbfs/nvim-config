" Leaderkey
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" Set vimrc path
let vimrc_path = stdpath('config') . '/init.vim'

" Source other files
runtime options.vim
runtime plugins.vim
runtime remaps.vim

" === LSP configuration ===
runtime coc.vim
runtime treesitter.vim
