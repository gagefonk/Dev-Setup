return {
    "jose-elias-alvarez/null-ls.nvim",
    event = "LspAttach",
    config = function()
        local nls = require("null-ls")

        nls.setup({
            debug = false,
            sources = {
                nls.builtins.formatting.stylua,
                nls.builtins.formatting.prettierd.with({
                    disabled_filetypes = { "markdown", "yaml" },
                }),
            },
        })
    end,
}