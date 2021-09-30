vim.cmd [[ augroup MBFS ]]
vim.cmd [[ autocmd! ]]
-- Don't show any numbers inside terminals
vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]
--- Trim whitespace after saving a file
vim.cmd [[ autocmd BufWritePre * lua require("core.functions").mbfs_trim_whitespace() ]]
-- Set textwidth for markdown
vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=300} ]]
-- vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false} ]]
-- Highlight on yank
vim.cmd [[ autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000) ]]
vim.cmd [[ augroup END ]]
