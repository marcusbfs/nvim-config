local M = {}

M.autopairs = function()
    require("nvim-autopairs").setup()
    require("nvim-autopairs.completion.cmp").setup(
        {
            map_cr = true, --  map <CR> on insert mode
            map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
            auto_select = true, -- automatically select the first item
            insert = false, -- use insert confirm behavior instead of replace
            map_char = {
                -- modifies the function or method delimiter by filetypes
                all = "(",
                tex = "{"
            }
        }
    )
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
    local present, nvim_comment = pcall(require, "nvim_comment")
    if present then
        nvim_comment.setup()
    end
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

M.lspsaga = function()
    local saga = require "lspsaga"
    saga.init_lsp_saga()
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

return M
