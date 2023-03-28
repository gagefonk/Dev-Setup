-- -- Import the Neovim Lua API
-- local api = vim.api

-- -- Register an autocmd to run :Mason after Packer completes
-- -- vim.cmd([[autocmd User PackerComplete :lua vim.cmd('Mason')]])
-- vim.cmd([[autocmd User PackerComplete :lua run_mason()]])


-- -- Define the Packer setup function
-- function setup_packer()
--   api.nvim_command('packadd packer.nvim')
--   require('packer').sync()
-- end

-- -- Define the Mason setup function
-- function setup_mason()
--   api.nvim_command('packadd nvim-mason')
-- end

-- -- Run Mason
-- function run_mason()
--   api.nvim_command('Mason')
-- end

-- -- Define the function to run Packer and Mason setup
-- function setup()
--   setup_packer()
--   setup_mason()
-- end

-- -- Run Packer and Mason setup
-- setup()

-- vim.cmd([[
-- augroup PackerComplete
--   autocmd!
--   autocmd User PackerComplete lua vim.cmd('Mason')
-- augroup END
-- ]])

vim.cmd('restart')
vim.cmd('MasonUpdate')
vim.cmd('Mason')