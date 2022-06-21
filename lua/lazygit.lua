local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit", hidden = true, direction = "float",
    on_open = function(term)
    end,
})

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<Leader>g", "<cmd>lua _lazygit_toggle()<CR>",
    { noremap = true, silent = true, desc = "Open LazyGit" })
