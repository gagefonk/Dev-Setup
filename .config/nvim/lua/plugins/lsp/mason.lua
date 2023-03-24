local mason_status, mason = pcall(require, "mason")
if not mason_status then
  print("Failed to load Mason.")
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  print("Failed to load mason_lspconfig.")
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "html",
    "tailwindcss",
    "dockerls",
    "eslint",
    "graphql",
    "jsonls",
    "tsserver",
    "pylsp",
    "sqlls",
  }
})