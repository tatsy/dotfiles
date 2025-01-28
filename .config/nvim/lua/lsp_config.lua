require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",
        "lua_ls",
        "bashls",
        "yamlls",
        "jsonls",
        "taplo",
    },
})

require("lspconfig").pyright.setup({})
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

require("lspconfig").bashls.setup({})
require("lspconfig").yamlls.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").taplo.setup({})
