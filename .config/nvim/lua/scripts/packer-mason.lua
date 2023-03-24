-- Import the Neovim Lua API
local api = vim.api

-- Open Neovim and run :PackerSync
api.nvim_command('PackerSync')

-- Define a function to run :Mason once :PackerSync is finished
local function on_packer_sync_done()
  api.nvim_command('Mason')
end

-- Register a callback to run on BufWritePost
vim.cmd([[autocmd BufWritePost $MYVIMRC lua on_packer_sync_done()]])
