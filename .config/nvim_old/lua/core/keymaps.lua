vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

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