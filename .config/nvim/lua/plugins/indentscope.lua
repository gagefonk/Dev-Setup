local M = {
    'echasnovski/mini.indentscope',
    version = false,
    event = { 'BufReadPre', 'BufNewFile' },
}

M.opts = {
    symbol = '│',
    options = { try_as_border = true },
}

M.init = function()
    vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'help', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
        callback = function()
            vim.b.miniindentscope_disable = true
        end,
    })
end

M.config = function(_, opts)
    require 'mini.indentscope'.setup(opts)
end

return M
