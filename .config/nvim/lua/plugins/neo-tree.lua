return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Explorer" },
  },
  opts = function()
    local icons = require('extras.icons').main_icons
    return {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      default_component_configs = {
        indent = { padding = 0, indent_size = 1 },
        icon = {
          folder_closed = icons["FolderClosed"],
          folder_open = icons["FolderOpen"],
          folder_empty = icons["FolderEmpty"],
          default = icons["DefaultFile"],
        },
        modified = { symbol = icons["FileModified"] },
        git_status = {
          symbols = {
            added = icons["GitAdd"],
            deleted = icons["GitDelete"],
            modified = icons["GitChange"],
            renamed = icons["GitRenamed"],
            untracked = icons["GitUntracked"],
            ignored = icons["GitIgnored"],
            unstaged = icons["GitUnstaged"],
            staged = icons["GitStaged"],
            conflict = icons["GitConflict"],
          },
        },
      },
      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(_) vim.opt_local.signcolumn = "auto" end,
        },
      },
    }
  end,
  config = function(_, opts)
    -- -- Remove legacy commands
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1]])

    require("neo-tree").setup(opts)
  end,
}