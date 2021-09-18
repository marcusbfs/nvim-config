local present, packer = pcall(require, "plugins.packerInit")

if not present then
    return false
end

local use = packer.use

return packer.startup(
    function()
        -- Packer can manage itself
        use {
            "wbthomason/packer.nvim",
            event = "VimEnter"
        }

        use {
            "nvim-lua/plenary.nvim"
        }

        use {
            "nvim-lua/popup.nvim"
        }

        use {
            "kyazdani42/nvim-web-devicons",
            after = "packer.nvim",
            config = function()
                require "plugins.configs.icons"
            end
        }

        use {
            "famiu/feline.nvim",
            after = "nvim-web-devicons",
            config = function()
                require "plugins.configs.statusline"
            end
        }

        use {
            "akinsho/bufferline.nvim",
            after = "nvim-web-devicons",
            config = function()
                require "plugins.configs.bufferline"
            end,
            setup = function()
                require("core.mappings").bufferline()
            end
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            config = function()
                require("plugins.configs.others").blankline()
            end
        }

        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function()
                require("plugins.configs.others").colorizer()
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            event = "BufRead",
            config = function()
                require "plugins.configs.treesitter"
            end
        }

        -- git stuff
        use {
            "lewis6991/gitsigns.nvim",
            opt = true,
            config = function()
                require "plugins.configs.gitsigns"
            end,
            setup = function()
                require("core.utils").packer_lazy_load "gitsigns.nvim"
            end
        }

        use {
            "machakann/vim-highlightedyank",
            event = "TextYankPost"
        }

        use {
            "TimUntersberger/neogit",
            cmd = "Neogit",
            setup = function()
                require("core.mappings").neogit()
            end,
            config = function()
                require("plugins.configs.others").neogit()
            end
        }

        -- lsp stuff
        use {
            "neovim/nvim-lspconfig",
            ft = {"rust", "python", "lua", "cpp"},
            setup = function()
                require("core.utils").packer_lazy_load "nvim-lspconfig"
                -- reload the current file so lsp actually starts for it
                vim.defer_fn(
                    function()
                        vim.cmd "silent! e %"
                    end,
                    0
                )
            end,
            config = function()
                require "plugins.configs.lspconfig"
            end
        }

        use {
            "ray-x/lsp_signature.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("plugins.configs.others").signature()
            end
        }
        use {
            "glepnir/lspsaga.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("plugins.configs.others").lspsaga()
            end
        }

        use {
            "andymass/vim-matchup",
            opt = true,
            setup = function()
                require("core.utils").packer_lazy_load "vim-matchup"
            end
        }

        -- load luasnips + cmp related in insert mode only
        use {
            "rafamadriz/friendly-snippets",
            event = "InsertEnter"
        }

        use {
            "hrsh7th/nvim-cmp",
            after = "friendly-snippets",
            config = function()
                require "plugins.configs.cmp"
            end
        }

        use {
            "L3MON4D3/LuaSnip",
            wants = "friendly-snippets",
            after = "nvim-cmp",
            config = function()
                require("plugins.configs.others").luasnip()
            end
        }

        use {
            "saadparwaiz1/cmp_luasnip",
            after = "LuaSnip"
        }

        use {
            "hrsh7th/cmp-nvim-lua",
            after = "cmp_luasnip"
        }

        use {
            "hrsh7th/cmp-nvim-lsp",
            after = "cmp-nvim-lua"
        }

        use {
            "hrsh7th/cmp-buffer",
            after = "cmp-nvim-lsp"
        }

        -- lang specific
        use {
            "simrat39/rust-tools.nvim",
            after = "nvim-lspconfig",
            config = function()
                require "plugins.configs.rusttools"
            end
        }

        use {
            "tjdevries/nlua.nvim",
            after = "nvim-lspconfig",
            config = function()
                require "plugins.configs.nlua"
            end
        }

        -- misc plugins
        use {
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require("plugins.configs.others").autopairs()
            end
        }

        use {"mg979/vim-visual-multi"}

        use {
            "terrortylor/nvim-comment",
            cmd = "CommentToggle",
            config = function()
                require("plugins.configs.others").comment()
            end,
            setup = function()
                require("core.mappings").comment()
            end
        }

        use {
            "nvim-telescope/telescope.nvim",
            config = function()
                require "plugins.configs.telescope"
            end,
            setup = function()
                require("core.mappings").telescope()
            end
        }

        use {
            "AckslD/nvim-neoclip.lua",
            cmd = "Telescope",
            event = "TextYankPost",
            after = "telescope.nvim",
            config = function()
                require("neoclip").setup()
            end,
            setup = function()
                require("core.mappings").neoclip()
            end
        }

        use {
            "Pocco81/TrueZen.nvim",
            cmd = {
                "TZAtaraxis",
                "TZMinimalist",
                "TZFocus"
            },
            config = function()
                require "plugins.configs.zenmode"
            end,
            setup = function()
                require("core.mappings").truezen()
            end
        }

        use {
            require("colors").origin_name(),
            config = function()
                require("colors").config()
            end
        }

        use {
            "junegunn/vim-easy-align",
            setup = function()
                require("core.mappings").easy_align()
            end
        }

        use "justinmk/vim-sneak"

        use {
            "ms-jpq/chadtree",
            branch = "chad",
            cmd = {
                "CHADopen"
            },
            setup = function()
                require("core.mappings").tree()
            end
        }

        use {
            "mhartington/formatter.nvim",
            cmd = {"Format", "FormatWrite"},
            ft = {"python", "lua", "rust", "cpp"},
            config = function()
                require("plugins.configs.others").formatter()
            end,
            setup = function()
                require("core.mappings").formatter()
            end
        }

        -- Utils
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup()
            end
        }

        use {
            "famiu/bufdelete.nvim",
            cmd = "Bdelete",
            setup = function()
                require("core.mappings").bufdelete()
            end
        }

        use {
            "numtostr/BufOnly.nvim",
            cmd = "BufOnly",
            setup = function()
                require("core.mappings").bufonly()
            end
        }

        use {
            "bronson/vim-trailing-whitespace",
            event = "BufRead",
            cmd = "FixWhitespace"
        }

        use {
            "https://gitlab.com/yorickpeterse/nvim-window.git",
            as = "nvim-window",
            event = "BufRead",
            config = function()
                require("plugins.configs.others").nvim_window()
            end,
            setup = function()
                require("core.mappings").nvim_window()
            end
        }
    end
)
