-- base settings
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.fileformats = { "unix" }

vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.virtualedit = "block"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.wrapscan = true

vim.opt.list = true
vim.opt.number = true
vim.opt.listchars = { tab = "»-", trail = "-", eol="↲", extends = "»", precedes = "«", nbsp = "␣" }

vim.opt.ambiwidth = "double"
if vim.fn.has("path_extra") == 1 then
    vim.opt.tags:append({ ".tags", "tags" })
end
vim.opt.laststatus = 2
vim.opt.showtabline = 2

vim.opt.clipboard = "unnamed"
vim.opt.backspace = { "eol", "indent", "start" }

vim.opt.wildmenu = true
vim.opt.wildmode = { "list:full" }
vim.opt.wildignore = { "*.o", "*.obj", "*.pyc", "*.so", "*.dll" }

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.hidden = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.showmatch = true
vim.opt.whichwrap = "b,s,h,l,<,>,[,"
vim.opt.wrapscan = false

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- move between splits
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-Left>", ":bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":bnext<CR>", { noremap = true, silent = true })

-- lazy.nvim
require("config.lazy")
require("lualine_config")
require("nvim_cmp_config")
require("lsp_config")
