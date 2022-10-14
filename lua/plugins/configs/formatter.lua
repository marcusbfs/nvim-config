local formatter = require "formatter"

vim.api.nvim_exec(
    [[
            augroup FormatAutogroup
              autocmd!
              autocmd BufWritePost * FormatWrite
            augroup END
            ]],
    true
)
local remove_carriage_return = function()
    return {
        exe = "sed",
        args = {
            "s/\\r//g"
        },
        stdin = true
    }
end

local prettier_std_function = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--print-width", "88"},
        stdin = true,
        try_node_modules = true
    }
end

formatter.setup(
    {
        filetype = {
            python = {
                -- python -m pipx install autoflake8
                function()
                    return {
                        exe = "autoflake8",
                        args = {
                            "-",
                            "--stdout",
                            "--exit-zero-even-if-changed"
                        },
                        stdin = true
                    }
                end,
                -- python -m pipx install usort
                function()
                    return {
                        exe = "usort",
                        args = {
                            "format",
                            "-"
                        },
                        stdin = true
                    }
                end,
                -- remove carriage return caused by previous steps
                remove_carriage_return,
                -- python -m pipx install black
                function()
                    return {
                        exe = "black",
                        args = {"-"},
                        stdin = true
                    }
                end
            },
            rust = {
                -- Rustfmt
                function()
                    return {
                        exe = "rustfmt",
                        args = {"--emit=stdout"},
                        stdin = true
                    }
                end
            },
            lua = {
                -- npm install lua-fmt -g
                function()
                    return {
                        exe = "luafmt",
                        args = {"--indent-count", 4, "--stdin"},
                        stdin = true
                    }
                end
            },
            cpp = {
                -- clang-format
                function()
                    return {
                        exe = "clang-format",
                        stdin = true
                    }
                end
            },
            html = {
                prettier_std_function
            },
            css = {
                prettier_std_function
            },
            sass = {
                prettier_std_function
            },
            scss = {
                prettier_std_function
            },
            typescript = {
                prettier_std_function
            },
            javascript = {
                prettier_std_function
            },
            typescriptreact = {
                prettier_std_function
            },
            javascriptreact = {
                prettier_std_function
            },
            go = {
                -- gofmt - installed with golang
                function()
                    return {
                        exe = "gofmt",
                        stdin = true
                    }
                end
            }
        }
    }
)
