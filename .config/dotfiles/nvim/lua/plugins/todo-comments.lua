return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPre", "BufNewfile" },
	keys = {
		{
			"<leader>ft",
			function()
				require("snacks").picker.todo_comments()
			end,
			desc = "Find Comments",
		},
	},
	config = true,
}
