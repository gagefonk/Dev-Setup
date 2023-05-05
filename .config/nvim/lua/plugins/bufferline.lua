local M = {
    'akinsho/bufferline.nvim',
    enabled = true,
    event = 'VimEnter',
    lazy = true,
}

M.keys = {
    { '<leader>bj', '<cmd>BufferLinePick<CR>', desc = 'Jump' },
    { '<leader>bf', '<cmd>Telescope buffers previewer=false<cr>', 'Find' },
    { '<S-l>', ':BufferLineCycleNext<CR>' },
    { '<TAB>', ':BufferLineCycleNext<CR>' },
    { '<S-h>', ':BufferLineCyclePrev<CR>' },
    { '<S-TAB>', ':BufferLineCyclePrev<CR>' },
    { '<leader>bW', '<cmd>noautocmd w<cr>', desc = 'Save without formatting (noautocmd)' },
    { '<leader>bc', '<cmd>BufferLinePickClose<cr>', desc = 'Close (pick)' },
    { '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', desc = 'Close all (left)' },
    { '<leader>bl', '<cmd>BufferLineCloseRight<cr>', desc = 'Close all (right)' },
    { '<leader>bD', '<cmd>BufferLineSortByDirectory<cr>', desc = 'Sort by directory' },
    { '<leader>bL', '<cmd>BufferLineSortByExtension<cr>', desc = 'Sort by language' },
    { '<leader>bp', '<cmd>BufferLineTogglePin<CR>', desc = 'Toggle pin' },
    { '<leader>bP', '<cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
}

M.opts = {
    options = {
        mode = 'buffers',
        numbers = 'none',
        close_command = 'Bdelete! %d',
        right_mouse_command = '', -- right click does nothing
        -- left_mouse_command = '',
        color_icons = true,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true,  -- whether or not tab names should be truncated
        tab_size = 18,
        show_tab_indicators = true,
        separator_style = 'thin', -- 'slant' | 'padded_slant' | 'slope' | 'thick' | 'thin'
        diagnostics = 'nvim_lsp',
        show_close_icon = false,
        always_show_bufferline = false,
        hover = {
            enabled = false,
            delay = 200,
            reveal = { 'close' },
        },
        -- diagnostics_indicator = function(_, _, diag)
        --     local s = ' '
        --     for e, n in pairs(diag) do
        --         local sym = e == 'error' and ' '
        --             or (e == 'warning' and ' ' or '')
        --         s = s .. n .. sym
        --     end
        --     return s
        -- end,
        offsets = {
            {
                filetype = 'neo-tree',
                text = 'Neo-tree',
                highlight = 'Directory',
                text_align = 'left',
            },
        },
    },
}

return M
