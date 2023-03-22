-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use Protected Call so we dont error our
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- Have packer use floating window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded" }
    end,
  },
}

vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'ellisonleao/gruvbox.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
    
  -- Automatically set up config after cloning packer.nvim
    if PACKER_BOOSTRAP then
      require("packer").sync()
    end
end)
