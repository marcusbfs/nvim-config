require "nvim-treesitter.install".compilers = {"clang", "cl"}

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "vim",
        "lua",
        "json",
        "c",
        "cpp",
        "python",
        "rust",
        "regex",
        "html",
        "cmake"
    },
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
