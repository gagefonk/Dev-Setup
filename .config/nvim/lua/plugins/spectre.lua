local M = {
    'windwp/nvim-spectre',
}

M.keys = {
    { '<leader>rr', '<cmd>lua require "spectre".open()<cr>', desc = 'Replace' },
    { '<leader>rw', '<cmd>lua require "spectre".open_visual({select_word=true})<cr>', desc = 'Replace Word' },
    { '<leader>rf', '<cmd>lua require "spectre".open_file_search()<cr>', desc = 'Replace Buffer' },
}

return M