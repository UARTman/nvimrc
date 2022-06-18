local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

require('tools') -- Various tools to use in other configurations
require('settings') -- Miscellaneous settings
require('keybindings') -- Key mappings
require('plugins')

require('lazygit') -- Integration for LazyGit tool
require('lsp') -- LSP configs
