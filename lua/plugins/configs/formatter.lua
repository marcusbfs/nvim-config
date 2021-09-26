local formatter = require "formatter"

vim.api.nvim_exec(
    [[
            augroup FormatAutogroup
              autocmd!
              autocmd BufWritePost *.py,*.rs,*.lua FormatWrite
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
            }
        }
    }
)
