return {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  settings = {
    python = {
      -- pythonPath = "/opt/homebrew/Caskroom/miniconda/base/envs/ml4t/bin/python",
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
