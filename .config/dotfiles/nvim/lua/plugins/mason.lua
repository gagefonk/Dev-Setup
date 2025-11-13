return {
	"mason-org/mason.nvim",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
			border = "rounded",
		},
	},
	config = function(_, opts)
		-- make sure these are mason registry names not lspconfig or other
		local ensure_installed = {
			-- lsp
			"json-lsp",
			"lua-language-server",
			"pyright",
			"tailwindcss-language-server",
			"typescript-language-server",
			"yaml-language-server",
			"bash-language-server",
			"rust-analyzer",
			"clangd",
			"cmake-language-server",
			-- formatters
			"stylua",
			"black",
			"prettier",
			"prettierd",
			-- "rustfmt", this is deprecated, install via rustup
			"clang-format",
			-- linters
			"flake8",
			"eslint_d",
			"luacheck",
			"cpplint",
			"swiftlint",
		}

		require("mason").setup(opts)
		local msr = require("mason-registry")

		-- refresh registries and then install any packages we dont already have
		msr.refresh(function()
			local tableUtils = require("utils.table-utils")
			local installed_packages = tableUtils.extract_key_to_table(msr.get_installed_packages(), "name")
			local diff = tableUtils.set_difference(ensure_installed, installed_packages)
			if next(diff) then
				vim.cmd(":MasonInstall " .. table.concat(diff, " "))
			end
		end)
	end,
}
