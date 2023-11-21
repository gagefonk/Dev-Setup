return {
	-- leader mappings
	{
		opts = { prefix = "<leader>" },
		mappings = {
			-- file actions
			q = {
				name = "File",
				q = { ":q!<cr>", "Quit" },
				w = { ":wq!<cr>", "Save & Quit" },
				s = { ":w!<cr>", "Save" },
				f = {
					function()
						require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })
					end,
					"Format",
				},
				l = {
					function()
						require("lint").try_lint()
					end,
					"Lint",
				},
				x = {
					function()
						require("bufdelete").bufdelete(0, true)
					end,
					"Close",
				},
			},

			-- search/telescope
			f = {
				name = "Telescope",
				f = { ":Telescope find_files<cr>", "Files" },
				w = { ":Telescope live_grep<cr>", "Word" },
				t = { ":TodoTelescope<cr>", "Todo" },
				n = { ':lua require("telescope").extensions.notify.notify()<cr>', "Notifications" },
				h = { ":Telescope help_tags<cr>", "Help" },
				r = { ":Telescope oldfiles<cr>", "Old Files" },
			},

			-- trouble/ diagnostics
			x = {
				name = "Trouble",
				x = {
					function()
						require("trouble").toggle()
					end,
					"Trouble",
				},
				w = {
					function()
						require("trouble").toggle("workspace_diagnostics")
					end,
					"Workspace",
				},
				d = {
					function()
						require("trouble").toggle("document_diagnostics")
					end,
					"Document",
				},
				q = {
					function()
						require("trouble").toggle("quickfix")
					end,
					"Quickfix",
				},
			},

			-- file explorer
			e = { ":NvimTreeToggle<cr>", "Explorer" },

			-- misc
			l = {
				name = "Misc",
				l = { ":Lazy<cr>", "Lazy" },
				t = { ":Trouble<cr>", "Trouble" },
				m = { ":Mason<cr>", "Mason" },
			},

			-- git
			g = {
				name = "Git",
				k = { '<cmd>lua require"gitsigns".prev_hunk({navigation_message = false})<cr>', "Prev Hunk" },
				l = { '<cmd>lua require"gitsigns".blame_line()<cr>', "Blame" },
				p = { '<cmd>lua require"gitsigns".preview_hunk()<cr>', "Preview Hunk" },
				r = { '<cmd>lua require"gitsigns".reset_hunk()<cr>', "Reset Hunk" },
				R = { '<cmd>lua require"gitsigns".reset_buffer()<cr>', "Reset Buffer" },
				j = { '<cmd>lua require"gitsigns".next_hunk({navigation_message = false})<cr>', "Next Hunk" },
				s = { '<cmd>lua require"gitsigns".stage_hunk()<cr>', "Stage Hunk" },
				u = { '<cmd>lua require"gitsigns".undo_stage_hunk()<cr>', "Undo Stage" },
				o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
				b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
				c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
				d = { "<cmd>Gitsigns diffthis<cr>", "Git Diff" },
			},

			-- terminal
			["\\"] = {
				name = "Terminal",
				h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" },
				v = { "<cmd>ToggleTerm direction=vertical size=100 <cr>", "Vertical" },
				f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
			},

			-- splits
			s = {
				name = "split",
				s = { ":split<cr>", "Horizontal" },
				v = { ":vsplit<cr>", "Vertical" },
			},

			-- search and replace
			r = {
				name = "Replace",
				r = { ":%s/\\<<c-r><c-w>\\>/", "Replace under cursor" },
			},
		},
	},
	-- reg mappings
	{
		opts = {},
		mappings = {
			["<Tab>"] = { ":BufferLineCycleNext<cr>", "Buffer Next" },
			["<S-Tab>"] = { ":BufferLineCyclePrev<cr>", "Buffer Prev" },
		},
	},
	-- flash
	{
		opts = { mode = "n", "x", "o" },
		mappings = {
			s = {
				function()
					require("flash").jump()
				end,
				"Flash",
			},
			S = {
				function()
					require("flash").treesitter()
				end,
				"Flash Treesitter",
			},
			R = {
				function()
					require("flash").treesitter_search()
				end,
				"Treesitter Search",
			},
		},
	},
}
