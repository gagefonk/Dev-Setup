local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- escape insert
keymap.set('i', 'jk', '<ESC>')

-- clear search
keymap.set('n', '<leader>nh', ':nohl<CR>')

-- delete without copying
keymap.set('n', 'x', '_x')

-- increment number 
keymap.set('n', '<leader>+', '<C-a>')
-- decrement number
keymap.set('n', '<leader>-', '<C-x>')

-- split window vertically
keymap.set('n', '<leader>sv', '<C-w>V')
-- split window horizontally
keymap.set('n', '<leader>sh', '<C-w>s')
-- split window equal width
keymap.set('n', '<leader>se', '<C-w>=')
-- close split window
keymap.set('n', '<leader>sx', ':close<CR>')

-- open new tab
keymap.set('n', '<leader>to', ':tabnew<CR>')
-- close tab
keymap.set('n', '<leader>tx', ':tabclose<CR>')
-- go to next tab
keymap.set('n', '<leader>tn', ':tabn<CR>')
-- go to previous tab
keymap.set('n', '<leader>tp', ':tabp<CR>')

-- PLUGIN KEYMAPS

-- NVIM - TREE
-- open file browser
keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- TELESCOPE
-- find files
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
-- find text
keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>')
-- find current string
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>')
-- find active buffer
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
-- find help tag
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')







-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- -- Normal --
-- -- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- -- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- -- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- -- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- -- Insert --
-- -- Press jk fast to exit insert mode 
-- keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "kj", "<ESC>", opts)

-- -- Visual --
-- -- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- -- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

-- -- Visual Block --
-- -- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)