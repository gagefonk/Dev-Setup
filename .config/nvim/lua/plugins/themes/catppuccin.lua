return {
  'Catppuccin/nvim',
  lazy = false,
  priority = 1000,
  opts = {
    flavour = 'mocha',
    transparent_background = true,
    term_colors = true,
    integrations = {
      bufferline = true,
      indent_blankline = { enabled = true, colored_indent_levels = true },
      notify = true,
      telescope = true,
      treesitter = true,
      neotree = true,
      mason = true,
      markdown = true,
      which_key = true,
      gitsigns = true,
      lsp_trouble = true,
      lsp_saga = true,
      cmp = true,
      -- feline = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
      },
    },
    highlight_overrides = {
      mocha = function(cp)
        return {
          -- For base config
    --       NormalFloat = { fg = cp.text, bg = true and cp.none or cp.base },
          Cursorline = { bg = cp.base },
          CursorLineNr = { fg = cp.pink },
          LineNr = { fg = cp.lavender },
    --       Search = { bg = cp.surface0, fg = cp.pink, style = { "bold" } },
    --       IncSearch = { bg = cp.pink, fg = cp.surface1 },
    --       Keyword = { fg = cp.pink },
    --       Type = { fg = cp.blue },
    --       Typedef = { fg = cp.yellow },
    --       StorageClass = { fg = cp.red, style = { "italic" } },
    --       ColorColumn = { bg = cp.none },
    --       Visual = { bg = cp.surface2, style = { "bold" } },
    --       -- For native lsp configs.
    --       DiagnosticVirtualTextError = { bg = cp.none },
    --       DiagnosticVirtualTextWarn = { bg = cp.none },
    --       DiagnosticVirtualTextInfo = { bg = cp.none },
    --       DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },
    --       DiagnosticHint = { fg = cp.rosewater },
    --       LspDiagnosticsDefaultHint = { fg = cp.rosewater },
    --       LspDiagnosticsHint = { fg = cp.rosewater },
    --       LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
    --       LspDiagnosticsUnderlineHint = { sp = cp.rosewater },
    --       -- For trouble.nvim
    --       TroubleNormal = { bg = cp.base },
    --       -- Mason
    --       MasonHeader = { fg = cp.base, bg = cp.peach },
    --       MasonHeaderSecondary = { fg = cp.base, bg = cp.pink },
    --       MasonHighlight = { fg = cp.pink },
    --       MasonHighlightBlock = { bg = cp.pink, fg = cp.base },
    --       MasonHighlightBlockBold = { bg = cp.pink, fg = cp.base, bold = true },
    --       MasonHighlightSecondary = { fg = cp.red },
    --       MasonHighlightBlockSecondary = { bg = cp.red, fg = cp.base },
    --       MasonHighlightBlockBoldSecondary = { bg = cp.red, fg = cp.base, bold = true },
    --       MasonLink = { fg = cp.rosewater },
    --       MasonMuted = { fg = cp.overlay1 },
    --       MasonMutedBlock = { bg = cp.surface0, fg = cp.text },
    --       MasonMutedBlockBold = { bg = cp.surface0, fg = cp.overlay1, bold = true },
    --       MasonError = { fg = cp.red },
    --       MasonHeading = { bold = true },
    --       -- Lazy
    --       LazyButtonActive = { bold = true, fg = cp.base, bg = cp.pink },
    --       LazyButton = { fg = cp.text, bold = true },
    --       LazyH1 = { bold = true, fg = cp.base, bg = cp.peach },
    --       LazyH2 = { fg = cp.text, bold = true },
    --       LazySpecial = { fg = cp.lavender, bold = true },
    --       LazyProgressTodo = { fg = cp.base, bg = cp.base, bold = true },
    --       LazyProgressDone = { fg = cp.pink, bg = cp.base, bold = true },
    --       LazyReasonEvent = { fg = cp.peach, bold = true },
        }
      end,
    }
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd('colorscheme catppuccin')
  end,
}
