return {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift", "objective-c", "objective-cpp" },
	root_dir = require("lspconfig.util").root_pattern("Package.swift", ".xcworkspace", ".xcodeproj", ".git"),
	init_options = {
		workspaceConfiguration = true,
	},
}
