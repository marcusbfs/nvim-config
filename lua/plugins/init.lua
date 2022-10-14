local packer = require "plugins.packerInit"

local use = packer.use

return packer.startup(
    function()
        -- Packer can manage itself
        use {
            "wbthomason/packer.nvim",
            event = "VimEnter"
        }

        -- Impatient to speed up startup time - used in init.lua
        use {"lewis6991/impatient.nvim"}

        use {"nvim-lua/plenary.nvim"}

        use {"nvim-lua/popup.nvim"}

        use {
            require("colors").origin_name(),
            config = function()
                require("colors").config()
            end
        }

        use {
            "kyazdani42/nvim-web-devicons",
            after = "packer.nvim",
            config = function()
                require "plugins.configs.icons"
            end
        }

        use {
            "nvim-lualine/lualine.nvim",
            config = function()
                require "plugins.configs.statusline"
            end,
            requires = {
                "kyazdani42/nvim-web-devicons",
                opt = true
            }
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
            "mhinz/vim-startify",
            config = function()
                require "plugins.configs.startify"
            end,
            setup = function()
                require("core.mappings").startify()
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            -- event = "BufRead",
            config = function()
                require "plugins.configs.treesitter"
            end
        }

        use {
            "nvim-treesitter/playground",
            after = "nvim-treesitter",
            cmd = "TSPlaygroundToggle"
        }

        use {
            "danymat/neogen",
            requires = "nvim-treesitter/nvim-treesitter",
            ft = require("core.utils").lsp_common_filetypes,
            -- Uncomment next line if you want to follow only stable versions
            tag = "*",
            config = function()
                require("plugins.configs.others").neogen()
            end
        }

        -- git stuff
        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require "plugins.configs.gitsigns"
            end
        }

        -- lsp stuff
        use {
            "neovim/nvim-lspconfig",
            ft = require("core.utils").lsp_common_filetypes,
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

        use {"onsails/lspkind-nvim"}

        use {
            "folke/trouble.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("plugins.configs.others").lsptrouble()
            end
        }

        use {"andymass/vim-matchup"}

        use {
            "ahmedkhalf/project.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("plugins.configs.others").projectnvim()
            end
        }

        use {
            "kosayoda/nvim-lightbulb",
            after = "nvim-lspconfig",
            config = function()
                require("plugins.configs.others").lightbulb()
            end
        }

        -- load luasnips + cmp related in insert mode only
        use {
            "rafamadriz/friendly-snippets"
            -- event = "InsertEnter"
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
            "hrsh7th/cmp-nvim-lsp"
            -- after = "cmp-nvim-lua"
        }

        use {
            "hrsh7th/cmp-buffer",
            after = "cmp-nvim-lsp"
        }

        use {
            "hrsh7th/cmp-path",
            after = "cmp-buffer"
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
            "b3nj5m1n/kommentary",
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
            "junegunn/vim-easy-align",
            setup = function()
                require("core.mappings").easy_align()
            end
        }

        use {
            "ggandor/lightspeed.nvim",
            config = function()
                require "plugins.configs.lightspeed"
            end
        }

        use {
            "kyazdani42/nvim-tree.lua",
            cmd = {
                "NvimTreeOpen"
            },
            setup = function()
                require("core.mappings").tree()
            end,
            config = function()
                require "plugins.configs.tree"
            end
        }

        use {
            "mhartington/formatter.nvim",
            cmd = {"Format", "FormatWrite"},
            ft = require("core.utils").lsp_common_filetypes,
            config = function()
                require "plugins.configs.formatter"
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
            "numtostr/BufOnly.nvim",
            cmd = "BufOnly",
            setup = function()
                require("core.mappings").bufonly()
            end
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

        use {
            "dstein64/vim-startuptime",
            cmd = "StartupTime"
        }

        use {
            "monaqa/dial.nvim",
            setup = function()
                require("core.mappings").dial()
            end
        }

        use {
            "simeji/winresizer",
            cmd = "WinResizerStartResize",
            setup = function()
                require("core.mappings").winresizer()
            end
        }

        use {
            "caenrique/nvim-maximize-window-toggle",
            cmd = "ToggleOnly",
            setup = function()
                require("core.mappings").nvim_maximize_window_toggle()
            end
        }

        use {
            "jdhao/better-escape.vim",
            event = "InsertEnter",
            setup = function()
                require("plugins.configs.others").better_escape()
            end,
            config = function()
                require("plugins.configs.others").better_escape()
            end
        }

        use {
            "tpope/vim-rsi",
            event = "InsertEnter"
        }

        use {
            "abecodes/tabout.nvim",
            after = "nvim-cmp",
            config = function()
                require "plugins.configs.tabout"
            end
        }

        use {
            "folke/todo-comments.nvim",
            event = "BufRead",
            config = function()
                require("plugins.configs.others").todo_comments()
            end
        }

        use {"tpope/vim-surround"}

        use {
            "kevinhwang91/nvim-bqf",
            event = "BufRead",
            config = function()
                require("plugins.configs.others").bqf()
            end
        }

        use {"mbbill/undotree"}

        use {"ThePrimeagen/vim-be-good"}

        use {
            "ThePrimeagen/harpoon",
            config = function()
                require("plugins.configs.others").harpoon()
            end,
            setup = function()
                require("core.mappings").harpoon()
            end
        }

        use {
            "p00f/nvim-ts-rainbow",
            config = function()
                require("plugins.configs.others").rainbow()
            end
        }
        use {
            "windwp/nvim-ts-autotag",
            after = "nvim-treesitter",
            config = function()
                require("plugins.configs.others").autotag()
            end
        }
    end
)
