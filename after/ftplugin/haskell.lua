local Path = require("plenary.path")
local config_path = vim.fn.stdpath("config")
local fourmolu_orig = Path:new(config_path .. "\\.formatter_config\\fourmolu.yaml\\")
local fourmolu_dest = Path:new(config_path .. "\\..\\..\\Roaming\\fourmolu.yaml")

vim.api.nvim_create_user_command("FourmoluUpdateConfigCopy", function(opts)
	if vim.fn.has("win32") then
		fourmolu_orig.copy(fourmolu_orig, { destination = fourmolu_dest })
	end
end, {})

if vim.fn.has("win32") then
	if fourmolu_dest.exists(fourmolu_dest) then
	else
		vim.cmd.Upper("FourmoluUpdateConfigCopy")
	end
end

local ht = require("haskell-tools")
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts)
-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set("n", "<leader>hs", ht.hoogle.hoogle_signature, opts)
-- Evaluate all code snippets
vim.keymap.set("n", "<leader>ea", ht.lsp.buf_eval_all, opts)
-- Toggle a GHCi repl for the current package
vim.keymap.set("n", "<leader>rr", ht.repl.toggle, opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set("n", "<leader>rf", function()
	ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, opts)
vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)
