local has_words_before = function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  return (vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1] or ''):sub(cursor[2], cursor[2]):match('%s') 
end

local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            -- elseif vim.fn["vsnip#available"](1) == 1 then 
            --     feedkey("<Plug>(vsnip-expand-or-jump)", "")
            -- elseif has_words_before() then
            --     cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
                    
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            -- elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            --     feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
        ["<Esc>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.abort()
            else
                fallback()
            end
        end, {"i", "s"})
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
    })
})
