local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap

-- Keybinds for LSP servers
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Set Keybinds
    keymap.set('n', "gf", "<cmd>Lspsage lsp_finder<CR>", opts)
    keymap.set('n', "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap.set('n', "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap.set('n', "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap.set('n', "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    keymap.set('n', "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    keymap.set('n', "<eader>d", "<cmd>Lspssaga show_line_diagnostics<CR>", opts)
    keymap.set('n', "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    keymap.set('n', "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap.set('n', "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap.set('n', "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    keymap.set('n', "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure servers
for _, lsp in pairs(lspconfig) do
    lspconfig[lsp].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end