-- To use this, please go to stdpath('data') and
--
-- > git clone https://github.com/sumneko/lua-language-server
-- > cd 3rd\luamake
-- > compile\install
-- > cd ..\..
-- > 3rd\luamake\luamake.exe rebuild
--
-- ninja is required to build.

local on_attach = require("core.mappings").on_attach
local capabilities = require("plugins.configs.lsp_capabilities").capabilities

-- Helper functions that locates lua command
local cache_location = vim.fn.stdpath("data")
local bin_folder = jit.os

local nlua_nvim_lsp = {
    base_directory = string.format("%s/lua-language-server/", cache_location),
    bin_location = string.format("%s/lua-language-server/bin/%s/lua-language-server", cache_location, bin_folder)
}

local sumneko_command = function()
    return {
        nlua_nvim_lsp.bin_location,
        "-E",
        string.format("%s/main.lua", nlua_nvim_lsp.base_directory)
    }
end

require("nlua.lsp.nvim").setup(
    require("lspconfig"),
    {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = sumneko_command(),
        -- Include globals you want to tell the LSP are real :)
        globals = {
            -- Colorbuddy
            "Color",
            "c",
            "Group",
            "g",
            "s"
        }
    }
)
