local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local common_map = function(mode, key, command)
    map(mode, key, command, {noremap = true, silent = true})
end

local M = {}

-- these mappings will only be called during initialization
M.misc = function()
    local function non_config_mappings()
        -- use ESC to turn off search highlighting
        common_map("n", "<Esc>", ":noh <CR>")

        --Remap for dealing with word wrap
        map("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
        map("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

        -- Edit .vimrc
        vim.fn.execute("nnoremap <silent> <leader>ev :edit " .. vimrc_path .. " <cr>")

        -- Reload ~/.vimrc
        vim.fn.execute("nnoremap <leader>sop :source " .. vimrc_path .. "<cr>")

        -- Save current buffer
        common_map("n", "<leader>w", ":w<CR>")

        -- Quit
        common_map("n", "<leader>q", ":q<CR>")

        -- Yank entire line
        common_map("n", "Y", "y$")

        -- Reselect when using ">" or "<" in vmode
        common_map("v", "<", "<gv")
        common_map("v", ">", ">gv")

        -- Navigation between buffers
        common_map("n", "<leader>bl", "<c-^>")

        -- Split panes
        common_map("n", "<leader>wsh", ":vertical split <cr>")
        common_map("n", "<leader>wsv", ":split <cr>")

        -- Close all other windows
        common_map("n", "<leader>wO", "<c-w>o")

        -- Navigation between panes
        -- common_map("n", "H", "<c-w>h")
        -- common_map("n", "L", "<c-w>l")
        -- common_map("n", "J", "<c-w>j")
        -- common_map("n", "K", "<c-w>k")
        common_map("n", "<c-H>", "<c-w>h")
        common_map("n", "<c-L>", "<c-w>l")
        common_map("n", "<c-J>", "<c-w>j")
        common_map("n", "<c-K>", "<c-w>k")

        -- Tabs
        common_map("n", "<leader>tc", ":tabclose <cr>")
        common_map("n", "<leader>te", ":tabedit <cr>")
        common_map("n", "<leader>tn", ":tabnext <cr>")
        common_map("n", "<leader>tp", ":tabprevious <cr>")

        -- Copy/paste stuff
        common_map("v", "<c-c>", '"+y')
        common_map("i", "<c-v>", '<esc>"+pa')

        --Remap for dealing with word wrap
        map("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
        map("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

        -- Packer
        common_map("n", "<leader>ps", ":PackerSync<cr>")

        -- Use <esc> in terminal mode
        common_map("t", "<Esc>", "<C-\\><C-n>")

        -- Terminal things
        common_map("n", "<leader>To", ":Term<cr>a")
        common_map("n", "<leader>Tc", ":bdelete!<cr>")

        -- zt and zb "one line off"
        common_map("n", "zt", "zt<c-y>")
        common_map("n", "zb", "zb<c-e>")

        -- buf delete
        common_map("n", "<leader>bd", ":lua require('core.utils').close_buffer() <cr>")

        -- undo breakpoints
        common_map("i", ",", ",<c-g>u")
        common_map("i", ".", ".<c-g>u")
        common_map("i", "!", "!<c-g>u")
        common_map("i", "?", "?<c-g>u")
    end

    local function commands()
        -- Add Packer commands because we are not loading it at startup
        cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
        cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
        cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
        cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
        cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
        cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
    end

    non_config_mappings()
    commands()
end

-- below are all plugin related mappings

-- telescope
M.telescope = function()
    common_map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
    common_map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
    common_map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
    common_map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
    common_map("n", "<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>")
    common_map("n", "<leader>fv", "<cmd>lua require('core.functions').mbfs_telescope_nvim_config_find_file()<cr>")
end

-- neoclip
M.neoclip = function()
    common_map("n", "<leader>fy", "<cmd>lua require('telescope').extensions.neoclip.unnamed()<cr>")
end

-- nvim-comment
M.comment = function()
    common_map("n", "<leader>;", ":CommentToggle <cr>")
    common_map("v", "<leader>;", ":CommentToggle <cr>")
end

-- Easy Align
M.easy_align = function()
    -- Start interactive EasyAlign in visual mode (e.g. vipga)
    map("x", "ga", "<Plug>(EasyAlign)", {silent = true})
    -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
    map("n", "ga", '<Plug>(EasyAlign)"', {silent = true})
end

-- bufonly
M.bufonly = function()
    common_map("n", "<leader>bD", ":BufOnly <cr>")
end

-- Tree plugin
M.tree = function()
    common_map("n", "<leader>nt", ":CHADopen<CR>")
    -- quit chadtree if its the last and only buffer
    vim.fn.execute("autocmd BufEnter * if winnr('$') == 1 && &ft=='CHADtree' | quit | endif")
end

-- Bufferline
M.bufferline = function()
    common_map("n", "<A-.>", ":BufferLineCycleNext<CR>")
    common_map("n", "<A-,>", ":BufferLineCyclePrev<CR>")

    for i = 1, 9 do
        common_map("n", "<A-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>")
    end
end

-- Zen mode
M.truezen = function()
    common_map("n", "<leader>za", ":TZAtaraxis <CR>")
    common_map("n", "<leader>zf", ":TZFocus <CR>")
    common_map("n", "<leader>zm", ":TZMinimalist <CR>")
end

-- Lsp on_attach keybindings
M.on_attach = function(_, bufnr)
    -- M.on_attach = function ()
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    -- buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    buf_set_keymap("n", "<space>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
    buf_set_keymap("v", "<space>ca", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
end

-- formatter
M.formatter = function()
    common_map("n", "<leader>fC", ":Format<cr>")
end

-- neogit
M.neogit = function()
    common_map("n", "<leader>gg", ":Neogit<cr>")
end

-- nvim-window
M.nvim_window = function()
    common_map("n", "<leader>wp", ":lua require('nvim-window').pick()<CR>")
end

-- monaqa/dial.nvim
M.dial = function()
    map("n", "<C-a>", "<Plug>(dial-increment)", {silent = true})
    map("n", "<C-x>", "<Plug>(dial-decrement)", {silent = true})
    map("v", "<C-a>", "<Plug>(dial-increment)", {silent = true})
    map("v", "<C-x>", "<Plug>(dial-decrement)", {silent = true})
    map("v", "g<C-a>", "<Plug>(dial-increment-additional)", {silent = true})
    map("v", "g<C-x>", "<Plug>(dial-decrement-additional)", {silent = true})
end

-- winresizer
M.winresizer = function()
    -- this is required to prevent remap of <C-e>
    vim.fn.execute('let g:winresizer_start_key="<space>wR"')
    common_map("n", "<leader>wR", ":WinResizerStartResize<cr>")
end

-- nvim-maximize-window-toggle
M.nvim_maximize_window_toggle = function()
    common_map("n", "<leader>wt", ":ToggleOnly<cr>")
end

-- startify
M.startify = function()
    common_map("n", "<leader>ss", ":SSave<cr>")
    common_map("n", "<leader>sl", ":SLoad<cr>")
    common_map("n", "<leader>sd", ":SDelete<cr>")
end

-- harpoon
M.harpoon = function()
    common_map("n", "<leader>hm", ':lua require("harpoon.mark").add_file()<cr>')
    common_map("n", "<leader>hl", ':lua require("harpoon.ui").toggle_quick_menu()<cr>')
end

return M
