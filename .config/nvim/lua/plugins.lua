-- PLUGIN SPEC
local plugins = {

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		cmd = {
			"TSUpdate",
			"TSInstall",
			"TSInstallInfo",
			"TSModuleInfo",
			"TSConfigInfo",
			"TSUpdateSync",
		},
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		opts = require("config.treesitter"),
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- autopair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		lazy = true,
		config = true,
	},

	-- autotag
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		lazy = true,
	},

	-- buff del
	{
		"famiu/bufdelete.nvim",
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("config.bufferline"),
		config = function(_, opts)
			require("bufferline").setup(opts)
		end,
	},

	-- craftzdog!
	{
		"craftzdog/solarized-osaka.nvim",
		priority = 1000,
		lazy = false,
		enable = false,
		init = function()
			vim.cmd.colorscheme("solarized-osaka")
		end,
		opts = { transparent = true, styles = { sidebars = "transparent", floats = "transparent" } },
		config = function(_, opts)
			require("solarized-osaka").setup(opts)
		end,
	},

	-- tokyo night
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		enable = true,
		init = function()
			vim.cmd.colorscheme("tokyonight")
		end,
		opts = require("config.tokyonight"),
		config = function(_, opts)
			require("tokyonight").setup(opts)
		end,
	},

	-- catpuccin probably

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- buf source
			"hrsh7th/cmp-buffer",
			-- system paths
			"hrsh7th/cmp-path",
			-- snippet engine
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
			},
			-- autocompletion
			"saadparwaiz1/cmp_luasnip",
			-- useful snippets
			"rafamadriz/friendly-snippets",
			-- autopairs
			"windwp/nvim-autopairs",
		},
		opts = require("config.cmp"),
		config = function(_, opts)
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			-- autopairs
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup(opts)
		end,
	},

	-- colorizer
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufRead",
		lazy = true,
		opts = require("config.colorizer"),
		config = function(_, opts)
			require("colorizer").setup(opts)
		end,
	},

	-- conform
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = require("config.conform"),
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},

	-- dressing
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

	-- fidget
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			window = {
				blend = 0,
			},
		},
		config = function(_, opts)
			require("fidget").setup(opts)
		end,
	},

	-- flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
	},

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		-- event = { "BufReadPre", "BufReadPost", "BufNewFile" },
		lazy = false,
		opts = require("config.gitsigns"),
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},

	-- ibl
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufRead" },
		opts = require("config.ibl"),
		config = function(_, opts)
			require("ibl").setup(opts)
		end,
	},

	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local lsp_util = require("util.lsp_util")

			-- signs
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, humhl = "" })
			end

			-- configure
			local installed_servers = mason_lspconfig.get_installed_servers()

			for _, server in pairs(installed_servers) do
				local config = lsp_util.default_config
				if lsp_util.server_config[server] then
					config = vim.tbl_deep_extend("force", config, lsp_util.server_config[server])
				end
				lspconfig[server].setup(config)
			end
		end,
	},

	-- mason
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		priority = 100,
		opts = require("config.mason"),
		config = function(_, opts)
			local mason = require("mason")
			local mr = require("mason-registry")
			local mason_lspconfig = require("mason-lspconfig")
			local lsp_util = require("util.lsp_util")

			-- mason
			mason.setup(opts)
			-- mason lsp config
			mason_lspconfig.setup({
				ensure_installed = lsp_util.ensure_installed,
				automatic_installation = true,
			})
			-- install linters
			for _, linter in pairs(lsp_util.lintersAndFormatters) do
				local p = mr.get_package(linter)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},

	-- neodev
	{
		"folke/neodev.nvim",
		opts = {},
	},

	-- noice
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		opts = require("config.noice"),
		config = function(_, opts)
			require("noice").setup(opts)
		end,
	},

	-- notify
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
	},

	-- nvim comment
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = require("config.comments"),
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},

	-- comment string
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
	},

	-- nvim lint
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			local linters = require("config.lint")

			lint.linters_by_ft = linters

			-- autocommand
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- nvim tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = true,
		cmd = {
			"NvimTreeOpen",
			"NvimTreeToggle",
			"NvimTreeFocus",
			"NvimTreeFindFile",
			"NvimTreeFindFileToggle",
		},
		opts = require("config.nvim-tree"),
		config = function(_, opts)
			-- diable netrw at start
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			-- term gui colors if not already set
			vim.opt.termguicolors = true
			require("nvim-tree").setup(opts)
		end,
	},

	-- surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		opts = require("config.telescope"),
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("ui-select")
		end,
	},

	-- tmux navigator
	{
		"christoomey/vim-tmux-navigator",
	},

	-- todo
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		opts = require("config.todo"),
		config = function(_, opts)
			require("todo-comments").setup(opts)
		end,
	},

	-- toggle term
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = require("config.toggleterm"),
		config = function(_, opts)
			require("toggleterm").setup(opts)
		end,
	},

	-- trouble
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "Trouble", "TroubleToggle" },
		lazy = true,
		opts = require("config.trouble"),
		config = function(_, opts)
			require("trouble").setup(opts)
		end,
	},

	-- which key
	{
		"folke/which-key.nvim",
		keys = { "<leader>" },
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			local opts = { prefix = "<leader>" }
			local mappings = require("config.whichkey")
			for _, v in pairs(mappings) do
				wk.register(v.mappings, v.opts)
			end
		end,
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("config.lualine"),
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
}

return plugins
