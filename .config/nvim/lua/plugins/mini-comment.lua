local M = {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
}

M.opts = {
    hooks = {
        pre = function()
            require 'ts_context_commentstring.internal'.update_commentstring({})
        end,
    },
}

M.config = function(_, opts)
    require 'mini.comment'.setup(opts)
end

return M
