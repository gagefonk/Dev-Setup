local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    print("Failed to load cmp.")
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    print("Failed to load luasnip.")
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    print("Failed to load lspkind")
    return
end

-- Load friendly snippets
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expanded(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- Previous suggestion
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- Next suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- Scroll down
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        -- Scroll up
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- Show completion suggestions
        ["<C-Space>"] = cmp.mapping.complete(),
        -- Close completion
        ["<C-e>"] = cmp.mapping.abort(),
        -- Enter to choose
        ["<CR>"] = cmp.mapping.confirm({select = false}),
    }),
    sources = cmp.config.sources({
        -- LSP
        { name = "nvim_lsp" },
        -- Snippets
        { name = "luasnip" },
        -- Text within current buffer
        { name = "buffer" },
        -- File paths
        { name = "path" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
})