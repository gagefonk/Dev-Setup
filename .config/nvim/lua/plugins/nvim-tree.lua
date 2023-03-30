return {
  'nvim-tree/nvim-tree.lua',
  cmd = 'NvimTree',
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = "NvimTree" }
  },
  config = {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = nvim_tree_config.nvim_tree_callback "edit" },
        { key = "h", cb = nvim_tree_config.nvim_tree_callback "close_node" },
        { key = "v", cb = nvim_tree_config.nvim_tree_callback "vsplit" },
      },
    },
  },
},
}