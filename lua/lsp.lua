require("nvim-lsp-installer").setup {
    -- automatic_installation = true,
}

lspconfig = require('lspconfig')

lspconfig.ccls.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.sumneko_lua.setup {}
lspconfig.asm_lsp.setup {}
