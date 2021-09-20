M = {}

M.tokyonight = function(style)
    vim.g.tokyonight_style = style
    vim.cmd [[colorscheme tokyonight]]
end

M.gruvbox = function(background, intensity)
    vim.o.background = background
    vim.api.nvim_set_var("gruvbox_material_background", intensity)
    vim.api.nvim_set_var("gruvbox_material_palette", "material")
    vim.cmd [[colorscheme gruvbox-material]]
end

M.onedark = function(style)
    if style ~= "default" then
        vim.fn.execute("let g:onedark_style = '" .. style .. "'")
    end
    vim.cmd [[colorscheme onedark]]
end

M.ayu = function(style)
    vim.g.ayucolor = style
    vim.cmd [[colorscheme ayu]]
end

M.papercolor = function(style)
    vim.o.background = style
    vim.cmd [[colorscheme PaperColor]]
end

M.nightfox = function(style)
    local nightfox = require("nightfox")
    nightfox.setup(
        {
            fox = style
        }
    )
    nightfox.load()
end

return M
