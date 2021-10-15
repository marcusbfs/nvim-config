vim.cmd [[ augroup MBFS ]]
vim.cmd [[ autocmd! ]]

-- Don't show any numbers inside terminals
vim.cmd [[ autocmd TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

--- Trim whitespace after saving a file
vim.cmd [[ autocmd BufWritePre * lua require("core.functions").mbfs_trim_whitespace() ]]

-- Set textwidth for markdown
vim.cmd [[ autocmd bufreadpre *.md setlocal textwidth=88 ]]

-- Highlight on yank
-- vim.cmd [[ autocmd TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false} ]]
vim.cmd [[ autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=300} ]]

vim.cmd [[ augroup END ]]
