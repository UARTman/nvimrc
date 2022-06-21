require("nvim-lsp-installer").setup {
    -- automatic_installation = true,
}

lspconfig = require('lspconfig')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    local _copy = function(orig)
        local orig_type = type(orig)
        local copy
        if orig_type == 'table' then
            copy = {}
            for orig_key, orig_value in pairs(orig) do
                copy[orig_key] = orig_value
            end
        else -- number, string, boolean, etc
            copy = orig
        end
        return copy
    end
    local _bufopts = { noremap = true, silent = true, buffer = bufnr }
    local bufopts = function(desc)
        local copy = _copy(_bufopts)
        copy.desc = desc
        return copy
    end

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts('Goto declaration'))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts('Goto definition'))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts('Hover'))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts('Goto implementation'))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts('Signature help'))
    vim.keymap.set('n', '<Leader>lwa', vim.lsp.buf.add_workspace_folder, bufopts('Add workspace folder'))
    vim.keymap.set('n', '<Leader>lwr', vim.lsp.buf.remove_workspace_folder, bufopts('Remove workspace folder'))
    vim.keymap.set('n', '<Leader>lwl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts('List workspace folders'))
    vim.keymap.set('n', '<Leader>lD', vim.lsp.buf.type_definition, bufopts('Type definition'))
    vim.keymap.set('n', '<Leader>lrn', vim.lsp.buf.rename, bufopts('Rename'))
    vim.keymap.set('n', '<Leader>lca', vim.lsp.buf.code_action, bufopts('Code action'))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts('Goto references'))
    vim.keymap.set('n', '<Leader>lf', vim.lsp.buf.formatting, bufopts('Format'))
end

lspconfig.ccls.setup {
    on_attach = on_attach,
}
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
}
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
}
lspconfig.asm_lsp.setup {
    on_attach = on_attach,
}
