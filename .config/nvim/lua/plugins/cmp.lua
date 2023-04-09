return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
  },
  config = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      local kind_icons = {
          Text = "",
          Method = "m",
          Function = "",
          Constructor = "",
          Field = "",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
      }

      local borderstyle = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      }

      cmp.setup({
          snippet = {
              expand = function(args)
                  luasnip.lsp_expand(args.body)
              end,
          },
          mapping = cmp.mapping.preset.insert {
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
            ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-e>"] = cmp.mapping {
              i = cmp.mapping.abort(),
              c = cmp.mapping.close(),
            },
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            ["<CR>"] = cmp.mapping.confirm { select = false },
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, {
              "i",
              "s",
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, {
              "i",
              "s",
            }),
          },
          formatting = {
              fields = { "kind", "abbr", "menu" },
              format = function(entry, vim_item)
                  vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                  vim_item.menu = ({
                      nvim_lsp = "[LSP]",
                      luasnip = "[Snip]",
                      buffer = "[Buff]",
                      path = "[Path]",
                  })[entry.source.name]
                  return vim_item
              end,
          },
          preselect = cmp.PreselectMode.None,
          completion = { completeopt = "noselect" },
          sources = cmp.config.sources({
              { name = "nvim_lsp", priority = 1000 },
              { name = "luasnip", priority = 750 },
              { name = "buffer", priority = 500 },
              { name = "path", priority = 250 },
          }),
          duplicates = {
              nvim_lsp = 1,
              luasnip = 1,
              buffer = 1,
              path = 1,
          },
          confirm_opts = {
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
          },
          window = {
              completion = borderstyle,
              documentation = borderstyle,
          },
          experimental = {
              ghost_text = false,
              native_menu = false,
          },
      })

      require("luasnip/loaders/from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
  end,
}
