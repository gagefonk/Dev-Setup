return {
	ensure_installed = {
		"vim",
		"vimdoc",
		"lua",
		"luap",
		"luadoc",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"markdown",
		"markdown_inline",
		"regex",
		"bash",
		"go",
		"python",
		"rust",
	},

	auto_install = true,
	sync_install = false,
	context_commentstring = { enable = true, enable_autocmd = false },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },

	autotag = {
		enable = true,
		filetypes = { "html", "xml", "javascriptreact", "typescriptreact" },
	},
}
