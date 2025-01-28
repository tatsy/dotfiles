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
    -- airline (and dependencies)
    { "powerline/powerline" },
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
            vim.g.airline_section_z = vim.fn["airline#section#create"]({'windowswap', '%3p%%', 'linenr', ':%3v'})
            vim.g['airline#extensions#virtualenv#enabled'] = 0
            vim.g['airline#extensions#hunks#enabled'] = 0

            --vim.g['airline#extensions#ale#enabled'] = 1
            --vim.g['airline#extensions#ale#error_symbol'] = "E:"
            --vim.g['airline#extensions#ale#warning_symbol'] = "W:"

            vim.g['airline#extensions#tabline#enabled'] = 1
            vim.g['airline#extensions#tabline#show_buffers'] = 1
            vim.g['airline#extensions#tabline#buffer_idx_mode'] = 1
            vim.g['airline#extensions#tabline#formatter'] = "unique_tail"

            vim.api.nvim_set_keymap("n", "<C-p>", "<Plug>AirlineSelectPrevTab", {})
            vim.api.nvim_set_keymap("n", "<C-n>", "<Plug>AirlineSelectNextTab", {})
        end,
    },
    -- ale
    -- {
    --     "dense-analysis/ale",
    --     lazy = false,
    --     config = function()
    --         vim.g.ale_sign_error = "❌"
    --         vim.g.ale_sign_warning = "⚠"
    --         vim.g.ale_echo_msg_format = "[%linter%] %s [%serverity%]"

    --         vim.g.ale_lint_on_enter = 0
    --         vim.g.ale_lint_on_save = 1
    --         vim.g.ale_lint_on_text_changed = "never"

    --         vim.g.ale_fix_on_save = 1

    --         vim.g.ale_set_loclist = 0
    --         vim.g.ale_set_quickfix = 0
    --         vim.g.ale_open_list = 0
    --         vim.g.ale_keep_list_window_open = 0

    --         vim.api.nvim_set_keymap("n", "[ale]", "<Nop>", { noremap = true, silent = true })
    --         vim.api.nvim_set_keymap("", "<C-k>", "[ale]", { noremap = false, silent = true})
    --     end,
    -- },
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
