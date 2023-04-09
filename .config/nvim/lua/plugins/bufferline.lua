return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  after = 'catppuccin',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- 'Catppuccin/nvim',
  },
  keys = {
        { '<leader>c', '<cmd>Bdelete!<CR>', desc = 'Close Buffer' },
        { 'b', "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Buffers" },
  },
  opts = {
    options = {
      close_command = 'Bdelete! %d',
      right_mouse_command = 'Bdelete! %d',
      left_mouse_command = 'buffer %d',
      diagnostics = "nvim_lsp",
      numbers = 'none',
      mode = "buffers",
      always_show_bufferline = true,
      diagnostics_indicator = function(_, _, diag)
        local icons = require('extras.icons').diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
