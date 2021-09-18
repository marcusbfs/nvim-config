-- Lua file to manage colorschemes
-- Options:
-- tokyonight
-- gruvbox_material

vim.g.my_colorscheme = "gruvbox_material"

M = {}

-- vim.g.my_colorscheme = "tokyonight"
vim.g.my_colorscheme = vim.g.my_colorscheme

-- Set up
M.options = {"tokyonight", "gruvbox_material"}

local function has_value(tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

if not has_value(M.options, vim.g.my_colorscheme) then
    error("Colorscheme " .. vim.g.my_colorscheme .. " is not valid")
end

M.origin_name = function()
    if vim.g.my_colorscheme == "tokyonight" then
        return "folke/tokyonight.nvim"
    elseif vim.g.my_colorscheme == "gruvbox_material" then
        return "sainnhe/gruvbox-material"
    else
        error("Colorscheme " .. vim.g.my_colorscheme .. " is not valid")
    end
end

M.config = function()
    print("Beginning to config")
    print(vim.g.my_colorscheme)
    if vim.g.my_colorscheme == "tokyonight" then
        print("Lua selected")
        vim.cmd [[colorscheme tokyonight]]
        print("Called command")
    elseif vim.g.my_colorscheme == "gruvbox_material" then
        vim.o.background = "dark"
        vim.api.nvim_set_var("gruvbox_material_background", "medium")
        vim.api.nvim_set_var("gruvbox_material_palette", "original")
        vim.fn.execute("colorscheme gruvbox-material")
    else
        error("Colorscheme " .. "gruvbox_material" .. " is not valid")
    end
end

return M
