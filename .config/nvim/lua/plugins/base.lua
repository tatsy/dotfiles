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
    -- fancy status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- helpful for editing
    { "tpope/vim-endwise" },
    { "Townk/vim-autoclose" },
    -- airline
    {
        "vim-airline/vim-airline-themes",
        lazy = false,
    },
    {
        "vim-airline/vim-airline",
        lazy = false,
        config = function()
            vim.g.airline_theme = "tender"
            vim.g.airline_symbols_ascii = 0
            vim.g.airline_powerline_fonts = 1
            vim.g.airline_section_z = vim.fn["airline#section#create"]({ "windowswap", "%3p%%", "linenr", ":%3v" })
            vim.g["airline#extensions#virtualenv#enabled"] = 0
            vim.g["airline#extensions#hunks#enabled"] = 0

            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#tabline#show_buffers"] = 1
            vim.g["airline#extensions#tabline#buffer_idx_mode"] = 1
            vim.g["airline#extensions#tabline#formatter"] = "unique_tail"

            vim.api.nvim_set_keymap("n", "<C-p>", "<Plug>AirlineSelectPrevTab", {})
            vim.api.nvim_set_keymap("n", "<C-n>", "<Plug>AirlineSelectNextTab", {})
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
    -- nerd tree (and dependencies)
    {
        "scrooloose/nerdtree",
        lasy = true,
        dependencies = {
            "ryanoasis/vim-devicons",
            "tiagofumo/vim-nerdtree-syntax-highlight",
            "Xuyuanp/nerdtree-git-plugin",
        },
        config = function()
            vim.api.nvim_set_keymap("n", "<C-\\>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
        end,
    },
    -- useful word selector
    { "mg979/vim-visual-multi" },
}
