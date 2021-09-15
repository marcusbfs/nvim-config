require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        use_languagetree = true,
        disable = {}
    },
    indent = {
        enable = false,
        disable = {}
    },
    ensure_installed = {
        "toml",
        "json",
        "yaml",
        "cpp",
        "rust",
        "python",
        "lua",
        "regex",
        "cmake",
        "vim"
    }
}
