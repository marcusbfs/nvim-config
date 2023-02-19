require "nvim-treesitter.install".compilers = {"clang", "cl"}

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "c",
        "cmake",
        "cpp",
        "go",
        "html",
        "css",
        "scss",
        "javascript",
        "json",
        "lua",
        "python",
        "regex",
        "rust",
        "typescript",
        "vim",
        "julia"
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        disable = {}
    },
    indent = {
        enable = false,
        disable = {}
    },
    autotag = {
        enable = true
    }
}
