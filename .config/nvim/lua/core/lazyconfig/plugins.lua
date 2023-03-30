local plugins = {
    -- COLOR SCHEME
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            require('core.colorscheme')
        end,
    },
    -- FILE EXPLORER
    -- {
    --     'nvim-tree/nvim-tree.lua',
    --     config = function()
    --         require('plugins.nvim-tree')
    --     end,
    -- },
    -- LUALINE
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('plugins.lualine')
        end,
    },
    -- TREE SITTER
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('plugins.treesitter')
        end,
    },
    {
        'nvim-tree/nvim-web-devicons',
    },
    -- TELESCOPE
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require('plugins.telescope')
        end,
    },
    -- WHICH KEY
    {
        'folke/which-key.nvim',
        config = function()
            require('plugins.whichkey')
        end,
    },
    -- GITSIGNS
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('plugins.gitsigns')
        end,
    },

}

return plugins