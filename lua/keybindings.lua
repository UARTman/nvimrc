local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options
local opt_local = vim.opt_local -- local options

local set_keymap = vim.api.nvim_set_keymap
local wk = require("which-key")

vim.keymap.set('n', '<Leader>t', function() cmd('ToggleTerm') end, { desc = "Open Terminal" })

-- =======
-- = FZF =
-- =======

wk.register({
    f = {
        name = "Fuzzy find"
    }
}, { prefix = "<Leader>" });
vim.keymap.set('n', '<Leader>ff', function() cmd('Files') end, { desc = "Files" })
vim.keymap.set('n', '<Leader>fb', function() cmd('Buffers') end, { desc = "Buffers" })
vim.keymap.set('n', '<Leader>fh', function() cmd('History') end, { desc = "History" })

-- =========================
-- = TERMINAL MODE HELPERS =
-- =========================

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
