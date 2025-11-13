return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
    keys = {
        { "<S-k>", function() vim.lsp.buf.hover({ border = "rounded" }) end },
        {"<leader>ca", mode = { "n", "v" }, function() vim.lsp.buf.code_action({}) end, { desc = "Code Actions" }},
    },
	config = function()
		local lsp_config_path = vim.fn.stdpath('config') .. '/lua/lsp/'
		if vim.fn.isdirectory(lsp_config_path) == 1 then
			for _, file in ipairs(vim.fn.readdir(lsp_config_path, [[v:val =~ '\.lua$']])) do
				local server_name = file:gsub('%.lua$', '')
				vim.lsp.enable(server_name)
			end
		end
	end,
}
