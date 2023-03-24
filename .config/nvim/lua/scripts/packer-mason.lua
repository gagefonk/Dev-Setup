-- Import the Neovim Lua API
local api = vim.api

-- Define a function to run :Mason
local function run_mason()
  api.nvim_command('Mason')
end

-- Register an autocmd to run :Mason after Packer completes
vim.cmd([[autocmd User PackerComplete lua require("packer-mason").run_mason()]])

-- Define the Packer setup function
function setup_packer()
  api.nvim_command('packadd packer.nvim')
  require('packer').sync()
end

-- Define the Mason setup function
function setup_mason()
  api.nvim_command('packadd nvim-mason')
end

-- Define the function to run Packer and Mason setup
function setup()
  setup_packer()
  setup_mason()
end

-- Run Packer and Mason setup
setup()
