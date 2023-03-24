-- local lspconfig_status, lspconfig = pcall(require, "lspconfig")
-- if not lspconfig_status then
--     return
-- end

-- local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not cmp_nvim_lsp_status then
--     return
-- end

-- local keymap = vim.keymap

-- -- Keybinds for LSP servers
-- local on_attach = function(client, bufnr)
--     local opts = { noremap = true, silent = true, buffer = bufnr }

--     -- Set Keybinds
--     keymap.set('n', "gf", "<cmd>Lspsage lsp_finder<CR>", opts)
--     keymap.set('n', "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--     keymap.set('n', "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
--     keymap.set('n', "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--     keymap.set('n', "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
--     keymap.set('n', "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
--     keymap.set('n', "<eader>d", "<cmd>Lspssaga show_line_diagnostics<CR>", opts)
--     keymap.set('n', "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
--     keymap.set('n', "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
--     keymap.set('n', "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
--     keymap.set('n', "K", "<cmd>Lspsaga hover_doc<CR>", opts)
--     keymap.set('n', "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
-- end

-- local capabilities = cmp_nvim_lsp.default_capabilities()

-- -- configure servers
-- for _, lsp in pairs(lspconfig) do
--     lspconfig[lsp].setup({
--         capabilities = capabilities,
--         on_attach = on_attach,
--     })
-- end

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.sourcekit.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})