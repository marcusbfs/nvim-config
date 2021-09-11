return require('packer').startup(function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- UI
    use {'folke/which-key.nvim', 
        config = function()
            require("which-key").setup()
        end}

    use {'machakann/vim-highlightedyank', event='TextYankPost'}

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        event = "BufRead",
        config = function()
            require('nvim-treesitter.configs').setup {
              highlight = {
                enable = true,
                disable = {},
              },
              indent = {
                enable = false,
                disable = {},
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
        end}

    use {'akinsho/bufferline.nvim',
        config = function()
            require('bufferline').setup()
        end}

    use {'hoob3rt/lualine.nvim',
        after = "nvim-web-devicons",
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require('lualine').setup{
                options = {theme = 'gruvbox'}
            }
        end}

    -- Edit
    use 'mg979/vim-visual-multi'

    use {'terrortylor/nvim-comment', cmd='CommentToggle',
        config = function()
              require('nvim_comment').setup({create_mappings=false})
        end}

    -- Depends on termcolor
    use {'norcalli/nvim-colorizer.lua', 
        event = "BufRead",
        config = function()
            require('colorizer').setup()
        end}

    use 'sainnhe/gruvbox-material'

    -- Navigation
    use 'andymass/vim-matchup'

    use {'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end
    }

    use 'nvim-lua/plenary.nvim'

    use {'nvim-telescope/telescope.nvim', cmd = "Telescope",
        config = function()
            require("telescope").setup()
        end}

    use 'junegunn/vim-easy-align'

    use 'justinmk/vim-sneak'

    use {'preservim/nerdtree', cmd={"NERDTree", "NERDTreeToggle", "NERDTreeFind"}}

    use 'kyazdani42/nvim-web-devicons'
    use 'Xuyuanp/nerdtree-git-plugin'

    -- Auto-completion

    -- Lang
    -- use 'neoclide/coc.nvim', {'branch': 'release'}

    -- Utils
    use {'famiu/bufdelete.nvim', cmd='Bdelete'}

    use {'AckslD/nvim-neoclip.lua', cmd = "Telescope", event='TextYankPost',
        config = function()
            require('neoclip').setup()
        end}
end)

