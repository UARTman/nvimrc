local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

require('tools')

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- The package manager itself

    -- =============
    -- = LIBRARIES =
    -- =============

    use 'nvim-lua/plenary.nvim'
    use 'godlygeek/tabular'

    -- ====================
    -- = LANGUAGE SUPPORT =
    -- ====================

    use 'euclidianAce/BetterLua.vim' -- Better Lua syntax
    use 'preservim/vim-markdown' -- Markdown support

    -- ===================
    -- = QUALITY OF LIFE =
    -- ===================

    use { 'junegunn/fzf', run = function() fn["fzf#install"]() end } -- Fuzzy finder
    use 'junegunn/fzf.vim'

    use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function() -- Terminal toggle
        require("toggleterm").setup {
            open_mapping = [[<C-`>]],
            insert_mappings = true,
            terminal_mappings = true,
        }
    end }

    use {
        "folke/which-key.nvim", -- Keybinding hints
        config = function()
            require("which-key").setup {

            }
        end
    }

    use {
        "ahmedkhalf/project.nvim", -- Project management
        config = function()
            require("project_nvim").setup {
            }
        end
    }

    use {
        "windwp/nvim-autopairs", -- Auto-pair
        config = function()
            require("nvim-autopairs").setup {

            }
        end
    }

    use 'tpope/vim-commentary' -- Comment out

    use 'airblade/vim-gitgutter' -- Git status of lines in the gutter

    use { 'akinsho/bufferline.nvim', -- Tabs
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup{}
        end
    }
    -- ===========
    -- = VISUALS =
    -- ===========

    use 'vim-airline/vim-airline' -- Better status line
    use 'vim-airline/vim-airline-themes'

    use 'kyazdani42/nvim-web-devicons' -- icons

    -- use {
    --    'nvim-lualine/lualine.nvim',
    --    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    --    config = function()
    --        require('lualine').setup()
    --    end
    --}

    -- ================
    -- = COLORSCHEMES =
    -- ================
    use 'morhetz/gruvbox'


    -- ================
    -- = IDE FEATURES =
    -- ================

    use "williamboman/nvim-lsp-installer"


    use { 'neovim/nvim-lspconfig', -- LSP presets
        config = function()
            require("lsp")
        end
    }


    use 'mfussenegger/nvim-dap' -- Debugger support

    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" },
        config = function()
            require("dapui").setup {

            }
        end
    }

    use {
        'hrsh7th/nvim-cmp', -- Autocomplete
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
        config = function()
            require("plugin_settings.autocomplete")
        end
    }

    use {
        'L3MON4D3/LuaSnip', -- Snippets
        requires = {
            'saadparwaiz1/cmp_luasnip'
        }
    }

    -- =====================
    -- = LANGUAGE SPECIFIC =
    -- =====================

    use {
        'simrat39/rust-tools.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-dap',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('languages.rust')
        end
    }

end)
