local parsers = {
    "bash",
    "json",
    "lua",
    "python",
    "toml",
    "yaml",
    "zsh",
}

local filetypes = {
    "sh",
    "json",
    "lua",
    "python",
    "toml",
    "yaml",
    "zsh",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install(parsers)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = filetypes,
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
