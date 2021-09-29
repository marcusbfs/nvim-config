require "nvim-treesitter.install".compilers = {"clang", "cl"}

require("nvim-treesitter.configs").setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,
        use_languagetree = true,
        disable = {}
    },
    indent = {
        enable = false,
        disable = {}
    }
}
