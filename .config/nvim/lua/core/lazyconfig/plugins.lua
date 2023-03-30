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
    {
        'nvim-tree/nvim-tree.lua',
    },
    -- LUALINE
    {
        'nvim-lualine/lualine.nvim',
    },



    -- -- TREE SITTER
    -- 'nvim-treesitter/nvim-treesitter',
    -- 'nvim-tree/nvim-web-devicons',
    -- -- FILE EXPLORER
    -- 'nvim-tree/nvim-tree.lua',
    -- -- LUALINE
    -- 'nvim-lualine/lualine.nvim',
    -- -- TELESCOPE
    -- {
    --     'nvim-telescope/telescope.nvim',
    --     branch = '0.1.x',
    --     dependencies = { {'nvim-lua/plenary.nvim'} }
    -- },
    -- -- AUTO COMPLETION
    -- 'hrsh7th/nvim-cmp',
    -- 'hrsh7th/cmp-nvim-lsp',
    -- -- SNIPPETS
    -- 'L3MON4D3/LuaSnip',
    -- 'saadparwaiz1/cmp_luasnip',
    -- 'rafamadriz/friendly-snippets',
    -- -- LSP SERVERS
    -- 'williamboman/mason.nvim',
    -- 'williamboman/mason-lspconfig.nvim',
    -- -- LSP CONFIG
    -- 'neovim/nvim-lspconfig',
    -- 'RRethy/vim-illuminate',
    -- -- LINT & FORMAT
    -- 'jose-elias-alvarez/null-ls.nvim',
    -- 'jayp0521/mason-null-ls.nvim',
    -- 'lukas-reineke/indent-blankline.nvim',
    -- -- BUFFERS
    -- 'akinsho/bufferline.nvim',
    -- 'moll/vim-bbye',

}

return plugins