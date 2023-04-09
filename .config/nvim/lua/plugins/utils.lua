return {
    {
        'folke/neodev.nvim',
        lazy = true,
    },
    {
        'nvim-lua/plenary.nvim',
    },
    {
        'moll/vim-bbye',
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        ft = 'markdown',
    },
    {
      "rcarriga/nvim-notify",
      keys = {
        {
          "<leader>un",
          function()
            require("notify").dismiss({ silent = true, pending = true })
          end,
          desc = "Delete all Notifications",
        },
      },
      opts = {
          timeout = 2000,
          background_colour = '#000000',
          max_height = function()
              return math.floor(vim.o.lines * 0.75)
          end,
          max_width = function()
              return math.floor(vim.o.columns * 0.75)
          end,
      },
      init = function()
          vim.notify = require("notify")
      end,
    },
    {
        "tpope/vim-commentary",
        event = "BufReadPre",
    },
}