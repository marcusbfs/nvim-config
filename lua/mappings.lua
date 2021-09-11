--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Edit .vimrc
vim.fn.execute("nnoremap <silent> <leader>ev :edit " .. vimrc_path .. " <cr>")

-- Reload ~/.vimrc
vim.fn.execute("nnoremap <leader>sop :source " .. vimrc_path .. "<cr>")

-- Save current buffer
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true})

-- Quit
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true})

-- can i stop using escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true})

-- Yank entire line
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true, silent = true})

-- Reselect when using ">" or "<" in vmode
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Navigation between buffers
vim.api.nvim_set_keymap('n', '<leader>bl', '<c-^>', {noremap = true, silent = true})

-- Split panes
vim.api.nvim_set_keymap('n', '<leader>wsh', ':vertical split <cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wsv', ':split <cr>', {noremap = true, silent = true})

-- Navigation between panes
vim.api.nvim_set_keymap('n', 'H', '<c-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'L', '<c-w>l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'J', '<c-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', '<c-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-H>', '<c-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-L>', '<c-w>l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-J>', '<c-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-K>', '<c-w>k', {noremap = true, silent = true})


-- Resize panes
vim.api.nvim_set_keymap('n', '<leader>wrl', ':vertical resize +10 <cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wrh', ':vertical resize -10 <cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wrk', ':resize +10 <cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wrj', ':resize -10 <cr>', {noremap = true, silent = true})

-- Tabs
vim.api.nvim_set_keymap('n', '<leader>tc', ':tabclose <cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>te', ':tabedit <cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnext <cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tp', ':tabprevious <cr>', {noremap = true, silent = true})

-- Copy visual to system clipboard
vim.api.nvim_set_keymap('v', '<c-c>', '"+y', {noremap = true, silent = true})

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })


-- Plugin related mapping
-- Packer
vim.api.nvim_set_keymap('n', '<leader>ps', ":PackerSync<cr>", { noremap = true, silent = true })

-- nvim-comment
vim.api.nvim_set_keymap('n', '<leader>;', ":CommentToggle <cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>;', ":CommentToggle <cr>", { noremap = true, silent = true })

-- Telescope 
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true, silent = true})

-- Easy Align
-- Start interactive EasyAlign in visual mode (e.g. vipga)
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {silent = true})
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)"', {silent = true})

-- bufdelete
vim.api.nvim_set_keymap('n', '<leader>bd', ':Bdelete <cr>', {noremap = true, silent = true})

-- neoclip
vim.api.nvim_set_keymap('n', '<leader>fy', ':Telescope neoclip unnamed <cr>', {noremap = true, silent = true})

-- Nerdtree
vim.api.nvim_set_keymap('n', '<leader>nt', ':NERDTree<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ntt', ':NERDTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ntf', ':NERDTreeFind<CR>', {noremap = true, silent = true})
-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.fn.execute("autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")
-- Some hotkeys in NERDTree buffer:
-- o: open/unfold
-- m: open menu
-- s: open in vertical split
-- i: open in horizontal split

-- Bufferline
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-,>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', {noremap = true, silent = true})
