-- Ensure Packer is installed, otherwise install it
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

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we dont error out
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Use popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = "rounded" }
    end,
  },
}

-- PLUGIN
return require('packer').startup(function(use)
  -- Packer
	use 'wbthomason/packer.nvim'
  -- Lua Functions that other plugins use
  use 'nvim-lua/plenary.nvim'
  -- Color Scheme
  use 'folke/tokyonight.nvim'
  -- Tmux & split window navigation
  --use 'christoomey/vim-tmux-navigator'
  -- Commenting
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- File Explorer
	use 'nvim-tree/nvim-tree.lua'
  -- Lualine
  use 'nvim-lualine/lualine.nvim'
  -- Treesitter
	use 'nvim-tree/nvim-web-devicons'
  use { 'nvim-treesitter/nvim-treesitter',run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, }
  -- Telescope
  use { 'nvim-telescope/telescope-fzf-native.nvim',run = "make" }
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Auto completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  -- LSP servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- LSP configuration
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  --use { 'glepnir/lspsaga.nvim', bracnh = "main" }
  use 'onsails/lspkind.nvim'
  use 'RRethy/vim-illuminate'
  -- Lint & Format
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  -- Auto closing
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  -- Buffers
  use 'akinsho/bufferline.nvim'
  use 'moll/vim-bbye'
  -- Term
  use 'akinsho/toggleterm.nvim'
  -- Project Management
  use 'ahmedkhalf/project.nvim'
  -- GIT
  use 'lewis6991/gitsigns.nvim'
  -- Loading
  use 'lewis6991/impatient.nvim'
  -- Which key
  use 'folke/which-key.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
