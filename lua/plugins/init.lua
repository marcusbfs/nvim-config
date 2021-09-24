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
            event = "BufRead",
            config = function()
                require "plugins.configs.treesitter"
            end
        }

        -- git stuff
        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require "plugins.configs.gitsigns"
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
            ft = {"rust", "python", "lua", "cpp", "cmake"},
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

        -- auto-completion plugin

        use {
            "ms-jpq/coq_nvim",
            branch = "coq",
            setup = function()
                require "plugins.configs.autocompletion"
            end
        }

        use {
            "ms-jpq/coq.artifacts",
            branch = "artifacts"
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
            after = "coq_nvim",
            config = function()
                require "plugins.configs.autopairs"
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

        use {
            "ggandor/lightspeed.nvim",
            config = function()
                require "plugins.configs.lightspeed"
            end
        }

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
            "rhysd/vim-grammarous",
            cmd = {"GrammarousCheck"}
        }

        use {
            "tpope/vim-rsi",
            event = "InsertEnter"
        }

        use {
            "abecodes/tabout.nvim",
            after = "coq_nvim",
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
    end
)
