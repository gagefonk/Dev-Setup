-- Import the Neovim Lua API
local api = vim.api

-- Define a function to run :Mason
local function run_mason()
  api.nvim_command('Mason')
end

-- Register an autocmd to run :Mason after :PackerSync
vim.cmd([[autocmd User PackerSyncPost * lua run_mason()]])

-- Run :PackerSync
api.nvim_command('PackerSync')


-- -- Import the Neovim Lua API
-- local api = vim.api

-- -- Open Neovim and run :PackerSync
-- api.nvim_command('PackerSync')

-- -- Define a function to run :Mason once :PackerSync is finished
-- local function on_packer_sync_done()
--   api.nvim_command('Mason')
-- end

-- -- Register a callback to run on BufWritePost
-- vim.cmd([[autocmd BufWritePost $MYVIMRC lua on_packer_sync_done()]])
