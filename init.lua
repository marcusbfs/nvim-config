-- Variables
vimrc_path = vim.fn.stdpath("config") .. "/init.lua"
undo_dir = vim.fn.stdpath("data") .. "/.vim-undo-dir"

pcall(require, "impatient")

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
