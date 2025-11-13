-- OPTIONS --
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- MISC --
map("n", "<C-/>", ":nohl<CR>", { desc = "Clear search hl", silent = true })
map("n", "Q", "<nop>")

-- BETTER DELETES --
map({ "n", "v" }, "d", '"_d', opts)
map("n", "dd", '"_dd', opts)
map({ "n", "v" }, "x", '"_x', opts)

-- BETTER PASTE --
map("x", "<leader>p", [[:_dp]], { desc = "Paste without replacing clipboard" })
map("v", "p", '"_dp', opts)

-- BETTER ESC W/ J/K --
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)

-- BETTER UP/DOWN --
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<c-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- BETER INDENT --
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- BETTER CODE MOVE --
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

-- SELECT ALL --
map("n", "<C-a>", "gg<S-v>G", opts)

-- INC/DEC --
map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })

-- WINDOW MANAGEMENT --
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split winodow horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- GENERAL --
map("n", "<leader>R", "<cmd>%d+<cr>", { desc = "General | Remove All Text", silent = true })
map("n", "<leader>Y", "<cmd>%y+<cr>", { desc = "General | Yank All Text", silent = true })
map("n", "<leader>q", "<cmd>qa!<cr>", { desc = "General | Quit", silent = true })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "General | Save", silent = true })

-- PLUGIN MANAGER --
map("n", "<leader>ll", ":Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>lm", ":Mason<CR>", { desc = "Mason" })
