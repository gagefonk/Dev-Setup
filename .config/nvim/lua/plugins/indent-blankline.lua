local M = {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    enabled = true,
}

M.opts = {
    char = '│',
    filetype_exclude = { 'help', 'neo-tree', 'Trouble', 'lazy' },
    show_trailing_blankline_indent = false,
    show_current_context = false,
}

return M