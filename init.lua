-- Paths
vimrc_path = vim.fn.stdpath('config') .. "/init.lua"
undo_dir = vim.fn.stdpath('config') .. "/.vim-undo-dir"

require('plugins')
require('settings')
require('mappings')

-- Plugins setup

