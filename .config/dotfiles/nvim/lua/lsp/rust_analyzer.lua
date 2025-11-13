return {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
        extraArgs = { "--all", "--", "-W", "clippy::all" },
      },
      cargo = {
        features = "all",
      },
      procMacro = {
        enable = true,
      },
    },
  },
}
