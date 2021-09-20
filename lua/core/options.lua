-- GUI font
vim.fn.execute("set guifont=CaskaydiaCove\\ NF:h13")

-- Terminal colors
vim.o.termguicolors = true

-- Relative numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true

-- Tab
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true

-- Enable mouse
vim.o.mouse = "a"

-- Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

-- Wrap test visually only - does not affects the buffer
vim.o.wrap = true

-- Identantion
vim.o.autoindent = true

-- Search
vim.o.incsearch = true

-- Changed files
vim.o.autoread = true

-- Cursors
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- ... and reset cursor after exiting
vim.fn.execute("au VimLeave * set guicursor=a:ver10-blinkon0")

-- Text width
-- vim.o.textwidth = 79
-- vim.o.colorcolumn = vim.o.colorcolumn + 1

-- Undo options
if (not vim.fn.isdirectory(undo_dir)) then
    vim.fn.execute('call mkdir(undo_dir, "", 0700)')
end
vim.fn.execute("set undodir=" .. undo_dir)
vim.opt.undofile = true

-- Do I need this?
vim.fn.execute("set noerrorbells visualbell t_vb=")
vim.fn.execute("autocmd GUIEnter * set visualbell t_vb=")

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set terminal options
vim.fn.execute(":command Term term cmd.exe /k " .. os.getenv("CMDER_ROOT") .. "\\vendor\\init.bat")

-- Plugins settings
vim.api.nvim_set_var("sneak#label", "1")

-- disable some builtin vim plugins
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
