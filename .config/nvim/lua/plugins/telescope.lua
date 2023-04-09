return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "Telescope find_files" },
  keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find texts" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List Opened Buffers" },
      { "<leader>ft", "<cmd>Telescope treesitter<CR>", desc = "List Treesitter Variables" },
      { "<leader>fc", "<cmd>Telescope flutter commands<CR>", desc = "Flutter Commands" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git status" },
      { "<leader>gt", "<cmd>Telescope git_branches<CR>", desc = "Git branches" },
  },
  config = function()
      local scope = require("telescope")
      local actions = require("telescope.actions")
      local trouble = require("trouble.providers.telescope")
      scope.setup({
          defaults = {
              file_ignore_patterns = {
                  "%.git$",
                  "%.git[/\\]",
                  "node_modules",
                  "target",
                  "build",
                  "ios",
                  "android",
                  "linux",
                  "macos",
                  "web",
                  "windows",
                  "%.lock$",
              },
              color_devicons = true,
              mappings = {
                i = {
                  ["<C-n>"] = actions.cycle_history_next,
                  ["<C-p>"] = actions.cycle_history_prev,
          
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-k>"] = actions.move_selection_previous,
          
                  ["<C-c>"] = actions.close,
          
                  ["<Down>"] = actions.move_selection_next,
                  ["<Up>"] = actions.move_selection_previous,
          
                  ["<CR>"] = actions.select_default,
                  ["<C-x>"] = actions.select_horizontal,
                  ["<C-v>"] = actions.select_vertical,
                  ["<C-t>"] = actions.select_tab,
          
                  ["<C-u>"] = actions.preview_scrolling_up,
                  ["<C-d>"] = actions.preview_scrolling_down,
          
                  ["<PageUp>"] = actions.results_scrolling_up,
                  ["<PageDown>"] = actions.results_scrolling_down,
          
                  ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                  ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                  ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                  ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                  ["<C-l>"] = actions.complete_tag,
                  ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>

                  ["<esc>"] = actions.close,
                  ["<c-t>"] = trouble.open_with_trouble,
                },
          
                n = {
                  ["<esc>"] = actions.close,
                  ["<CR>"] = actions.select_default,
                  ["<C-x>"] = actions.select_horizontal,
                  ["<C-v>"] = actions.select_vertical,
                  ["<C-t>"] = actions.select_tab,
          
                  ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                  ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                  ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                  ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          
                  ["j"] = actions.move_selection_next,
                  ["k"] = actions.move_selection_previous,
                  ["H"] = actions.move_to_top,
                  ["M"] = actions.move_to_middle,
                  ["L"] = actions.move_to_bottom,
          
                  ["<Down>"] = actions.move_selection_next,
                  ["<Up>"] = actions.move_selection_previous,
                  ["gg"] = actions.move_to_top,
                  ["G"] = actions.move_to_bottom,
          
                  ["<C-u>"] = actions.preview_scrolling_up,
                  ["<C-d>"] = actions.preview_scrolling_down,
          
                  ["<PageUp>"] = actions.results_scrolling_up,
                  ["<PageDown>"] = actions.results_scrolling_down,
          
                  ["?"] = actions.which_key,

                  ["<esc>"] = actions.close,
                  ["dd"] = "delete_buffer",
                  ["<c-t>"] = trouble.open_with_trouble,
                },
              },
              layout_strategy = "vertical",
              layout_config = { height = 0.95, preview_height = 0.6, preview_cutoff = 0 },
              path_display = { "smart", shorten = { len = 3 } },
              dynamic_preview_title = true,
              wrap_results = true,
          },
          pickers = {
              find_files = { hidden = true },
              live_grep = {
                  additional_args = function()
                      return { "--hidden" }
                  end,
              },
          },
      })
  end,
}