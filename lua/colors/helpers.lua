M = {}

M.tokyonight = function(style)
    vim.g.tokyonight_style = style
    vim.cmd [[colorscheme tokyonight]]
end

M.gruvbox = function(background, intensity, palette)
    vim.o.background = background
    vim.api.nvim_set_var("gruvbox_material_background", intensity)
    vim.api.nvim_set_var("gruvbox_material_palette", palette)
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

M.material = function(style)
    vim.g.material_style = style
    require("material").setup()
end

M.catppucino = function(style)
    require("catppuccino").setup(
        {
            colorscheme = style,
            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true
                },
                lsp_trouble = true,
                gitsigns = true,
                telescope = true,
                which_key = true,
                indent_blankline = {
                    enabled = true
                },
                neogit = true,
                bufferline = true,
                lightspeed = true
            }
        }
    )

    vim.cmd [[colorscheme catppuccino]]
end
return M
