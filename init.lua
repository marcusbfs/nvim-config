-- Variables
vimrc_path = vim.fn.stdpath("config") .. "/init.lua"
undo_dir = vim.fn.stdpath("config") .. "/.vim-undo-dir"

local init_modules = {
    "plugins",
    "core"
}

for _, module in ipairs(init_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error loading " .. module .. "\n\n" .. err)
    end
end
