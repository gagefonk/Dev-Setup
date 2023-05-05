local M = {
    'folke/noice.nvim',
    lazy = false,
}

M.keys = {
    { '<leader>nh', '<cmd>NoiceHistory<cr>', desc = 'Notification History' },
}

M.opts = {
    cmdline = {
        format = {
            cmdline = { title = '', icon = '  ' },
            lua = { title = '', icon = ' 󰢱 ' },
            help = { title = '', icon = ' 󰋖 ' },
        },
    },
    views = {
        cmdline_popup = {
            padding = { 0, 1 },
        },
        win_options = {
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
        },
    },
    lsp = {
        override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
}

M.config = true

return M
