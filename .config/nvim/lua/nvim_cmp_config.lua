local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            -- for luasnip
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }),
})

local lspkind = require("lspkind")
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
            before = function(entry, vim_item)
                return vim_item
            end,
        }),
    },
})
