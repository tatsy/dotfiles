local parsers = {
    "bash",
    "json",
    "lua",
    "python",
    "toml",
    "yaml",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install(parsers)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = parsers,
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
