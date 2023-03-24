-- Import the Neovim Lua API
local api = vim.api

-- Define a function to run :Mason
local function run_mason()
  api.nvim_command('MasonInstallAll')
end

-- Register an autocmd to run :Mason after Packer completes
vim.cmd([[autocmd User PackerComplete lua run_mason()]])

-- Run :PackerSync
api.nvim_command('PackerSync')
