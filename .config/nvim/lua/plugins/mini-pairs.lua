local M = {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
}

M.config = function(_, opts)
    require 'mini.pairs'.setup(opts)
end

return M