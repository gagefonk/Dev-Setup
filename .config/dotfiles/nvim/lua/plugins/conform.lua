return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>Ff",
			function()
				require("conform").format()
			end,
			desc = "Format",
		},
	},
	opts = {
		formatters_by_ft = {
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			lua = { "stylua" },
			python = { "black" },
			rust = { "rustfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			swift = { "swiftformat" },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "never",
		},
	},
}
