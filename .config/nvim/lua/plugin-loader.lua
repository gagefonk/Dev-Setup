local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if vim.fn.isdirectory(lazypath) == 0 then
  vim.notify("Installing lazy...", vim.log.levels.INFO, { title = "lazy.nvim" })
  vim.fn.system {
    "git",
    "clone",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end

vim.opt.runtimepath:prepend(lazypath)

local opts = {
  git = {
    log = { "--since=3 days ago" },
    timeout = 300,
    url_format = "https://github.com/%s.git",
  },
  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",
  ui = {
    size = { width = 0.8, height = 0.8 },
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "single",
    icons = {
      ft = "",
      lazy = "鈴",
      loaded = "",
      not_loaded = "",
      cmd = " ",
      config = "",
      event = "",
      init = " ",
      keys = " ",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
    },
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true,
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  performance = {
    rtp = {
      reset = false, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
		"netrw",
		"netrwPlugin",
		"netrwSettings",
		"netrwFileHandlers",
		"gzip",
		"zip",
		"zipPlugin",
		"tar",
		"tarPlugin",
		"getscript",
		"getscriptPlugin",
		"vimball",
		"vimballPlugin",
		"2html_plugin",
		"logipat",
		"rrhelper",
		"spellfile_plugin",
		"matchit",
      },
    },
  },
}

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup({
  spec = {
    { import = 'colorschemes' },
    { import = 'plugins' },
    { import = 'plugins.lsp' },
  },
  opts
})
