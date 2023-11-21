local M = {}

-- ensure installed
M.ensure_installed = {
	"bashls",
	"cssls",
	"dockerls",
	"gopls",
	"graphql",
	"html",
	"jsonls",
	"lua_ls",
	"tsserver",
	"pyright",
	"sqlls",
	"tailwindcss",
	"rust_analyzer",
	"yamlls",
}

-- linters
M.lintersAndFormatters = {
	-- linters
	"eslint_d",
	"pylint",

	-- formatters
	"prettier",
	"stylua",
	"isort",
	"black",
}

-- specific server config
M.server_config = {
	-- lua
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},

				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	},
	-- rust_analyzer
	rust_analyzer = {
		filetypes = { "rust" },
		cmd = { "rustup", "run", "stable", "rust-analyzer" },
	},
}

-- default capabilities
M.default_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- on attach functions
M.on_attach = function(client, bufnr)
	local keymap = vim.keymap
	local opts = { buffer = bufnr, noremap = true, silent = true }

	-- KEYBINDS
	-- references
	opts.desc = "Show LSP references"
	keymap.set("n", "gR", ":Telescope lsp_references<cr>", opts)
	-- declaration
	opts.desc = "Go to declaration"
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	-- definitions
	opts.desc = "Show LSP definitions"
	keymap.set("n", "gd", ":Telescope lsp_definitions<cr>", opts)
	-- implementations
	opts.desc = "Show LSP implementations"
	keymap.set("n", "gi", ":Telescope lsp_implementations<cr>", opts)
	-- type definitions
	opts.desc = "Show LSP type definitions"
	keymap.set("n", "gt", ":Telescope lsp_type_definitions<cr>", opts)
	-- code actions
	opts.desc = "See availale code actions"
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	-- buffer diagnostics
	opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<cr>", opts)
	-- line diagnostics
	opts.desc = "Show line diagnostics"
	keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
	-- prev diagnostic
	opts.desc = "Go to previous diagnostic"
	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	-- next diagnostic
	opts.desc = "Go to next diagnostic"
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts, opts)
	-- show doc under cursor
	opts.desc = "Show documentation under cursor"
	keymap.set("n", "K", vim.lsp.buf.hover, opts)
	-- restart
	opts.desc = "Restart LSP"
	keymap.set("n", "<leader>qr", ":LspRestart<cr>", opts)
end

M.icons = {
	cmp_kinds = {
		Text = "  ",
		Method = "  ",
		Function = "  ",
		Constructor = "  ",
		Field = "  ",
		Variable = "  ",
		Class = "  ",
		Interface = "  ",
		Module = "  ",
		Property = "  ",
		Unit = "  ",
		Value = "  ",
		Enum = "  ",
		Keyword = "  ",
		Snippet = "  ",
		Color = "  ",
		File = "  ",
		Reference = "  ",
		Folder = "  ",
		EnumMember = "  ",
		Constant = "  ",
		Struct = "  ",
		Event = "  ",
		Operator = "  ",
		TypeParameter = "  ",
	},
}

-- default config
M.default_config = {
	capabilities = M.default_capabilities,
	on_attach = M.on_attach,
}

return M
