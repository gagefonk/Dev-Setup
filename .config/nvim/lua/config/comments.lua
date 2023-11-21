return {
	hooks = {
		pre = function()
			require("ts_context_commentstring.internal").update_commentstring({})
		end,
	},
}
