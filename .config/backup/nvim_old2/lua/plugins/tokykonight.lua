return {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    config = function()
        require('core.colorscheme')
    end,
}