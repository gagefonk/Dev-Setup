return function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local icons = require("util.lsp_util").icons.cmp_kinds
	require("luasnip.loaders.from_vscode").lazy_load()

	return {
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(_, vim_item)
				vim_item.kind = (icons[vim_item.kind] or "") .. vim_item.kind
				return vim_item
			end,
		},

		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

		completion = {
			completeopts = "menu,menuone,preview,noselect",
		},

		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		mapping = cmp.mapping.preset.insert({
			["<c-k>"] = cmp.mapping.select_prev_item(),
			["<c-j>"] = cmp.mapping.select_next_item(),
			["<c-b>"] = cmp.mapping.scroll_docs(-4),
			["<c-f>"] = cmp.mapping.scroll_docs(4),
			["<c-space>"] = cmp.mapping.complete(),
			["<c-e>"] = cmp.mapping.abort(),
			["<cr>"] = cmp.mapping.confirm({ select = false }),
		}),

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		}),
	}
end
