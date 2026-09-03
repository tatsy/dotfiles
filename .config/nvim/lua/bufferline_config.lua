require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
    },
})

vim.keymap.set("n", "<C-p>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<C-n>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
