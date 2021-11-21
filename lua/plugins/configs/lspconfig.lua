local nvim_lsp = require "lspconfig"
local on_attach = require("core.mappings").on_attach
local capabilities = require("plugins.configs.lsp_capabilities").capabilities

local servers = {
    -- npm install -g pyright
    "pyright",
    -- https://clangd.llvm.org/installation
    "clangd",
    -- npm install -g typescript typescript-language-server
    "tsserver",
    -- pipx install cmake-language-server
    "cmake",
    -- go install golang.org/x/tools/gopls@latest
    "gopls"
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup(
        {
            on_attach = on_attach,
            capabilities = capabilities,
            -- root_dir = vim.loop.cwd{},
            flags = {
                debounce_text_changes = 150
            }
        }
    )
end

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
    vim.fn.sign_define("LspDiagnosticsSign" .. name, {text = icon, numhl = "LspDiagnosticsDefault" .. name})
end

lspSymbol("Error", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")
lspSymbol("Warning", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = {
            prefix = "",
            spacing = 0
        },
        signs = true,
        underline = true,
        update_in_insert = false -- update diagnostics insert mode
    }
)
vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(
    vim.lsp.handlers.hover,
    {
        border = "single"
    }
)
vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
        border = "single"
    }
)

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
    if msg:match "exit code" then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({{msg}}, true, {})
    end
end
