require 'nvim-treesitter.confs'.setup {
  ensure_installed = { "lua", "ruby", "vim", "typescript", "javascript", "python", "html", "css" },

  sync_install = false,
  auto_install = true,
  hightlight = {
    enablke = true,
  },
}
