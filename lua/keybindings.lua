local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local opt_local = vim.opt_local -- local options

local set_keymap = vim.api.nvim_set_keymap
local wk = require("which-key")

set_keymap('n', '<Leader>t', '<Cmd>ToggleTerm<CR>', {desc = "Open Terminal"})
set_keymap('n', '<Leader>ff', '<Cmd>Files<CR>', {desc = "Files"})



-- =========================
-- = TERMINAL MODE HELPERS =
-- =========================

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

