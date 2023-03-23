
-- Ensure installed, otherwise install it
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status, packer = pcall(require, "packer")
if not status then
  return
end

local packer_bootstrap = ensure_packer()

-- Have packer use floating window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded" }
    end,
  },
}

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer
	use 'wbthomason/packer.nvim'
  -- Lua Functions that other plugins use
  use 'nvim-lua/plenary.nvim'
  -- Color Scheme
  use 'folke/tokyonight.nvim'
  -- Tmux & split window navigation
  use 'christoomey/vim-tmux-navigator'
  -- Commenting
  use 'numToStr/Comment.nvim'
  -- File Explorer
	use 'nvim-tree/nvim-tree.lua'
  -- Lualine
  use 'nvim-lualine/lualine.nvim'
  -- Treesitter
	use 'nvim-tree/nvim-web-devicons'
  use { 'nvim-treesitter/nvim-treesitter',run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, }
  -- Telescope
  use { 'nvim-telescope/telescope.nvim',branch = '0.1.0x',requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim',run = "make" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)