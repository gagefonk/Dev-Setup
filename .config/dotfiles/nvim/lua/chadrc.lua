local api = vim.api
local M = {}

M.base46 = {
	-- theme = "rxyhn",
	theme = "catppuccin",
    -- theme = "tokyodark",
	transparency = false,
}

M.ui = {
	statusline = {
        theme = "minimal",
        separator_style = "round",
    },
	tabufline = {
		order = { "treeOffset", "buffers" },
		modules = {
			treeOffset = function()
				local w = 0
				for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
					if vim.bo[api.nvim_win_get_buf(win)].ft == "snacks_layout_box" then
						w = api.nvim_win_get_width(win)
					end
				end
				return w == 0 and "" or "%#NvimTreeNormal#" .. string.rep(" ", w) .. "%#NvimTreeWinSeparator#" .. "│"
			end,
		},
	},
}

return M
