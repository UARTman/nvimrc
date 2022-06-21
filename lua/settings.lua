local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options
local opt_local = vim.opt_local

function tabulation(expand_tab, tab_size)
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.smarttab = true
    opt.expandtab = true
end

-- Smart indentation
opt.smartindent = true

-- Default tabs settings
tabulation(true, 4)

-- Let's try to do some makefile bullshit
vim.api.nvim_create_autocmd(
    { "BufEnter", "BufWinEnter", "BufNewFile" },
    {
        pattern = { "Makefile", "makefile", "GNUmakefile", "*.mk" },
        callback = function()
            opt_local.smarttab = false
            opt_local.expandtab = false
        end,
    }
)

opt.number = true

cmd [[colorscheme gruvbox]]

cmd [[let $FZF_DEFAULT_COMMAND='rg --files']]
