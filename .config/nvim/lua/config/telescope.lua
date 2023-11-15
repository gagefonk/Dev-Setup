return function()
	local actions = require("telescope.actions")
	local trouble = require("trouble.providers.telescope")

	return {
		pickers = {
			find_files = {
				find_command = {
					"fd",
					"--type",
					"f",
					"--color=never",
					"--hidden",
					"--follow",
					"-E",
					".git/*",
				},
			},
		},

		defaults = {
			prompt_prefix = "   ",
			selection_carat = " ",
			entry_prefix = " ",
			initial_mode = "insert",
			hidden = true,
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			-- winblend = 0,
			-- border = {},
			-- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },

			layout_config = {
				horizontal = {
					prompt_position = "bottom",
					preview_width = 0.55,
					results_width = 0.8,
				},

				width = 0.69,
				height = 0.75,
				preview_cutoff = 120,
			},

			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					["<esc>"] = actions.close,
					["<cr>"] = actions.select_default + actions.center,
					["<C-t>"] = trouble.open_with_trouble,
				},
				n = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					["<C-t>"] = trouble.open_with_trouble,
				},
			},
		},

		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	}
end

