local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

require('tools')

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- The package manager itself

    -- =======================
    -- = SYNTAX HIGHLIGHTING =
    -- =======================

    use 'euclidianAce/BetterLua.vim' -- Better Lua syntax

    -- ===================
    -- = QUALITY OF LIFE =
    -- ===================

    use {'junegunn/fzf', run = function() fn["fzf#install"]() end} -- Fuzzy finder
    use 'junegunn/fzf.vim'

    use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function() -- Terminal toggle
        require("toggleterm").setup {
            open_mapping = [[<C-`>]],
            insert_mappings = true,
            terminal_mappings = true,
        }
    end}

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

    -- ===========
    -- = VISUALS =
    -- ===========

    use 'vim-airline/vim-airline'       -- Better status line
    use 'vim-airline/vim-airline-themes'

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

    use 'neovim/nvim-lspconfig' -- LSP presets
    use 'mfussenegger/nvim-dap' -- Debugger support
end)
