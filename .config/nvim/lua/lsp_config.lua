require("mason").setup()

vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

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
