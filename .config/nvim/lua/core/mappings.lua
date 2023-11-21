-- OPTIONS
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- LEADER
vim.g.mapleader = " "

-- GENERAL

-- Better Escape with 'j/k'
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)

-- Search & replace word under cursor
map("n", "<leader>sr", ":%s/\\<<c-r><c-w>\\>/", opts)

-- select all
map("n", "<C-a>", "gg<S-v>G", opts)

-- increment/decrement
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)

-- SEE ADDTL KEYMAPS IN WHICHKEY CONFIG
