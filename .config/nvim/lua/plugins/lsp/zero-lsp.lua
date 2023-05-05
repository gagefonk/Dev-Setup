local M = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = false,
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {
            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required

        { 'onsails/lspkind.nvim' },
    }
}

M.keys = {
    { '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = 'Code Action' },
    { '<leader>lA', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', desc = 'Range Code Action' },
    { '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', desc = 'Definition' },
    { '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = 'Declaration' },
    { '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', desc = 'Implementation' },
    { '<leader>lo', '<cmd>lua vim.lsp.buf.type_definition()<cr>', desc = 'Type Definition' },
    { '<leader>lR', '<cmd>Telescope lsp_references<cr>', desc = 'References' },
    { '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', desc = 'Display Signature Information' },
    { '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', desc = 'Rename all references' },
    { '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>', desc = 'Format' },
    { '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<cr>', desc = 'Hover' },
    { '<leader>lt', '[[ <Esc><Cmd>lua require "telescope".extensions.refactoring.refactore()<CR>]]', desc = 'Refactor' },
}

M.config = function()
    local lsp = require('lsp-zero').preset("recommended")

    lsp.ensure_installed({
        'tsserver',
        'eslint',
        'rust_analyzer',
        'gopls',
        'bashls',
        'lua_ls',
    })
    lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
    end)

    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    require('lspconfig').eslint.setup({
        filestypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
        settings = {
            format = { enable = true },
            lint = { enable = true },
        },
    })

    lsp.skip_server_setup({ 'rust_analyzer', 'gopls' })
    lsp.setup()

    -- cmp icons
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local icons = require('extras.icons')
    local luasnip = require('luasnip')
    local cmp_mapping = require('cmp.config.mapping')
    local cmp_types = require('cmp.types.cmp')
    local utils = require('extras.utils')
    cmp.setup {
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                local max_width = 0
                if max_width ~= 0 and #vim_item.abbr > max_width then
                    vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
                end
                vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

                if entry.source.name == "copilot" then
                    vim_item.kind = icons.git.Octoface
                    vim_item.kind_hl_group = "CmpItemKindCopilot"
                end

                if entry.source.name == "crates" then
                    vim_item.kind = icons.misc.Package
                    vim_item.kind_hl_group = "CmpItemKindCrate"
                end

                if entry.source.name == "emoji" then
                    vim_item.kind = icons.misc.Smiley
                    vim_item.kind_hl_group = "CmpItemKindEmoji"
                end
                vim_item.menu = ({
                    nvim_lsp = "(LSP)",
                    emoji = "(Emoji)",
                    path = "(Path)",
                    calc = "(Calc)",
                    vsnip = "(Snippet)",
                    luasnip = "(Snippet)",
                    buffer = "(Buffer)",
                    tmux = "(TMUX)",
                    copilot = "(Copilot)",
                    treesitter = "(TreeSitter)",
                })[entry.source.name]
                vim_item.dup = ({
                    buffer = 1,
                    path = 1,
                    nvim_lsp = 0,
                    luasnip = 1,
                })[entry.source.name] or 0
                return vim_item
            end,
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = require('cmp.config.window').bordered(),
            documentation = require('cmp.config.window').bordered(),
        },
        sources = {
            {
                name = "copilot",
                -- keyword_length = 0,
                max_item_count = 3,
                trigger_characters = {
                    {
                        ".",
                        ":",
                        "(",
                        "'",
                        '"',
                        "[",
                        ",",
                        "#",
                        "*",
                        "@",
                        "|",
                        "=",
                        "-",
                        "{",
                        "/",
                        "\\",
                        "+",
                        "?",
                        " ",
                        -- "\t",
                        -- "\n",
                    },
                },
            },
            {
                name = "nvim_lsp",
                entry_filter = function(entry, ctx)
                    local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
                    if kind == "Snippet" and ctx.prev_context.filetype == "java" then
                        return false
                    end
                    if kind == "Text" then
                        return false
                    end
                    return true
                end,
            },

            { name = "path" },
            { name = "luasnip" },
            { name = "nvim_lua" },
            { name = "buffer" },
            { name = "calc" },
            { name = "emoji" },
            { name = "treesitter" },
            { name = "crates" },
            { name = "tmux" },
        },
        mapping = cmp_mapping.preset.insert {
            ["<C-k>"] = cmp_mapping(cmp_mapping.select_prev_item(), { "i", "c" }),
            ["<C-j>"] = cmp_mapping(cmp_mapping.select_next_item(), { "i", "c" }),
            ["<Down>"] = cmp_mapping(cmp_mapping.select_next_item { behavior = cmp_types.SelectBehavior.Select }, {
                "i" }),
            ["<Up>"] = cmp_mapping(cmp_mapping.select_prev_item { behavior = cmp_types.SelectBehavior.Select }, {
                "i" }),
            ["<C-d>"] = cmp_mapping.scroll_docs(-4),
            ["<C-f>"] = cmp_mapping.scroll_docs(4),
            ["<C-y>"] = cmp_mapping {
                i = cmp_mapping.confirm { behavior = cmp_types.ConfirmBehavior.Replace, select = false },
                c = function(fallback)
                    if cmp.visible() then
                        cmp.confirm { behavior = cmp_types.ConfirmBehavior.Replace, select = false }
                    else
                        fallback()
                    end
                end,
            },
            ["<Tab>"] = cmp_mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                elseif utils.jumpable(1) then
                    luasnip.jump(1)
                elseif utils.has_words_before() then
                    -- cmp.complete()
                    fallback()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp_mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-Space>"] = cmp_mapping.complete(),
            ["<C-e>"] = cmp_mapping.abort(),
            ["<CR>"] = cmp_mapping(function(fallback)
                if cmp.visible() then
                    local confirm_opts = vim.deepcopy({
                        behavior = cmp_types.ConfirmBehavior.Replace,
                        select = false,
                    }) -- avoid mutating the original opts below
                    local is_insert_mode = function()
                        return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
                    end
                    if is_insert_mode() then -- prevent overwriting brackets
                        confirm_opts.behavior = cmp_types.ConfirmBehavior.Insert
                    end
                    local entry = cmp.get_selected_entry()
                    local is_copilot = entry and entry.source.name == "copilot"
                    if is_copilot then
                        confirm_opts.behavior = cmp_types.ConfirmBehavior.Replace
                        confirm_opts.select = true
                    end
                    if cmp.confirm(confirm_opts) then
                        return -- success, exit early
                    end
                end
                fallback() -- if not exited early, always fallback
            end),
        },
    }
end

return M
