local M = {
    'rcarriga/nvim-notify',
}

M.keys = {
    { '<leader>nd',
    function()
            require 'notify' .dismiss({ silent = true, pending = true })
        end,
    desc = 'Delete all notifications' },
    { '<leader>nt', '<cmd>Notifications<CR>', desc = 'Toggle Notifications' },
    { '<leader>nm', '<cmd>:messages<cr>', desc = 'Toggle Messages' },
}

M.opts = {
    background_colour = '#000000',
    max_height = function()
        return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
        return math.floor(vim.o.columns * 0.75)
    end,
    fps = 60,
}


M.init = function()
    vim.notify = require 'notify'
end

return M
