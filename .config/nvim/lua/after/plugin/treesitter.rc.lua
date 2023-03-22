require 'nvim-treesitter.configs' .setup {
  ensure_installed = { "lua", "ruby", "vim", "typescript", "javascript", "python", "html", "css" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
