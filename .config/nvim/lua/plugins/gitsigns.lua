local icons = require 'extras.icons'

local M = {
    'lewis6991/gitsigns.nvim',
    lazy = false,
}

M.keys = {
    { '<leader>Gj', '<cmd>lua require "gitsigns".next_hunk({navigation_message = false})<cr>', desc = 'Next Hunk' },
    { '<leader>Gk', '<cmd>lua require "gitsigns".prev_hunk({navigation_message = false})<cr>', desc = 'Prev Hunk' },
    { '<leader>Gl', '<cmd>lua require "gitsigns".blame_line()<cr>', desc = 'Blame' },
    { '<leader>Gp', '<cmd>lua require "gitsigns".preview_hunk()<cr>', desc = 'Preview Hunk' },
    { '<leader>Gr', '<cmd>lua require "gitsigns".reset_hunk()<cr>', desc = 'Reset Hunk' },
    { '<leader>GR', '<cmd>lua require "gitsigns".reset_buffer()<cr>', desc = 'Reset Buffer' },
    { '<leader>Gs', '<cmd>lua require "gitsigns".stage_hunk()<cr>', desc = 'Stage Hunk' },
    { '<leader>Gu', '<cmd>lua require "gitsigns".undo_stage_hunk()<cr>', desc = 'Undo Stage Hunk' },
    { '<leader>Go', '<cmd>Telescope git_status<cr>', desc = 'Open changed file' },
    { '<leader>Gb', '<cmd>Telescope git_branches<cr>', desc = 'Checkout branch' },
    { '<leader>Gc', '<cmd>Telescope git_commits<cr>', desc = 'Checkout commit' },
    { '<leader>GC', '<cmd>Telescope git_bcommits<cr>', desc = 'Checkout commit (for current file)' },
    { '<leader>Gd', '<cmd>Gitsigns diffthis HEAD<cr>', desc = 'Git Diff' },
}

M.opts = {
    signs = {
        add = {
            hl = 'GitSignsAdd',
            text = icons.ui.BoldLineLeft,
            numhl = 'GitSignsAddNr',
            linehl = 'GitSignsAddLn',
        },
        change = {
            hl = 'GitSignsChange',
            text = icons.ui.BoldLineLeft,
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn',
        },
        delete = {
            hl = 'GitSignsDelete',
            text = icons.ui.Triangle,
            numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn',
        },
        topdelete = {
            hl = 'GitSignsDelete',
            text = icons.ui.Triangle,
            numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn',
        },
        changedelete = {
            hl = 'GitSignsChange',
            text = icons.ui.BoldLineLeft,
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn',
        },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false,     -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',   -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    status_formatter = nil,     -- Use default
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
    },
    yadm = { enable = false },
}

M.config = function(_, opts)
    require 'gitsigns'.setup(opts)
end

return M
