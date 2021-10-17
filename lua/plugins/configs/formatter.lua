local formatter = require "formatter"

vim.api.nvim_exec(
    [[
            augroup FormatAutogroup
              autocmd!
              autocmd BufWritePost *.py,*.rs,*.lua,*.ts,*.js,*.tsx,*.jsx FormatWrite
            augroup END
            ]],
    true
)

formatter.setup(
    {
        filetype = {
            python = {
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
            typescript = {
                -- npm install -g prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                        stdin = true
                    }
                end
            },
            javascript = {
                -- npm install -g prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                        stdin = true
                    }
                end
            },
            typescriptreact = {
                -- npm install -g prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                        stdin = true
                    }
                end
            },
            javascriptreact = {
                -- npm install -g prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                        stdin = true
                    }
                end
            }
        }
    }
)
