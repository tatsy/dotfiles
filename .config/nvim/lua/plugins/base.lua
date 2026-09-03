return {
    -- color theme
    {
        "jacoborus/tender.vim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[set termguicolors]])
            vim.cmd([[colorscheme tender]])
        end,
    },
    -- status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- buffer line
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
            vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })
        end,
    },
    -- helpful for editing
    { "tpope/vim-endwise" },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    -- rainbow parenthesis
    {
        "luochen1990/rainbow",
        lazy = false,
        config = function()
            vim.g.rainbow_active = 1
        end,
    },
    -- visualize indentation
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = { enabled = false },
        },
    },
    -- visualize search position
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            local hlslens = require("hlslens")
            hlslens.setup()

            local keymap_opts = { noremap = true, silent = true }
            vim.keymap.set("n", "n", function()
                vim.cmd("normal! " .. vim.v.count1 .. "n")
                hlslens.start()
            end, keymap_opts)
            vim.keymap.set("n", "N", function()
                vim.cmd("normal! " .. vim.v.count1 .. "N")
                hlslens.start()
            end, keymap_opts)
            vim.keymap.set("n", "*", function()
                vim.cmd("normal! *")
                hlslens.start()
            end, keymap_opts)
            vim.keymap.set("n", "#", function()
                vim.cmd("normal! #")
                hlslens.start()
            end, keymap_opts)
        end,
    },
    -- useful word selector
    { "mg979/vim-visual-multi" },
}
