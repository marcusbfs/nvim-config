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
        map("n", "<Esc>", ":noh <CR>", {noremap = true, silent = true})

        --Remap for dealing with word wrap
        map("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
        map("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

        -- Edit .vimrc
        vim.fn.execute("nnoremap <silent> <leader>ev :edit " .. vimrc_path .. " <cr>")

        -- Reload ~/.vimrc
        vim.fn.execute("nnoremap <leader>sop :source " .. vimrc_path .. "<cr>")

        -- Save current buffer
        map("n", "<leader>w", ":w<CR>", {noremap = true, silent = true})

        -- Quit
        map("n", "<leader>q", ":q<CR>", {noremap = true, silent = true})

        -- can i stop using escape
        map("i", "jk", "<ESC>", {noremap = true, silent = true})
        map("i", "kj", "<ESC>", {noremap = true, silent = true})
        map("i", "jj", "<ESC>", {noremap = true, silent = true})

        -- Yank entire line
        map("n", "Y", "y$", {noremap = true, silent = true})

        -- Reselect when using ">" or "<" in vmode
        map("v", "<", "<gv", {noremap = true, silent = true})
        map("v", ">", ">gv", {noremap = true, silent = true})

        -- Navigation between buffers
        map("n", "<leader>bl", "<c-^>", {noremap = true, silent = true})

        -- Split panes
        map("n", "<leader>wsh", ":vertical split <cr>", {noremap = true, silent = true})
        map("n", "<leader>wsv", ":split <cr>", {noremap = true, silent = true})

        -- Navigation between panes
        map("n", "H", "<c-w>h", {noremap = true, silent = true})
        map("n", "L", "<c-w>l", {noremap = true, silent = true})
        map("n", "J", "<c-w>j", {noremap = true, silent = true})
        map("n", "K", "<c-w>k", {noremap = true, silent = true})
        map("n", "<c-H>", "<c-w>h", {noremap = true, silent = true})
        map("n", "<c-L>", "<c-w>l", {noremap = true, silent = true})
        map("n", "<c-J>", "<c-w>j", {noremap = true, silent = true})
        map("n", "<c-K>", "<c-w>k", {noremap = true, silent = true})

        -- Tabs
        map("n", "<leader>tc", ":tabclose <cr>", {noremap = true, silent = true})
        map("n", "<leader>te", ":tabedit <cr>", {noremap = true, silent = true})
        map("n", "<leader>tn", ":tabnext <cr>", {noremap = true, silent = true})
        map("n", "<leader>tp", ":tabprevious <cr>", {noremap = true, silent = true})

        -- Copy visual to system clipboard
        common_map("v", "<c-c>", '"+y')
        common_map("i", "<c-v>", '<esc>"+p')
        common_map("n", "<c-v>", '"+p')

        --Remap for dealing with word wrap
        map("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
        map("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

        -- Packer
        map("n", "<leader>ps", ":PackerSync<cr>", {noremap = true, silent = true})

        -- Use <esc> in terminal mode
        map("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})

        -- Terminal things
        map("n", "<leader>To", ":Term<cr>", {noremap = true, silent = true})
        map("n", "<leader>Tc", ":bdelete!<cr>", {noremap = true, silent = true})
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
end

-- neoclip
M.neoclip = function()
    common_map("n", "<leader>fy", "<cmd>lua require('telescope').extensions.neoclip.unnamed()<cr>")
end

-- nvim-comment
M.comment = function()
    map("n", "<leader>;", ":CommentToggle <cr>", {noremap = true, silent = true})
    map("v", "<leader>;", ":CommentToggle <cr>", {noremap = true, silent = true})
end

-- Easy Align
M.easy_align = function()
    -- Start interactive EasyAlign in visual mode (e.g. vipga)
    map("x", "ga", "<Plug>(EasyAlign)", {silent = true})
    -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
    map("n", "ga", '<Plug>(EasyAlign)"', {silent = true})
end

-- bufdelete
M.bufdelete = function()
    map("n", "<leader>bd", ":Bdelete <cr>", {noremap = true, silent = true})
end

-- bufonly
M.bufonly = function()
    common_map("n", "<leader>bD", ":BufOnly <cr>")
end

-- Tree plugin
M.tree = function()
    map("n", "<leader>nt", ":CHADopen<CR>", {noremap = true, silent = true})
    -- quit chadtree if its the last and only buffer
    vim.fn.execute("autocmd BufEnter * if winnr('$') == 1 && &ft=='CHADtree' | quit | endif")
end

-- Bufferline
M.bufferline = function()
    map("n", "<A-.>", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
    map("n", "<A-,>", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})

    for i = 1, 9 do
        map("n", "<A-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", {noremap = true, silent = true})
    end
end

-- Zen mode
M.truezen = function()
    map("n", "<leader>za", ":TZAtaraxis <CR>", {noremap = true, silent = true})
    map("n", "<leader>zf", ":TZFocus <CR>", {noremap = true, silent = true})
    map("n", "<leader>zm", ":TZMinimalist <CR>", {noremap = true, silent = true})
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
    vim.fn.execute('let g:winresizer_start_key="<C-T>"')
    common_map("n", "<C-t>", ":WinResizerStartResize<cr>")
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

return M
