return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opts = {} },
	},
	opts = {
		animate = { enabled = true },
		picker = {
			enabled = true,
			layout = { preset = "telescope", cycle = false },
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
		},
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
	},
	keys = {
		-- Explorer
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "Explorer",
		},

		-- Buffers
		{
			"<leader>rN",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename Current File",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Buffer Delete",
		},

		-- Picker
		{
			"<leader>fs",
			function()
				Snacks.picker.smart()
			end,
			desc = "Find Smart",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files({ hidden = true })
			end,
			desc = "Find Files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find Word",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Find Notifications",
		},
		{
			"<leader>fN",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Find Help",
		},

		-- Terminal
		{
			"<leader>tt",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},

		-- GIT
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},

		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
	},
}
