local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
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
        -- Snippets
        { name = "luasnip" },
        -- Text within current buffer
        { name = "buffer" },
        -- File paths
        { name = "path" },
    }),
})