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
    -- visuzlize tabs
    {
        "nathanaelkane/vim-indent-guides",
        lazy = false,
        config = function()
            vim.g.indent_guides_enable_on_vim_startup = 1
            vim.g.indent_guides_auto_colors = 1
        end,
    },
    -- visuzalize search position
    {
        "osyo-manga/vim-anzu",
        lazy = false,
        config = function()
            vim.api.nvim_set_keymap("n", "n", "<Plug>(anzu-n-with-echo", {})
            vim.api.nvim_set_keymap("n", "N", "<Plug>(anzu-N-with-echo", {})
            vim.api.nvim_set_keymap("n", "*", "<Plug>(anzu-star)", {})
            vim.api.nvim_set_keymap("n", "#", "<Plug>(anzu-sharp)", {})
        end,
    },
    -- useful word selector
    { "mg979/vim-visual-multi" },
}
