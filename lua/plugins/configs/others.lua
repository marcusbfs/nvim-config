local M = {}

M.autopairs = function()
    require("nvim-autopairs").setup {}
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))

    -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
    -- cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
end

M.blankline = function()
    require("indent_blankline").setup {
        indentLine_enabled = 1,
        char = "▏",
        filetype_exclude = {
            "help",
            "terminal",
            "dashboard",
            "packer",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults"
        },
        buftype_exclude = {"terminal"},
        show_trailing_blankline_indent = false,
        show_first_indent_level = false
    }
end

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if present then
        colorizer.setup(
            {"*"},
            {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = false, -- "Name" codes like Blue
                RRGGBBAA = false, -- #RRGGBBAA hex codes
                rgb_fn = false, -- CSS rgb() and rgba() functions
                hsl_fn = false, -- CSS hsl() and hsla() functions
                css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode = "background" -- Set the display mode.
            }
        )
        vim.cmd "ColorizerReloadAllBuffers"
    end
end

M.comment = function()
    local comment = require("kommentary.config")
    comment.configure_language(
        "default",
        {
            prefer_single_line_comments = true
        }
    )
end

M.luasnip = function()
    local luasnip = require "luasnip"

    luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI"
    }
    require("luasnip.loaders.from_vscode").load {}
end

M.signature = function()
    local present, lspsignature = pcall(require, "lsp_signature")
    if present then
        lspsignature.setup {
            bind = true,
            doc_lines = 2,
            floating_window = true,
            fix_pos = true,
            hint_enable = true,
            hint_prefix = " ",
            hint_scheme = "String",
            hi_parameter = "Search",
            max_height = 22,
            max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
            handler_opts = {
                border = "single" -- double, single, shadow, none
            },
            zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
            padding = "" -- character to pad on left and right of signature can be ' ', or '|'  etc
        }
    end
end

M.neogit = function()
    local present, neogit = pcall(require, "neogit")
    if not present then
        return
    end
    neogit.setup {}
end

M.nvim_window = function()
    local present, nvim_window = pcall(require, "nvim-window")
    if not present then
        return
    end
    nvim_window.setup {}
end

M.lsptrouble = function()
    local trouble = require "trouble"
    trouble.setup {}
end

M.better_escape = function()
    vim.g.better_escape_interval = 200
    vim.fn.execute("let g:better_escape_shortcut = ['jk', 'kj']")
end

M.projectnvim = function()
    require("project_nvim").setup {}
end

M.lightbulb = function()
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
end

M.todo_comments = function()
    require("todo-comments").setup {}
end

M.bqf = function()
    require("bqf").setup()
end

M.twilight = function()
    require("twilight").setup {}
end

M.harpoon = function()
    require("harpoon").setup()
end

M.rainbow = function()
    require("nvim-treesitter.configs").setup {
        rainbow = {
            enable = true,
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        }
    }
end

M.autotag = function()
    require("nvim-ts-autotag").setup()
end

M.neogen = function()
    require('neogen').setup {}
end

return M
